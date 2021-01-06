"use strict";
/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = void 0;
const vscode = require("vscode");
const defs = require("./api-scraper/reaper-api-docs.json");
const ultraschall_reascript_api_types_1 = require("./api-scraper/ultraschall-reascript-api-types");
const definitions = defs;
function addMethodParamsToMarkdownDocs(markdown, method) {
    markdown.appendMarkdown("\n");
    markdown.appendMarkdown("---");
    markdown.appendMarkdown("\n");
    for (const param of method.parametersParsed) {
        markdown.appendMarkdown(`\n***${param.type}*** **${param.paramName}**: ${param.description}\n`);
    }
    return markdown;
}
function getDescriptionForAPIMethod(method) {
    if (typeof method.description == "string") {
        return method.description.trim();
    }
    if ("#text" in method.description) {
        return method.description["#text"].trim();
    }
    if (Array.isArray(method.description)) {
        const joined = method.description.join("\n").trim();
    }
    return "";
}
function getLuaDefinitionForAPIMethod(method) {
    if (method.functioncall) {
        if (!Array.isArray(method.functioncall)) {
            if (method.functioncall["@_prog_lang"] == ultraschall_reascript_api_types_1.ProgLang.Lua)
                return method.functioncall["#text"];
        }
        else {
            const luaMethod = method.functioncall.find((it) => it["@_prog_lang"] == ultraschall_reascript_api_types_1.ProgLang.Lua);
            if (luaMethod)
                return luaMethod["#text"];
        }
    }
    return "";
}
function findOverlap(a, b) {
    if (b.length === 0)
        return "";
    if (a.endsWith(b))
        return b;
    if (a.indexOf(b) >= 0)
        return b;
    return findOverlap(a, b.substring(0, b.length - 1));
}
function convertReaScriptDefinitionToSignatureInformation(definition) {
    var _a, _b;
    const methodCall = ((_a = definition.functioncallParsed.lua) === null || _a === void 0 ? void 0 : _a.methodName) +
        "(" + ((_b = definition.functioncallParsed.lua) === null || _b === void 0 ? void 0 : _b.parameters.map((it) => `${it.type} ${it.identifier}`).join(", ")) +
        ")";
    const markdown = new vscode.MarkdownString();
    markdown.appendMarkdown(getDescriptionForAPIMethod(definition));
    addMethodParamsToMarkdownDocs(markdown, definition);
    const signature = new vscode.SignatureInformation(getLuaDefinitionForAPIMethod(definition), markdown);
    signature.parameters = definition.parametersParsed.map((it) => new vscode.ParameterInformation(it.paramName, it.description));
    return signature;
}
function activate(context) {
    const reascriptSignatureProvider = vscode.languages.registerSignatureHelpProvider("lua", {
        provideSignatureHelp(document, position, token, context) {
            // If not a "reaper." or "gfx." method, don't do anything
            // const linePrefix = document.lineAt(position).text.substr(0, position.character)
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            console.log("SIGNATURE HELP");
            console.log({ word });
            // Try to find the current method name in the object list by matching the prefixes together
            const currentReaperMethod = definitions.find((it) => {
                var _a;
                if (!((_a = it.functioncallParsed) === null || _a === void 0 ? void 0 : _a.lua))
                    return false;
                return it.functioncallParsed.lua.methodName == word.replace("(", "").replace(")", "");
            });
            console.log({ currentReaperMethod });
            // const currentReaperMethod = Object.entries(definitions).find(([key, method]) => {
            //   return findOverlap(linePrefix, method.prefix) == method.prefix
            // })
            if (!currentReaperMethod)
                return undefined;
            const signatureHelp = new vscode.SignatureHelp();
            signatureHelp.signatures.push(convertReaScriptDefinitionToSignatureInformation(currentReaperMethod));
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
                var _a, _b;
                if (!it.functioncallParsed)
                    return false;
                const methodName = (_b = (_a = it.functioncallParsed) === null || _a === void 0 ? void 0 : _a.lua) === null || _b === void 0 ? void 0 : _b.methodName;
                if (!methodName)
                    return false;
                return methodName.includes(word);
            });
            if (!matchingReaperMethods.length)
                return undefined;
            // Map through the methods that match the current text, construct a CompletionItem from each
            const completionItems = matchingReaperMethods.map((entry) => {
                var _a;
                const methodName = (_a = entry.functioncallParsed.lua) === null || _a === void 0 ? void 0 : _a.methodName;
                const suggestion = word.includes(".") ? methodName.split(".")[1] : methodName;
                // Create the completion item from method name, add it's description as documentation
                const item = new vscode.CompletionItem(suggestion, vscode.CompletionItemKind.Method);
                const markdown = new vscode.MarkdownString();
                markdown.appendMarkdown(getDescriptionForAPIMethod(entry));
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
                var _a;
                if (!((_a = it.functioncallParsed) === null || _a === void 0 ? void 0 : _a.lua))
                    return false;
                return word == it.slug || word == it.title;
            });
            if (!method)
                return undefined;
            const markdown = new vscode.MarkdownString();
            markdown.appendText(getDescriptionForAPIMethod(method));
            addMethodParamsToMarkdownDocs(markdown, method);
            return new vscode.Hover(markdown);
        },
    });
    context.subscriptions.push(reascriptSignatureProvider, reascriptCompletionProvider, reascriptHoverProvider);
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map