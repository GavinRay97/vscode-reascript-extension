import * as vscode from "vscode"

import { ReaScriptUSDocML } from "../../api-scraper/reascript-USDocML.types"
import { addMethodParamsToMarkdownDocs } from "../../utils"

export class LuaHoverProvider implements vscode.HoverProvider {
  constructor(private definitions: ReaScriptUSDocML[]) {}

  provideHover(
    document: vscode.TextDocument,
    position: vscode.Position,
    token: vscode.CancellationToken
  ) {
    const range = document.getWordRangeAtPosition(position)
    const word = document.getText(range)

    const method = this.definitions.find((it) => {
      if (Array.isArray(it.signatures)) return false
      if (!it.signatures.lua) return false
      return word == it.title
    })
    if (!method) return undefined

    const markdown = new vscode.MarkdownString()
    markdown.appendText(method.description.description.trim())
    addMethodParamsToMarkdownDocs(markdown, method)

    return new vscode.Hover(markdown)
  }

  register() {
    return vscode.languages.registerHoverProvider("lua", this)
  }
}
