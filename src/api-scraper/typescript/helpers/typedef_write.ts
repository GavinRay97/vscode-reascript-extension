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
/**
 *
 * remove lua's reserved words
 * end in function
 * @returns
 */
export function writeLuaTypes(definitions: ReaScriptUSDocML[]) {
  const metaTag = "---@meta\nreaper = {}\n"
  const formattedDefinitions = definitions
    .map((def) => {
      if (
        isSignaturesClass(def.signatures) &&
        hasLuaProp(def.functioncall) &&
        hasLuaProp(def.signatures)
      ) {
        let { return_values, parameters } = def.signatures.lua
        const params_decl = parameters
          .map((element) => rewriteLuaReservedWords(element.identifier || ""))
          .join(", ")
        const params_type = parameters.map((element) => formatParam(element)).join("")
        const ret_type = return_values.map((element) => formatReturn(element)).join(", ")

        const return_values_type = ret_type.length > 0 ? "---@return " + ret_type + "\n" : ""
        let desc = ""
        if (def.description.description.length > 0) {
          desc =
            "---" +
            def.description.description.replace(/\n\n/gm, "").replace(/[\r\n]/gm, "\n---") +
            "\n"
        }

        return `${desc}${params_type}${return_values_type}function ${formatLuaFunctioncall(
          def.functioncall.lua
        )}(${params_decl}) end\n`
      } else return ""
    })
    .filter((str) => str !== "")
  return metaTag + writeReaperTypes() + formattedDefinitions.join("\n")
}
function rewriteLuaReservedWords(str: string) {
  if (str === "end") return "end_"
  if (str === "function") return "function_"
  if (str === "in") return "in_"
  else return str
}

function formatReturn(element: ReturnValueElement): string {
  const { type, identifier } = element
  return `${type} ${rewriteLuaReservedWords(identifier || "")}`
}

function formatParam(element: ReturnValueElement): string {
  // lua output per param must be
  // "---@param paramname paramtype"
  const { type, identifier } = element
  return `---@param ${rewriteLuaReservedWords(identifier || "")} ${type}\n`
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

function writeReaperTypes() {
  const reaperTypes = [
    "MediaTrack",
    "MediaItem",
    "ReaProject",
    "MediaItem_Take",
    "AudioAccessor",
    "TrackEnvelope",
    "IReaperControlSurface",
    "HWND",
    "PCM_source",
    "joystick_device",
    "KbdSectionInfo",
    "BR_Envelope",
    "RprMidiTake",
    "RprMidiNote",
    "WDL_FastString",
    "audio_xrun",
    "unsupported",
    "AudioWriter",
    "FxChain",
    "gfx",
    "PackageEntry",
  ]
  return reaperTypes
    .map((type) => {
      return `---@alias ${type} unknown\n`
    })
    .join("")
}
