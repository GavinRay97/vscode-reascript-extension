import * as vscode from "vscode"

import { ReaScriptUSDocML } from "../../api-scraper/typescript/reascript-USDocML.types"
import { convertReaScriptDefinitionToSignatureInformation } from "../../utils"

export class LuaSignatureHelpProvider implements vscode.SignatureHelpProvider {
  public static triggerCharacters = ["("]
  public static retriggerCharacters = [","]

  constructor(private definitions: ReaScriptUSDocML[]) {}

  provideSignatureHelp(
    document: vscode.TextDocument,
    position: vscode.Position,
    token: vscode.CancellationToken,
    context: vscode.SignatureHelpContext
  ) {
    const range = document.getWordRangeAtPosition(position, /\S+/)
    const word = document.getText(range)

    // Try to find the current method name in the object list by matching the prefixes together
    const currentReaperMethod = this.definitions.find((it) => {
      if (Array.isArray(it.signatures)) return false
      if (!it.signatures.lua) return false
      return (
        it.signatures.lua.method_name?.toLowerCase() ==
        word.replace("(", "").replace(")", "").toLowerCase()
      )
    })
    if (!currentReaperMethod) return undefined

    const signatureHelp = new vscode.SignatureHelp()
    signatureHelp.signatures.push(
      convertReaScriptDefinitionToSignatureInformation(currentReaperMethod, "lua")
    )

    return signatureHelp
  }

  register() {
    return vscode.languages.registerSignatureHelpProvider("lua", this, {
      triggerCharacters: LuaSignatureHelpProvider.triggerCharacters,
      retriggerCharacters: LuaSignatureHelpProvider.triggerCharacters,
    })
  }
}
