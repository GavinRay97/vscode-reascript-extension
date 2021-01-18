"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.convertReaScriptDefinitionToSignatureInformation = exports.addMethodParamsToMarkdownDocs = void 0;
const vscode = require("vscode");
function addMethodParamsToMarkdownDocs(markdown, method) {
    markdown.appendMarkdown("\n");
    markdown.appendMarkdown("---");
    markdown.appendMarkdown("\n");
    for (const param of method.params.entries) {
        markdown.appendMarkdown("\n");
        markdown.appendMarkdown(`***${param.identifier}***: ${param.description}`);
        markdown.appendMarkdown("\n");
    }
    return markdown;
}
exports.addMethodParamsToMarkdownDocs = addMethodParamsToMarkdownDocs;
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
exports.convertReaScriptDefinitionToSignatureInformation = convertReaScriptDefinitionToSignatureInformation;
//# sourceMappingURL=utils.js.map