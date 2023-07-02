import * as vscode from "vscode"
import { ReaScriptUSDocML, SignaturesClass } from "./api-scraper/typescript/reascript-USDocML.types"

export function addMethodParamsToMarkdownDocs(
  markdown: vscode.MarkdownString,
  method: ReaScriptUSDocML
) {
  markdown.appendMarkdown("\n")
  markdown.appendMarkdown("---")
  markdown.appendMarkdown("\n")

  for (const param of method.params.entries) {
    markdown.appendMarkdown("\n")
    markdown.appendMarkdown(`***${param.identifier}***: ${param.description}`)
    markdown.appendMarkdown("\n")
  }

  return markdown
}

export function convertReaScriptDefinitionToSignatureInformation(
  definition: ReaScriptUSDocML,
  language: keyof SignaturesClass
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
