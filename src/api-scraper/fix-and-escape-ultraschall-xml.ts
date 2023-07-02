import * as fs from "fs/promises"
import path = require("path")
import axios, { AxiosResponse } from "axios"
/**
 * ========================================================
 * This script fixes and escapes the XML provdided
 * from Ultraschall docs so that it properly parses
 * ========================================================
 */

/**
 * Credit to X-Raym, see: https://forum.cockos.com/showpost.php?p=2182879&postcount=295
 */
function fixUltraschallXML(text: string): string {
  text = text.replace("<functionname>", "functionname")
  text = text.replace(/&/gm, "&amp;")
  text = text.replace(/<br>/gm, "")
  text = text.replace(/pamrameters/gm, "parameters")
  text = text.replace(/parmeters/gm, "parameters")
  text = text.replace(/indent="default"/gm, "")
  text = text.replace(/>>/gm, ">")
  text = text.replace(/<=/gm, "&lt;=")
  text = text.replace(/< :/gm, "&lt; :")
  text = text.replace(/\|</gm, "|&lt;")
  text = text.replace(/<0/gm, "&lt;0")
  text = text.replace(/<</gm, "&lt;&lt;")
  text = text.replace(/=</gm, "=&lt; ")
  text = text.replace(/ < /gm, " &lt; ")
  text = text.replace(/V, </gm, "V, &lt; ")
  return text
}

async function fetchLatestUltraschallReaScriptAPIDocs() {
  const request = await axios.get<null, AxiosResponse<string>>(
    "https://raw.githubusercontent.com/Ultraschall/ultraschall-lua-api-for-reaper/master/ultraschall_api/DocsSourcefiles/reaper-apidocs.USDocML"
  )
  return request.data
}

async function main() {
  const xml = await fetchLatestUltraschallReaScriptAPIDocs()
  const parsedXML = fixUltraschallXML(xml)
  const outpath = path.join(__dirname, "reaper-api-docs-fixed.xml")
  //await fs.writeFile(outpath, parsedXML)
}

main().catch((err) => {
  console.log("Got error while attempting to fetch and parse Ultraschall API docs XML", err)
})
