import * as vscode from "vscode"

import { ReaScriptUSDocML, SignaturesClass } from "../../api-scraper/reascript-USDocML.types"
import { addMethodParamsToMarkdownDocs } from "../../utils"

export class EelCompletionItemProvider implements vscode.CompletionItemProvider {
  public static triggerCharacters = ["."]

  constructor(private definitions: ReaScriptUSDocML[]) {}

  provideCompletionItems(
    document: vscode.TextDocument,
    position: vscode.Position,
    token: vscode.CancellationToken,
    context: vscode.CompletionContext
  ) {
    const range = document.getWordRangeAtPosition(position)
    const word = document.getText(range)

    const matchingReaperMethods = this.definitions.filter((it) => {
      if (Array.isArray(it.signatures)) return false
      if (!it.signatures.eel) return false
      const methodName = it.signatures.eel.method_name
      if (!methodName) return false
      return methodName.toLowerCase().includes(word.toLowerCase())
    })
    if (!matchingReaperMethods.length) return undefined

    // Map through the methods that match the current text, construct a CompletionItem from each
    const completionItems = matchingReaperMethods.map((entry) => {
      // Create the completion item from method name, add it's description as documentation
      const item = new vscode.CompletionItem(
        (entry.signatures as SignaturesClass).eel?.method_name!,
        vscode.CompletionItemKind.Method
      )
      const markdown = new vscode.MarkdownString()
      markdown.appendMarkdown(entry.description.description)
      addMethodParamsToMarkdownDocs(markdown, entry)
      item.documentation = markdown

      return item
    })

    return completionItems
  }

  register() {
    return vscode.languages.registerCompletionItemProvider(
      "EEL",
      this,
      ...EelCompletionItemProvider.triggerCharacters
    )
  }
}
