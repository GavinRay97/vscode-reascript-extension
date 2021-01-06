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
const fs = require("fs/promises");
const path = require("path");
const axios_1 = require("axios");
/**
 * ========================================================
 * This script fixes and escapes the XML provdided
 * from Ultraschall docs so that it properly parses
 * ========================================================
 */
/**
 * Credit to X-Raym, see: https://forum.cockos.com/showpost.php?p=2182879&postcount=295
 */
function fixUltraschallXML(text) {
    text = text.replace("<functionname>", "functionname");
    text = text.replace(/&/gm, "&amp;");
    text = text.replace(/<br>/gm, "");
    text = text.replace(/pamrameters/gm, "parameters");
    text = text.replace(/parmeters/gm, "parameters");
    text = text.replace(/indent="default"/gm, "");
    text = text.replace(/>>/gm, ">");
    text = text.replace(/<=/gm, "&lt;=");
    text = text.replace(/< :/gm, "&lt; :");
    text = text.replace(/\|</gm, "|&lt;");
    text = text.replace(/<0/gm, "&lt;0");
    text = text.replace(/<</gm, "&lt;&lt;");
    text = text.replace(/=</gm, "=&lt; ");
    text = text.replace(/ < /gm, " &lt; ");
    text = text.replace(/V, </gm, "V, &lt; ");
    return text;
}
function fetchLatestUltraschallReaScriptAPIDocs() {
    return __awaiter(this, void 0, void 0, function* () {
        const request = yield axios_1.default.get("https://raw.githubusercontent.com/Ultraschall/ultraschall-lua-api-for-reaper/master/ultraschall_api/DocsSourcefiles/reaper-apidocs.USDocML");
        return request.data;
    });
}
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        const xml = yield fetchLatestUltraschallReaScriptAPIDocs();
        const parsedXML = fixUltraschallXML(xml);
        const outpath = path.join(__dirname, "reaper-api-docs-fixed.xml");
        yield fs.writeFile(outpath, parsedXML);
    });
}
main().catch((err) => {
    console.log("Got error while attempting to fetch and parse Ultraschall API docs XML", err);
});
//# sourceMappingURL=fix-and-escape-ultraschall-xml.js.map