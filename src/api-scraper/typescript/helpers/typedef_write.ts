import path = require("path")
import * as defs from "../../lua/results.json"
import {
  ReaScriptUSDocML,
  ReturnValueElement,
  Functioncall,
  SignaturesClass,
} from "../reascript-USDocML.types"
import * as fs from "fs/promises"
const definitions = defs as ReaScriptUSDocML[]

async function main() {
  const luaTypes = writeLuaTypes(definitions)

  const outpath = path.join(__dirname, "reaper-types.lua")
  await fs.writeFile(outpath, luaTypes)
}

main().catch((err) => {
  console.log("Got error while attempting to write file", err)
})

/**
 * 	write a  typedefinitions file from the provided table
	file starts with "---@meta"
	then for each function mentioned in the table
		create
		"---@type function({params}):retval"
 */
/* function mything(tracks) end ---@type function (tracks: table<number, MediaTrack>): table<number, ItemPosition> */
export function writeLuaTypes(definitions: ReaScriptUSDocML[]) {
  const metaTag = "---@meta\n"
  const formattedDefinitions = definitions
    .map((def) => {
      if (
        isSignaturesClass(def.signatures) &&
        hasLuaProp(def.functioncall) &&
        hasLuaProp(def.signatures)
      ) {
        let { method_name, return_values, parameters } = def.signatures.lua
        const params_decl = parameters.map((element) => element.identifier).join(", ")
        const params_type = parameters.map((element) => formatParamRetValElment(element)).join(", ")
        const return_values_type = return_values
          .map((element) => formatParamRetValElment(element))
          .join(", ")
        const returnstmt = return_values_type !== "" ? ": " + return_values_type : ""
        return `function ${formatLuaFunctioncall(
          def.functioncall.lua
        )}(${params_decl}) end ---@type function (${params_type})${returnstmt}\n`
      } else return ""
    })
    .filter((str) => str !== "")
  return metaTag + formattedDefinitions.join("\n")
}
export function formatParamRetValElment(element: ReturnValueElement): string {
  const { type, identifier } = element
  return `${!!identifier ? `${identifier}: ` : ""}${type}`
}

// check that the signature is a SignaturesClass
// and has a lua property
function isSignaturesClass(signature: unknown): signature is SignaturesClass {
  return (
    !!signature &&
    typeof signature === "object" &&
    !Array.isArray(signature) &&
    ("lua" in signature || "eel" in signature) &&
    typeof signature === "object"
  )
}

function hasLuaProp<T extends Record<string, any>>(obj: T): obj is T & { lua: string } {
  return "lua" in obj && !!obj.lua
}

function formatLuaFunctioncall(functioncall: Functioncall["lua"]) {
  const str = functioncall!
    .split("")
    .reverse()
    .join("")
    .replace(/\)[^\(]*\(/, "")
    .replace(/ .*/, "")
    .split("")
    .reverse()
    .join("")
  return str
}
