"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = void 0;
const vscode = require("vscode");
const defs = require("./api-scraper/lua/results.json");
const definitions = defs;
function addMethodParamsToMarkdownDocs(markdown, method) {
    markdown.appendMarkdown("\n");
    markdown.appendMarkdown("---");
    markdown.appendMarkdown("\n");
    for (const param of method.params.entries) {
        markdown.appendMarkdown(`\n***${param.identifier}***: ${param.description}\n`);
    }
    return markdown;
}
function convertReaScriptDefinitionToSignatureInformation(definition, language) {
    var _a;
    const markdown = new vscode.MarkdownString();
    markdown.appendMarkdown(definition.description.description);
    addMethodParamsToMarkdownDocs(markdown, definition);
    const signature = new vscode.SignatureInformation(definition.functioncall[language], markdown);
    if (Array.isArray(definition.signatures))
        throw new Error("Got empty signature object for function");
    const params = (_a = definition.signatures[language]) === null || _a === void 0 ? void 0 : _a.parameters;
    if (!params)
        throw new Error("No parameters");
    // @ts-ignore
    signature.parameters = params.map((it) => {
        const paramEntry = definition.params.entries.find((entry) => entry.identifier == it.identifier);
        return new vscode.ParameterInformation(it.identifier, paramEntry === null || paramEntry === void 0 ? void 0 : paramEntry.description);
    });
    return signature;
}
function activate(context) {
    // SignatureHelpProvider shows the list of functions when providing autocomplete during typing/suggestion-trigger
    const reascriptSignatureProvider = vscode.languages.registerSignatureHelpProvider("lua", {
        provideSignatureHelp(document, position, token, context) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            // Try to find the current method name in the object list by matching the prefixes together
            const currentReaperMethod = definitions.find((it) => {
                var _a;
                if (Array.isArray(it.signatures))
                    return false;
                if (!it.signatures.lua)
                    return false;
                return (((_a = it.signatures.lua.method_name) === null || _a === void 0 ? void 0 : _a.toLowerCase()) ==
                    word.replace("(", "").replace(")", "").toLowerCase());
            });
            if (!currentReaperMethod)
                return undefined;
            const signatureHelp = new vscode.SignatureHelp();
            signatureHelp.signatures.push(convertReaScriptDefinitionToSignatureInformation(currentReaperMethod, "lua"));
            return signatureHelp;
        },
    }, {
        triggerCharacters: ["("],
        retriggerCharacters: [","],
    });
    const reascriptCompletionProvider = vscode.languages.registerCompletionItemProvider("lua", {
        provideCompletionItems(document, position, token, context) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            const matchingReaperMethods = definitions.filter((it) => {
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
                addMethodParamsToMarkdownDocs(markdown, entry);
                item.documentation = markdown;
                return item;
            });
            return completionItems;
        },
    }, ".");
    const reascriptHoverProvider = vscode.languages.registerHoverProvider("lua", {
        provideHover(document, position, token) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            const method = definitions.find((it) => {
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
            addMethodParamsToMarkdownDocs(markdown, method);
            return new vscode.Hover(markdown);
        },
    });
    ////////////////////////////////////////////////////////////////////////////////////////////
    const eelSignatureProvider = vscode.languages.registerSignatureHelpProvider("EEL", {
        provideSignatureHelp(document, position, token, context) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            // Try to find the current method name in the object list by matching the prefixes together
            const currentReaperMethod = definitions.find((it) => {
                var _a;
                if (Array.isArray(it.signatures))
                    return false;
                if (!it.signatures.eel)
                    return false;
                return (((_a = it.signatures.eel.method_name) === null || _a === void 0 ? void 0 : _a.toLowerCase()) ==
                    word.replace("(", "").replace(")", "").toLowerCase());
            });
            if (!currentReaperMethod)
                return undefined;
            const signatureHelp = new vscode.SignatureHelp();
            signatureHelp.signatures.push(convertReaScriptDefinitionToSignatureInformation(currentReaperMethod, "eel"));
            return signatureHelp;
        },
    }, {
        triggerCharacters: ["("],
        retriggerCharacters: [","],
    });
    const eelCompletionProvider = vscode.languages.registerCompletionItemProvider("EEL", {
        provideCompletionItems(document, position, token, context) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            const matchingReaperMethods = definitions.filter((it) => {
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
                addMethodParamsToMarkdownDocs(markdown, entry);
                item.documentation = markdown;
                return item;
            });
            return completionItems;
        },
    }, ".");
    const eelHoverProvider = vscode.languages.registerHoverProvider("EEL", {
        provideHover(document, position, token) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            const method = definitions.find((it) => {
                if (Array.isArray(it.signatures))
                    return false;
                if (!it.signatures.eel)
                    return false;
                return word == it.title;
            });
            if (!method)
                return undefined;
            const markdown = new vscode.MarkdownString();
            markdown.appendText(method.description.description);
            addMethodParamsToMarkdownDocs(markdown, method);
            return new vscode.Hover(markdown);
        },
    });
    context.subscriptions.push(reascriptSignatureProvider, reascriptCompletionProvider, reascriptHoverProvider, eelSignatureProvider, eelCompletionProvider, eelHoverProvider);
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map