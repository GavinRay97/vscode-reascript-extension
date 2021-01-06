import * as path from "path"
import * as fs from "fs/promises"
import { escape, groupBy } from "lodash"

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
const actionRegex = /(?<section>((\w+) ?)+)	(?<id>.+)	(?<action>.+)/g

async function main() {
  const actions = []

  const file = path.join(__dirname, "ActionList.txt")
  const actionList = await fs.readFile(file, "utf-8")

  for (const line of actionList.split("\n")) {
    const matches = line.matchAll(actionRegex)
    const action = matches.next().value?.groups
    if (!action) continue
    // Skip the first row (headers)
    if (action.id == "Id") continue
    actions.push(action)
  }

  const outfile = path.join(__dirname, "ActionList.json")
  await fs.writeFile(outfile, JSON.stringify(actions, null, 2))
}

interface Action {
  id: string
  section: string
  action: string
}

async function other() {
  const file = path.join(__dirname, "ActionList.json")

  const actionJsonText = await fs.readFile(file, "utf8")
  const actionList: Action[] = JSON.parse(actionJsonText)

  let luaTableCodeTemplate = "ACTION_LIST = {}\n"

  const actionsBySection = groupBy(actionList, (item) => item.section)
  for (const section in actionsBySection) {
    const actions = actionsBySection[section]
    luaTableCodeTemplate += `ACTION_LIST["${section}"] = {}\n`
    for (const entry of actions) {
      const escaped = escape(entry.action)
      luaTableCodeTemplate += `ACTION_LIST["${section}"]["${escaped}"] = "${entry.id}"\n`
    }
  }

  await fs.writeFile(path.join(__dirname, "ActionListTable.lua"), luaTableCodeTemplate)
}

other()
