import * as vscode from "vscode"
import * as defs from "./api-scraper/lua/results.json"
// const defs = [] as any
const definitions = defs as ReaScriptUSDocML[]

import { ReaScriptUSDocML } from "./api-scraper/typescript/reascript-USDocML.types"
import { EelCompletionItemProvider } from "./providers/eel/completion"
import { EelHoverProvider } from "./providers/eel/hover"
import { EelSignatureHelpProvider } from "./providers/eel/signature"
import { LuaCompletionItemProvider } from "./providers/lua/completion"
import { LuaHoverProvider } from "./providers/lua/hover"
import { LuaSignatureHelpProvider } from "./providers/lua/signature"
import { updateWorkspaceSettings } from "./utils"

export function activate(context: vscode.ExtensionContext) {
  const luaSignatureProvider = new LuaSignatureHelpProvider(definitions).register()
  const luaCompletionProvider = new LuaCompletionItemProvider(definitions).register()
  const luaHoverProvider = new LuaHoverProvider(definitions).register()

  const eelSignatureProvider = new EelSignatureHelpProvider(definitions).register()
  const eelCompletionProvider = new EelCompletionItemProvider(definitions).register()
  const eelHoverProvider = new EelHoverProvider(definitions).register()
  updateWorkspaceSettings()
  context.subscriptions.push(
    luaSignatureProvider,
    luaCompletionProvider,
    luaHoverProvider,
    eelSignatureProvider,
    eelCompletionProvider,
    eelHoverProvider
  )
}
