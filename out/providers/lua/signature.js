"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LuaSignatureHelpProvider = void 0;
const vscode = require("vscode");
const utils_1 = require("../../utils");
class LuaSignatureHelpProvider {
    constructor(definitions) {
        this.definitions = definitions;
    }
    provideSignatureHelp(document, position, token, context) {
        const range = document.getWordRangeAtPosition(position, /\S+/);
        const word = document.getText(range);
        // Try to find the current method name in the object list by matching the prefixes together
        const currentReaperMethod = this.definitions.find((it) => {
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
        signatureHelp.signatures.push(utils_1.convertReaScriptDefinitionToSignatureInformation(currentReaperMethod, "lua"));
        return signatureHelp;
    }
    register() {
        return vscode.languages.registerSignatureHelpProvider("lua", this, {
            triggerCharacters: LuaSignatureHelpProvider.triggerCharacters,
            retriggerCharacters: LuaSignatureHelpProvider.triggerCharacters,
        });
    }
}
exports.LuaSignatureHelpProvider = LuaSignatureHelpProvider;
LuaSignatureHelpProvider.triggerCharacters = ["("];
LuaSignatureHelpProvider.retriggerCharacters = [","];
//# sourceMappingURL=signature.js.map