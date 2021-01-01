"use strict";
/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = void 0;
const vscode = require("vscode");
const definitions = require("./reascript-api.json");
const reaperLuaMethodPrefixes = ["reaper.", "gfx."];
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
    const signature = new vscode.SignatureInformation(definition.body, definition.description);
    // Grabs the text in between the parenthesesis:
    // reaper.AddProjectMarker(ReaProject proj, boolean isrgn, number pos, number rgnend, string name, integer wantidx)
    const paramString = definition.body.substring(definition.body.indexOf("(") + 1, definition.body.indexOf(")") - 1);
    // Split by the commas to return array of params
    const params = paramString.split(",");
    signature.parameters = params.map((it) => new vscode.ParameterInformation(it));
    return signature;
}
function activate(context) {
    const reascriptSignatureProvider = vscode.languages.registerSignatureHelpProvider("lua", {
        provideSignatureHelp(document, position, token, context) {
            // If not a "reaper." or "gfx." method, don't do anything
            const linePrefix = document.lineAt(position).text.substr(0, position.character);
            // Try to find the current method name in the object list by matching the prefixes together
            const currentReaperMethod = Object.entries(definitions).find(([key, method]) => {
                return findOverlap(linePrefix, method.prefix) == method.prefix;
            });
            if (!currentReaperMethod)
                return undefined;
            const [methodIdentifier, method] = currentReaperMethod;
            const signatureHelp = new vscode.SignatureHelp();
            signatureHelp.signatures.push(convertReaScriptDefinitionToSignatureInformation(method));
            console.log({ linePrefix, signatureHelp, context });
            return signatureHelp;
        },
    }, {
        triggerCharacters: ["("],
        retriggerCharacters: [","],
    });
    const reascriptCompletionProvider = vscode.languages.registerCompletionItemProvider("lua", {
        provideCompletionItems(document, position, token, context) {
            // If not a "reaper." or  "gfx." method, don't do anything
            const linePrefix = document.lineAt(position).text.substr(0, position.character);
            // TODO: Using "linePrefix.trim()" here is the only way to make this work right and I have no idea why
            // which is mildly unsettling. Should probably try to figure this out again at some point, but I'm moving on.
            if (!reaperLuaMethodPrefixes.some((it) => linePrefix.trim().endsWith(it)))
                return undefined;
            // Try to find method names in the object list by matching the prefixes together
            const matchingReaperMethods = Object.entries(definitions).filter(([key, method]) => {
                // return linePrefix.trim().e
                const overlap = findOverlap(linePrefix, method.prefix);
                return overlap != "";
            });
            if (!matchingReaperMethods.length)
                return undefined;
            // Map through the methods that match the current text, construct a CompletionItem from each
            const completionItems = matchingReaperMethods.map(([_, entry]) => {
                // Split "reaper.AddMediaItemToTrack" into "reaper" and "AddMediaItemToTrack"
                const [__, methodName] = entry.prefix.split(".");
                // Create the completion item from method name, add it's description as documentation
                const item = new vscode.CompletionItem(methodName, vscode.CompletionItemKind.Method);
                item.documentation = new vscode.MarkdownString(entry.description);
                return item;
            });
            return completionItems;
        },
    }, ".");
    const reascriptHoverProvider = vscode.languages.registerHoverProvider("lua", {
        provideHover(document, position, token) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);
            const method = Object.entries(definitions).find(([key, method]) => {
                // Split "reaper.AddMediaItemToTrack" into "reaper" and "AddMediaItemToTrack"
                const [__, methodName] = method.prefix.split(".");
                console.log({ methodName, word });
                return word == methodName;
            });
            if (!method)
                return undefined;
            const [_, entry] = method;
            const markdown = new vscode.MarkdownString();
            markdown.appendText(entry.description);
            return new vscode.Hover(markdown);
        },
    });
    context.subscriptions.push(reascriptSignatureProvider, reascriptCompletionProvider, reascriptHoverProvider);
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map