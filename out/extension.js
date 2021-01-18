"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = void 0;
const defs = require("./api-scraper/lua/results.json");
// const defs = [] as any
const definitions = defs;
const completion_1 = require("./providers/eel/completion");
const hover_1 = require("./providers/eel/hover");
const signature_1 = require("./providers/eel/signature");
const completion_2 = require("./providers/lua/completion");
const hover_2 = require("./providers/lua/hover");
const signature_2 = require("./providers/lua/signature");
function activate(context) {
    const luaSignatureProvider = new signature_2.LuaSignatureHelpProvider(definitions).register();
    const luaCompletionProvider = new completion_2.LuaCompletionItemProvider(definitions).register();
    const luaHoverProvider = new hover_2.LuaHoverProvider(definitions).register();
    const eelSignatureProvider = new signature_1.EelSignatureHelpProvider(definitions).register();
    const eelCompletionProvider = new completion_1.EelCompletionItemProvider(definitions).register();
    const eelHoverProvider = new hover_1.EelHoverProvider(definitions).register();
    context.subscriptions.push(luaSignatureProvider, luaCompletionProvider, luaHoverProvider, eelSignatureProvider, eelCompletionProvider, eelHoverProvider);
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map