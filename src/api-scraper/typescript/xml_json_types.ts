export type XML2JsonParseItem = {
  $: {
    version: string
    spok_lang: string
    /**
     *
     */
    prog_lang: string //will be marked as "*" or "eel" or "lua" or "python" or "cpp"
  }
  changelog: string[]
  /**line-separated strings */
  chapter_context: ChapterContexts[]
  deprecated?: boolean // TODO check
  description: string[]
  functioncall?: {
    /** contents of function
     * follows this pattern somewhat:
     * return_type function_name(parameters)
     */
    _: string
    /** programming language used*/
    $: { prog_lang: string }
  }[]
  linked_to?: string[] // TODO check
  parameters?: string[] // TODO check
  /**line-separated strings */
  requires?: string[]
  /**line-separated strings */
  ret_vals?: string[] // TODO check
  ret_val?: string[] // TODO check
  slug: string[]
  /** indicates file names */
  source_document: string[]
  /**
   * tags are inside of string, comma-separated
   * eg. "tag1, tag2, tag3"
   */
  tags: string[]
  target_document: string[]
  title: string[]
  _: any // TODO Check
}
export type XML2JSONParseDoc = XML2JsonParseItem[]
export type UltraschallApiXML = {
  USDocBloc: {
    US_DocBloc: XML2JSONParseDoc
  }
}

export enum ChapterContexts {
  API_Documentation = "API-Documentation",
  Mediaitem_Management = "Mediaitem Management",
  Marker_Management = "Marker Management",
  Api_Helper_Functions = "Api-Helper-Functions",
  Arrangeview_Management = "Arrangeview Management",
  Track_Management = "Track Management",
  AudioMidi_Devicemanagement = "AudioMidi Devicemanagement",
  Audio_Management = "Audio Management",
  Automation_Management = "Automation Management",
  Envelope_Management = "Envelope Management",
  Miscellaneous = "Miscellaneous",
  Transport_Management = "Transport Management",
  Project_Management = "Project Management",
  Extended_States = "Extended States",
  User_Interface = "User Interface",
  File_Management = "File Management",
  Pitchshifting = "Pitchshifting",
  MIDI_Management = "MIDI Management",
  FX_Management = "FX Management",
  Theme_management = "Theme management",
  Joystick_Management = "Joystick Management",
  ReaBlink = "ReaBlink",
  Configuration_Settings = "Configuration Settings",
  JS_Plugin = "JS_Plugin",
  User_Interface_Window_Management = "User Interface\n            Window Management",
  MetaData_Management = "MetaData Management",
  Additional_EEL_Functions = "Additional EEL-Functions",
  Additional_Lua_Functions = "Additional Lua-Functions",
  Additional_Python_Functions = "Additional Python-Functions",
  AdditionalCppFns = "Additional C++ Functions\n            reaper_plugin_functions.h",
  ReaPack = "ReaPack",
  Osara = "Osara",
  ReaImGui = "ReaImGui",
}
