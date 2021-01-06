"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const path = require("path");
const fs = require("fs/promises");
const parser = require("fast-xml-parser");
const ultraschall_reascript_api_types_1 = require("./ultraschall-reascript-api-types");
/**
 * @example
 * const tupleSignature = "boolean retval, string presetname = reaper.TakeFX_GetPreset(MediaItem_Take take, integer fx, string presetname)"
 * parseLuaMethodSignature(tupleSignature)
 *
 * const primitiveSignature = "boolean = reaper.TrackFX_SetPinMappings(MediaTrack tr, integer fx, integer is, integer pin, integer low32bits, integer hi32bits)"
 * parseLuaMethodSignature(primitiveSignature)
 *
 * const voidSignature = "reaper.adjustZoom(number amt, integer forceset, boolean doupd, integer centermode)"
 * parseLuaMethodSignature(voidSignature)
 */
function parseLuaMethodSignature(description) {
    var _a;
    const methodIdentifierRegex = /(?<method>\w+\.\w+).+\)/g;
    const typeIdentifierRegex = /(?<type>\w+) (?<identifier>\w+),?/g;
    const methodMatch = methodIdentifierRegex.exec(description);
    const methodName = (_a = methodMatch === null || methodMatch === void 0 ? void 0 : methodMatch.groups) === null || _a === void 0 ? void 0 : _a.method;
    const signature = {
        methodName,
        parameters: [],
        returnValues: [],
    };
    if (!description.includes("=")) {
        // Void method call, like "reaper.adjustZoom(...)"
        const parameters = description.matchAll(typeIdentifierRegex);
        if (!parameters)
            throw new Error("Somehow no matched parameters in parseLuaMethodSignature");
        for (const parameter of parameters) {
            signature.parameters.push(parameter.groups);
        }
        return signature;
    }
    const [returnValString, methodcall] = description.split("=");
    const returnVals = returnValString.split(",").map((it) => it.trim());
    const parameters = methodcall.matchAll(typeIdentifierRegex);
    if (!parameters)
        throw new Error("Somehow no matched parameters in parseLuaMethodSignature");
    for (const parameter of parameters) {
        signature.parameters.push(parameter.groups);
    }
    // If there's only one return value, it's a primitive type (integer, boolean, etc)
    // Push it into return values without any identifier, and then stop + return the results
    if (returnVals.length == 1) {
        const [type] = returnVals;
        signature.returnValues.push({ type });
        return signature;
    }
    // If we reach here, it's a tuple-returning function, IE:
    // boolean retval, string presetname = reaper.TakeFX_GetPreset(...)
    for (const match of returnValString.matchAll(typeIdentifierRegex)) {
        signature.returnValues.push(match.groups);
    }
    return signature;
}
// Grabs all tool versions from "requires" tag
function processRequiresTag(method) {
    if (!method.requires)
        return {};
    const regex = /(?<tool>\w+)=(?<version>.+)/g;
    const results = {};
    for (const match of method.requires.matchAll(regex)) {
        if (!match.groups)
            continue;
        const tool = match.groups.tool.toLowerCase();
        results[tool] = match.groups.version;
    }
    return results;
}
function processParameters(method) {
    var _a;
    if (!method.parameters)
        return [];
    const parameters = typeof method.parameters == "string" ? method.parameters : (_a = method.parameters) === null || _a === void 0 ? void 0 : _a["#text"];
    const results = [];
    let lastIdx = 0;
    const lines = parameters.split("\n").map((it) => it.trim());
    for (let line of lines) {
        if (line.charAt(0) != "-") {
            const [param, description] = line.split(" - ");
            const [type, paramName] = param.split(" ");
            results.push({ paramName, type, description });
            lastIdx += 1;
        }
        else {
            results[lastIdx - 1].description += "\n\t" + line;
        }
    }
    return results;
}
function processTags(method) {
    return method.tags.split(", ");
}
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        const filepath = path.join(__dirname, "reaper-api-docs-fixed.xml");
        const xml = yield fs.readFile(filepath, "utf-8");
        const parsed = parser.parse(xml, {
            // Here, we don't try to parse the "description" section, as it may contain HTML tags which would get parsed as JSON keys
            // "stopNodes : an array of tag names which are not required to be parsed. Instead their values are parsed as string."
            stopNodes: ["description"],
            ignoreAttributes: false,
            attributeNamePrefix: "@_",
            textNodeName: "#text",
        });
        const docs = parsed.USDocBloc.US_DocBloc;
        const titlesToSkip = [
            "1 Introduction to ReaScript",
            "2.1 CPP Api-Description",
            "2.2 EEL Api-Description",
            "2.3 Python Api-Description",
            "2.4 Lua Api-Description",
            "3 Datatypes used in this document",
        ];
        const results = [];
        for (const item of docs) {
            if (titlesToSkip.includes(item.title))
                continue;
            const clone = Object.assign({}, item);
            clone.requiresParsed = processRequiresTag(clone);
            clone.parametersParsed = processParameters(clone);
            clone.tagsParsed = processTags(clone);
            if (item.functioncall) {
                if (!Array.isArray(item.functioncall)) {
                    if (item.functioncall["@_prog_lang"] == ultraschall_reascript_api_types_1.ProgLang.Lua)
                        clone.functioncallParsed = {
                            lua: parseLuaMethodSignature(item.functioncall["#text"]),
                        };
                }
                else {
                    const luaMethod = item.functioncall.find((it) => it["@_prog_lang"] == ultraschall_reascript_api_types_1.ProgLang.Lua);
                    if (luaMethod)
                        clone.functioncallParsed = {
                            lua: parseLuaMethodSignature(luaMethod["#text"]),
                        };
                }
            }
            results.push(clone);
        }
        const outfile = path.join(__dirname, "reaper-api-docs.json");
        yield fs.writeFile(outfile, JSON.stringify(results, null, 2));
    });
}
main().catch(console.log);
//# sourceMappingURL=parse-and-expand-ultraschall-xml-to-json.js.map