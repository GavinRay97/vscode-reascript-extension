import * as vscode from "vscode"
import * as defs from "./api-scraper/lua/results.json"
import { ReaScriptUSDocML, SignaturesClass } from "./api-scraper/reascript-USDocML.types"

const definitions = defs as ReaScriptUSDocML[]

function addMethodParamsToMarkdownDocs(markdown: vscode.MarkdownString, method: ReaScriptUSDocML) {
  markdown.appendMarkdown("\n")
  markdown.appendMarkdown("---")
  markdown.appendMarkdown("\n")
  for (const param of method.params.entries) {
    markdown.appendMarkdown(`\n***${param.identifier}***: ${param.description}\n`)
  }

  return markdown
}

function convertReaScriptDefinitionToSignatureInformation(
  definition: ReaScriptUSDocML,
  language: "lua" | "eel"
): vscode.SignatureInformation {
  const markdown = new vscode.MarkdownString()

  markdown.appendMarkdown(definition.description.description)
  addMethodParamsToMarkdownDocs(markdown, definition)

  const signature = new vscode.SignatureInformation(definition.functioncall[language]!, markdown)

  if (Array.isArray(definition.signatures))
    throw new Error("Got empty signature object for function")

  const params = definition.signatures[language]?.parameters
  if (!params) throw new Error("No parameters")

  // @ts-ignore
  signature.parameters = params.map((it: any) => {
    const paramEntry = definition.params.entries.find((entry) => entry.identifier == it.identifier)
    return new vscode.ParameterInformation(it.identifier, paramEntry?.description)
  })

  return signature
}

export function activate(context: vscode.ExtensionContext) {
  // SignatureHelpProvider shows the list of functions when providing autocomplete during typing/suggestion-trigger
  const reascriptSignatureProvider = vscode.languages.registerSignatureHelpProvider(
    "lua",
    {
      provideSignatureHelp(
        document: vscode.TextDocument,
        position: vscode.Position,
        token: vscode.CancellationToken,
        context: vscode.SignatureHelpContext
      ) {
        const range = document.getWordRangeAtPosition(position)
        const word = document.getText(range)

        // Try to find the current method name in the object list by matching the prefixes together
        const currentReaperMethod = definitions.find((it) => {
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
      },
    },
    {
      triggerCharacters: ["("],
      retriggerCharacters: [","],
    }
  )

  const reascriptCompletionProvider = vscode.languages.registerCompletionItemProvider(
    "lua",
    {
      provideCompletionItems(
        document: vscode.TextDocument,
        position: vscode.Position,
        token: vscode.CancellationToken,
        context: vscode.CompletionContext
      ) {
        const range = document.getWordRangeAtPosition(position)
        const word = document.getText(range)

        const matchingReaperMethods = definitions.filter((it) => {
          if (Array.isArray(it.signatures)) return false
          if (!it.signatures.lua) return false
          const methodName = it.signatures.lua.method_name
          if (!methodName) return false
          return methodName.toLowerCase().includes(word.toLowerCase())
        })
        if (!matchingReaperMethods.length) return undefined

        // Map through the methods that match the current text, construct a CompletionItem from each
        const completionItems = matchingReaperMethods.map((entry) => {
          const methodName = (entry.signatures as SignaturesClass).lua?.method_name!
          const suggestion = word.includes(".") ? methodName.split(".")[1] : methodName

          // Create the completion item from method name, add it's description as documentation
          const item = new vscode.CompletionItem(suggestion, vscode.CompletionItemKind.Method)
          const markdown = new vscode.MarkdownString()
          markdown.appendMarkdown(entry.description.description.trim())
          addMethodParamsToMarkdownDocs(markdown, entry)
          item.documentation = markdown

          return item
        })

        return completionItems
      },
    },
    "."
  )

  const reascriptHoverProvider = vscode.languages.registerHoverProvider("lua", {
    provideHover(
      document: vscode.TextDocument,
      position: vscode.Position,
      token: vscode.CancellationToken
    ) {
      const range = document.getWordRangeAtPosition(position)
      const word = document.getText(range)

      const method = definitions.find((it) => {
        if (Array.isArray(it.signatures)) return false
        if (!it.signatures.lua) return false
        return word == it.title
      })

      if (!method) return undefined

      const markdown = new vscode.MarkdownString()
      markdown.appendText(method.description.description.trim())
      addMethodParamsToMarkdownDocs(markdown, method)

      return new vscode.Hover(markdown)
    },
  })

  ////////////////////////////////////////////////////////////////////////////////////////////

  const eelSignatureProvider = vscode.languages.registerSignatureHelpProvider(
    "EEL",
    {
      provideSignatureHelp(
        document: vscode.TextDocument,
        position: vscode.Position,
        token: vscode.CancellationToken,
        context: vscode.SignatureHelpContext
      ) {
        const range = document.getWordRangeAtPosition(position)
        const word = document.getText(range)

        // Try to find the current method name in the object list by matching the prefixes together
        const currentReaperMethod = definitions.find((it) => {
          if (Array.isArray(it.signatures)) return false
          if (!it.signatures.eel) return false
          return (
            it.signatures.eel.method_name?.toLowerCase() ==
            word.replace("(", "").replace(")", "").toLowerCase()
          )
        })
        if (!currentReaperMethod) return undefined

        const signatureHelp = new vscode.SignatureHelp()
        signatureHelp.signatures.push(
          convertReaScriptDefinitionToSignatureInformation(currentReaperMethod, "eel")
        )

        return signatureHelp
      },
    },
    {
      triggerCharacters: ["("],
      retriggerCharacters: [","],
    }
  )

  const eelCompletionProvider = vscode.languages.registerCompletionItemProvider(
    "EEL",
    {
      provideCompletionItems(
        document: vscode.TextDocument,
        position: vscode.Position,
        token: vscode.CancellationToken,
        context: vscode.CompletionContext
      ) {
        const range = document.getWordRangeAtPosition(position)
        const word = document.getText(range)

        const matchingReaperMethods = definitions.filter((it) => {
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
      },
    },
    "."
  )

  const eelHoverProvider = vscode.languages.registerHoverProvider("EEL", {
    provideHover(
      document: vscode.TextDocument,
      position: vscode.Position,
      token: vscode.CancellationToken
    ) {
      const range = document.getWordRangeAtPosition(position)
      const word = document.getText(range)

      const method = definitions.find((it) => {
        if (Array.isArray(it.signatures)) return false
        if (!it.signatures.eel) return false
        return word == it.title
      })

      if (!method) return undefined

      const markdown = new vscode.MarkdownString()
      markdown.appendText(method.description.description)
      addMethodParamsToMarkdownDocs(markdown, method)

      return new vscode.Hover(markdown)
    },
  })

  context.subscriptions.push(
    reascriptSignatureProvider,
    reascriptCompletionProvider,
    reascriptHoverProvider,
    eelSignatureProvider,
    eelCompletionProvider,
    eelHoverProvider
  )
}
