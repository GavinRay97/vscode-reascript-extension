"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LuaCompletionItemProvider = void 0;
const vscode = require("vscode");
const utils_1 = require("../../utils");
class LuaCompletionItemProvider {
    constructor(definitions) {
        this.definitions = definitions;
    }
    provideCompletionItems(document, position, token, context) {
        const range = document.getWordRangeAtPosition(position, /\S+/);
        const word = document.getText(range);
        const matchingReaperMethods = this.definitions.filter((it) => {
            if (Array.isArray(it.signatures))
                return false;
            if (!it.signatures.lua)
                return false;
            const methodName = it.signatures.lua.method_name;
            if (!methodName)
                return false;
            return methodName.toLowerCase().includes(word.toLowerCase());
        });
        if (!matchingReaperMethods.length)
            return undefined;
        // Map through the methods that match the current text, construct a CompletionItem from each
        const completionItems = matchingReaperMethods.map((entry) => {
            var _a;
            const methodName = (_a = entry.signatures.lua) === null || _a === void 0 ? void 0 : _a.method_name;
            const suggestion = word.includes(".") ? methodName.split(".")[1] : methodName;
            // Create the completion item from method name, add it's description as documentation
            const item = new vscode.CompletionItem(suggestion, vscode.CompletionItemKind.Method);
            const markdown = new vscode.MarkdownString();
            markdown.appendMarkdown(entry.description.description.trim());
            utils_1.addMethodParamsToMarkdownDocs(markdown, entry);
            item.documentation = markdown;
            return item;
        });
        return completionItems;
    }
    register() {
        return vscode.languages.registerCompletionItemProvider("lua", this, ...LuaCompletionItemProvider.triggerCharacters);
    }
}
exports.LuaCompletionItemProvider = LuaCompletionItemProvider;
LuaCompletionItemProvider.triggerCharacters = ["."];
//# sourceMappingURL=completion.js.map