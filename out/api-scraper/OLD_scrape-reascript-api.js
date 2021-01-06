"use strict";
/**
 * This script provides an easy API for scraping the ReaScript API methods from
 * https://www.reaper.fm/sdk/reascript/reascripthelp.html
 *
 * and dumping them into a JSON object in the format of { method: string , description: string }
 *
 * It takes a language name that maps to one of the supported ReaScript API languages (Lua, C, Eel, Python)
 * and the Document object returned by parsing the HTML in the ReaScript API page into DOM
 *
 * @example
 * const request = await axios.get("https://www.reaper.fm/sdk/reascript/reascripthelp.html")
 * const { document } = new JSDOM(request.data).window
 * const luaMethods = scrapeReaScriptAPI(document, "lua")
 */
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
const axios_1 = require("axios");
const jsdom_1 = require("jsdom");
const selectorMap = {
    lua: "div.l_func",
    c: "div.c_func",
    eel: "div.e_func",
    python: "div.p_func",
};
function scrapeReaScriptAPI(document, languageName) {
    const results = [];
    const methodDocumentNodes = document.querySelectorAll(selectorMap[languageName]);
    for (const node of methodDocumentNodes) {
        // Remove the prefix of the language name and colon preceeding the method name
        // Like "Lua: integer reaper.AddProjectMarker(...)"
        const langNameRegex = RegExp(`${languageName}: `, "gi");
        const method = node.textContent.replace(langNameRegex, "").trim();
        let description = "";
        let currentElement = null;
        while (true) {
            currentElement = currentElement ? currentElement.nextSibling : node.nextSibling;
            // Sanity check
            if (currentElement == null)
                break;
            // If it's a new function definition, stop
            // <a name="AddMediaItemToTrack"></a>
            if ((currentElement === null || currentElement === void 0 ? void 0 : currentElement.nodeName) == "A" && currentElement.hasAttribute("name"))
                break;
            // We have hit here:
            // <h2>ReaScript/EEL Built-in Function List</h2>
            if ((currentElement === null || currentElement === void 0 ? void 0 : currentElement.nodeName) == "H2")
                break;
            if (currentElement.nodeName != "#text")
                continue;
            description += currentElement.textContent;
        }
        // Remove newline/return characters from the description
        description = description.trim();
        results.push({ method, description });
    }
    return results;
}
// TODO: Function to scrape the section under "ReaScript/Lua Built-In Function list"
function scrapeLuaBuiltinFunctions() { }
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        const request = yield axios_1.default.get("https://www.reaper.fm/sdk/reascript/reascripthelp.html");
        const { document } = new jsdom_1.JSDOM(request.data).window;
        const luaMethods = scrapeReaScriptAPI(document, "lua");
        console.log(luaMethods);
    });
}
main().catch((err) => console.log("Err:", err));
//# sourceMappingURL=OLD_scrape-reascript-api.js.map