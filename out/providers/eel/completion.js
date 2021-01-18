"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.EelCompletionItemProvider = void 0;
const vscode = require("vscode");
const utils_1 = require("../../utils");
class EelCompletionItemProvider {
    constructor(definitions) {
        this.definitions = definitions;
    }
    provideCompletionItems(document, position, token, context) {
        const range = document.getWordRangeAtPosition(position);
        const word = document.getText(range);
        const matchingReaperMethods = this.definitions.filter((it) => {
            if (Array.isArray(it.signatures))
                return false;
            if (!it.signatures.eel)
                return false;
            const methodName = it.signatures.eel.method_name;
            if (!methodName)
                return false;
            return methodName.toLowerCase().includes(word.toLowerCase());
        });
        if (!matchingReaperMethods.length)
            return undefined;
        // Map through the methods that match the current text, construct a CompletionItem from each
        const completionItems = matchingReaperMethods.map((entry) => {
            var _a;
            // Create the completion item from method name, add it's description as documentation
            const item = new vscode.CompletionItem((_a = entry.signatures.eel) === null || _a === void 0 ? void 0 : _a.method_name, vscode.CompletionItemKind.Method);
            const markdown = new vscode.MarkdownString();
            markdown.appendMarkdown(entry.description.description);
            utils_1.addMethodParamsToMarkdownDocs(markdown, entry);
            item.documentation = markdown;
            return item;
        });
        return completionItems;
    }
    register() {
        return vscode.languages.registerCompletionItemProvider("EEL", this, ...EelCompletionItemProvider.triggerCharacters);
    }
}
exports.EelCompletionItemProvider = EelCompletionItemProvider;
EelCompletionItemProvider.triggerCharacters = ["."];
//# sourceMappingURL=completion.js.map