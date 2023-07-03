import { assert, expect } from "chai"
import { formatParamRetValElment, writeLuaTypes } from "../helpers/typedef_write"
import { ReaScriptUSDocML } from "../reascript-USDocML.types"

describe("formatParamRetValElment", () => {
  assert(
    formatParamRetValElment({ type: "number", identifier: "myNumber" }) == "myNumber: number",
    "formatParamRetValElment"
  )
})

describe("writeLuaTypes", () => {
  const def: Pick<ReaScriptUSDocML, "signatures"> = {
    signatures: {
      lua: {
        method_name: "mything",
        return_values: [{ type: "table<number, ItemPosition>" }],
        parameters: [{ type: "table<number, MediaTrack>", identifier: "tracks" }],
      },
    },
  }
  const def2: Pick<ReaScriptUSDocML, "signatures"> = {
    signatures: {
      lua: {
        method_name: "mything2",
        return_values: [{ type: "table<number, ItemPosition>" }],
        parameters: [
          { type: "table<number, MediaTrack>", identifier: "tracks" },
          { type: "number", identifier: "myNumber" },
        ],
      },
    },
  }
  const def3: Pick<ReaScriptUSDocML, "signatures"> = {
    signatures: {
      lua: {
        method_name: "mything3",
        return_values: [{ type: "table<number, ItemPosition>" }],
        parameters: [
          { type: "table<number, MediaTrack>", identifier: "tracks" },
          { type: "number", identifier: "myNumber" },
          { type: "string", identifier: "myString" },
        ],
      },
    },
  }
  const expected = `function mything(tracks) end ---@type function (tracks: table<number, MediaTrack>): table<number, ItemPosition>
		function mything2(tracks, myNumber) end ---@type function (tracks: table<number, MediaTrack>, myNumber: number): table<number, ItemPosition>
		function mything3(tracks, myNumber, myString) end ---@type function (tracks: table<number, MediaTrack>, myNumber: number, myString: string): table<number, ItemPosition>
		`
  expect(writeLuaTypes([def, def2, def3] as ReaScriptUSDocML[])).to.equal(expected)
})
