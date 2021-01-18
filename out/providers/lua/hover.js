"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LuaHoverProvider = void 0;
const vscode = require("vscode");
const utils_1 = require("../../utils");
class LuaHoverProvider {
    constructor(definitions) {
        this.definitions = definitions;
    }
    provideHover(document, position, token) {
        const range = document.getWordRangeAtPosition(position);
        const word = document.getText(range);
        const method = this.definitions.find((it) => {
            if (Array.isArray(it.signatures))
                return false;
            if (!it.signatures.lua)
                return false;
            return word == it.title;
        });
        if (!method)
            return undefined;
        const markdown = new vscode.MarkdownString();
        markdown.appendText(method.description.description.trim());
        utils_1.addMethodParamsToMarkdownDocs(markdown, method);
        return new vscode.Hover(markdown);
    }
    register() {
        return vscode.languages.registerHoverProvider("lua", this);
    }
}
exports.LuaHoverProvider = LuaHoverProvider;
//# sourceMappingURL=hover.js.map