"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const path = require("path");
const fs = require("fs/promises");
const lodash_1 = require("lodash");
/**
 * HOW TO USE THIS SCRIPT:
 *
 * Run the action
 */
// Parse Action List like:
//
// Section	Id	Action
// Main	4	Track: Set volume for selected tracks (MIDI CC/OSC only)
// Main	5	Track: Set pan for selected tracks (MIDI CC/OSC only)
//
const actionRegex = /(?<section>((\w+) ?)+)	(?<id>.+)	(?<action>.+)/g;
function main() {
    var _a;
    return __awaiter(this, void 0, void 0, function* () {
        const actions = [];
        const file = path.join(__dirname, "ActionList.txt");
        const actionList = yield fs.readFile(file, "utf-8");
        for (const line of actionList.split("\n")) {
            const matches = line.matchAll(actionRegex);
            const action = (_a = matches.next().value) === null || _a === void 0 ? void 0 : _a.groups;
            if (!action)
                continue;
            // Skip the first row (headers)
            if (action.id == "Id")
                continue;
            actions.push(action);
        }
        const outfile = path.join(__dirname, "ActionList.json");
        yield fs.writeFile(outfile, JSON.stringify(actions, null, 2));
    });
}
function other() {
    return __awaiter(this, void 0, void 0, function* () {
        const file = path.join(__dirname, "ActionList.json");
        const actionJsonText = yield fs.readFile(file, "utf8");
        const actionList = JSON.parse(actionJsonText);
        let luaTableCodeTemplate = "ACTION_LIST = {}\n";
        const actionsBySection = lodash_1.groupBy(actionList, (item) => item.section);
        for (const section in actionsBySection) {
            const actions = actionsBySection[section];
            luaTableCodeTemplate += `ACTION_LIST["${section}"] = {}\n`;
            for (const entry of actions) {
                const escaped = lodash_1.escape(entry.action);
                luaTableCodeTemplate += `ACTION_LIST["${section}"]["${escaped}"] = "${entry.id}"\n`;
            }
        }
        yield fs.writeFile(path.join(__dirname, "ActionListTable.lua"), luaTableCodeTemplate);
    });
}
other();
//# sourceMappingURL=generate-lua-tables-from-actionlist.js.map