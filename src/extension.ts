/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/

import * as vscode from "vscode"
import * as defs from "./api-scraper/reaper-api-docs.json"
import {
  ProcessedUltraschallReaScriptAPIDoc,
  ProgLang,
} from "./api-scraper/ultraschall-reascript-api-types"

const definitions = defs as ProcessedUltraschallReaScriptAPIDoc[]

function addMethodParamsToMarkdownDocs(
  markdown: vscode.MarkdownString,
  method: ProcessedUltraschallReaScriptAPIDoc
) {
  markdown.appendMarkdown("\n")
  markdown.appendMarkdown("---")
  markdown.appendMarkdown("\n")
  for (const param of method.parametersParsed) {
    markdown.appendMarkdown(`\n***${param.type}*** **${param.paramName}**: ${param.description}\n`)
  }

  return markdown
}

function getDescriptionForAPIMethod(method: ProcessedUltraschallReaScriptAPIDoc) {
  if (typeof method.description == "string") {
    return method.description.trim()
  }
  if ("#text" in method.description) {
    return method.description["#text"].trim()
  }
  if (Array.isArray(method.description)) {
    return method.description.join("\n").trim()
  }
  return ""
}

function getLuaDefinitionForAPIMethod(method: ProcessedUltraschallReaScriptAPIDoc) {
  if (method.functioncall) {
    if (!Array.isArray(method.functioncall)) {
      if (method.functioncall["@_prog_lang"] == ProgLang.Lua) return method.functioncall["#text"]
    } else {
      const luaMethod = method.functioncall.find((it) => it["@_prog_lang"] == ProgLang.Lua)
      if (luaMethod) return luaMethod["#text"]
    }
  }
  return ""
}

function convertReaScriptDefinitionToSignatureInformation(
  definition: ProcessedUltraschallReaScriptAPIDoc
): vscode.SignatureInformation {
  const markdown = new vscode.MarkdownString()
  markdown.appendMarkdown(getDescriptionForAPIMethod(definition))
  addMethodParamsToMarkdownDocs(markdown, definition)

  const signature = new vscode.SignatureInformation(
    getLuaDefinitionForAPIMethod(definition),
    markdown
  )
  signature.parameters = definition.parametersParsed.map(
    (it) => new vscode.ParameterInformation(it.paramName, it.description)
  )

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
        // If not a "reaper." or "gfx." method, don't do anything
        // const linePrefix = document.lineAt(position).text.substr(0, position.character)
        const range = document.getWordRangeAtPosition(position)
        const word = document.getText(range)

        // Try to find the current method name in the object list by matching the prefixes together
        const currentReaperMethod = definitions.find((it) => {
          if (!it.functioncallParsed?.lua) return false
          return (
            it.functioncallParsed.lua!.methodName.toLowerCase() ==
            word.replace("(", "").replace(")", "").toLowerCase()
          )
        })
        if (!currentReaperMethod) return undefined

        const signatureHelp = new vscode.SignatureHelp()
        signatureHelp.signatures.push(
          convertReaScriptDefinitionToSignatureInformation(currentReaperMethod)
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
          if (!it.functioncallParsed) return false
          const methodName = it.functioncallParsed?.lua?.methodName
          if (!methodName) return false
          return methodName.toLowerCase().includes(word.toLowerCase())
        })
        if (!matchingReaperMethods.length) return undefined

        // Map through the methods that match the current text, construct a CompletionItem from each
        const completionItems = matchingReaperMethods.map((entry) => {
          const methodName = entry.functioncallParsed.lua?.methodName!
          const suggestion = word.includes(".") ? methodName.split(".")[1] : methodName

          console.log({ methodName, suggestion })

          // Create the completion item from method name, add it's description as documentation
          const item = new vscode.CompletionItem(suggestion, vscode.CompletionItemKind.Method)
          const markdown = new vscode.MarkdownString()
          markdown.appendMarkdown(getDescriptionForAPIMethod(entry))
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
        if (!it.functioncallParsed?.lua) return false
        return word == it.slug || word == it.title
      })

      if (!method) return undefined

      const markdown = new vscode.MarkdownString()
      markdown.appendText(getDescriptionForAPIMethod(method))
      addMethodParamsToMarkdownDocs(markdown, method)

      return new vscode.Hover(markdown)
    },
  })

  context.subscriptions.push(
    reascriptSignatureProvider,
    reascriptCompletionProvider,
    reascriptHoverProvider
  )
}
