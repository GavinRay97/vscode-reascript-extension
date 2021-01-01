"use strict";
/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = void 0;
const vscode = require("vscode");
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
    const signatureProvider = vscode.languages.registerSignatureHelpProvider("lua", {
        provideSignatureHelp(document, position, token, context) {
            const signatureHelp = new vscode.SignatureHelp();
            const signature1 = new vscode.SignatureInformation("reaper.AddMediaItemToTrack(MediaTrack tr)", "creates a new media item.");
            signature1.parameters = [
                new vscode.ParameterInformation("MediaTrack tr", "A media track"),
            ];
            signatureHelp.signatures = [signature1];
            return signatureHelp;
        },
    }, "(");
    const provider1 = vscode.languages.registerCompletionItemProvider("plaintext", {
        provideCompletionItems(document, position, token, context) {
            // a simple completion item which inserts `Hello World!`
            const simpleCompletion = new vscode.CompletionItem("Hello World!");
            // a completion item that inserts its text as snippet,
            // the `insertText`-property is a `SnippetString` which will be
            // honored by the editor.
            const snippetCompletion = new vscode.CompletionItem("Good part of the day");
            snippetCompletion.insertText = new vscode.SnippetString("Good ${1|morning,afternoon,evening|}. It is ${1}, right?");
            snippetCompletion.documentation = new vscode.MarkdownString("Inserts a snippet that lets you select the _appropriate_ part of the day for your greeting.");
            // a completion item that can be accepted by a commit character,
            // the `commitCharacters`-property is set which means that the completion will
            // be inserted and then the character will be typed.
            const commitCharacterCompletion = new vscode.CompletionItem("console");
            commitCharacterCompletion.commitCharacters = ["."];
            commitCharacterCompletion.documentation = new vscode.MarkdownString("Press `.` to get `console.`");
            // a completion item that retriggers IntelliSense when being accepted,
            // the `command`-property is set which the editor will execute after
            // completion has been inserted. Also, the `insertText` is set so that
            // a space is inserted after `new`
            const commandCompletion = new vscode.CompletionItem("new");
            commandCompletion.kind = vscode.CompletionItemKind.Keyword;
            commandCompletion.insertText = "new ";
            commandCompletion.command = {
                command: "editor.action.triggerSuggest",
                title: "Re-trigger completions...",
            };
            // return all completion items as array
            return [
                simpleCompletion,
                snippetCompletion,
                commitCharacterCompletion,
                commandCompletion,
            ];
        },
    });
    const provider2 = vscode.languages.registerCompletionItemProvider("plaintext", {
        provideCompletionItems(document, position) {
            // get all text until the `position` and check if it reads `console.`
            // and if so then complete if `log`, `warn`, and `error`
            const linePrefix = document
                .lineAt(position)
                .text.substr(0, position.character);
            if (!linePrefix.endsWith("console.")) {
                return undefined;
            }
            return [
                new vscode.CompletionItem("log", vscode.CompletionItemKind.Method),
                new vscode.CompletionItem("warn", vscode.CompletionItemKind.Method),
                new vscode.CompletionItem("error", vscode.CompletionItemKind.Method),
            ];
        },
    }, "." // triggered whenever a '.' is being typed
    );
    context.subscriptions.push(provider1, provider2, signatureProvider);
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map