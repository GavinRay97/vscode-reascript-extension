// read contents of ../reaper-api-docs-fixed.xml
// call parseXML on contents

import { UltraschallApiXML } from "./xml_json_types"
import { findCommonKeys, listChapterContextsAndKeys } from "./helpers/findUltraschallKeyTypes"

function read_file() {
  const fs = require("fs")
  const path = require("path")
  const xml = fs.readFileSync(path.join(__dirname, "../reaper-api-docs-fixed.xml"), "utf8")
  return xml
}

function parseXML(xml: string) {
  const xml2js = require("xml2js")
  const parser = new xml2js.Parser()
  parser.parseString(xml, (err: Error, result: UltraschallApiXML) => {
    if (err) {
      console.log("Got error while attempting to parse XML", err)
    } else {
      const reduction = listChapterContextsAndKeys(result.USDocBloc.US_DocBloc)
      console.log("reduction:\n", reduction)
      const keytypes = findCommonKeys(reduction)
      console.log("common keys:\n", keytypes.commonKeys)
      console.log("optional keys:\n", keytypes.optionalKeys)
      console.log("fields:\n", Object.keys(reduction))
    }
  })
}

parseXML(read_file())
