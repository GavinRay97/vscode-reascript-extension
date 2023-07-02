export interface ReaScriptUSDocML {
  signatures: any[] | SignaturesClass
  requires: Requires
  tags: string[]
  target_document: TargetDocument
  source_document: SourceDocument
  description: Description
  chapters: Chapter[]
  return_values: Params
  params: Params
  functioncall: Functioncall
  title: string
}

export enum Chapter {
  APIHelperFunctions = "Api-Helper-Functions",
  AdditionalCFunctions = "Additional C++ Functions",
  AdditionalEELFunctions = "Additional EEL-Functions",
  AdditionalLuaFunctions = "Additional Lua-Functions",
  AdditionalPythonFunctions = "Additional Python-Functions",
  ArrangeviewManagement = "Arrangeview Management",
  AudioMIDIDevicemanagement = "AudioMidi Devicemanagement",
  AudioManagement = "Audio Management",
  AutomationManagement = "Automation Management",
  EnvelopeManagement = "Envelope Management",
  ExtendedStates = "Extended States",
  FXManagement = "FX Management",
  FileManagement = "File Management",
  JSPlugin = "JS_Plugin",
  JoystickManagement = "Joystick Management",
  MIDIManagement = "MIDI Management",
  MarkerManagement = "Marker Management",
  MediaitemManagement = "Mediaitem Management",
  MetaDataManagement = "MetaData Management",
  Miscellaneous = "Miscellaneous",
  Pitchshifting = "Pitchshifting",
  ProjectManagement = "Project Management",
  ReaPack = "ReaPack",
  ThemeManagement = "Theme management",
  TrackManagement = "Track Management",
  TransportManagement = "Transport Management",
  UserInterface = "User Interface",
}

export interface Description {
  language: string
  prog_lang: ProgLang
  description: string
  markup_type: MarkupType
}

export enum MarkupType {
  Markdown = "markdown",
  Plaintext = "plaintext",
}

export enum ProgLang {
  Eel = "eel",
  Empty = "*",
  ProgLang = "",
}

export interface Functioncall {
  lua?: string
  python?: string
  eel?: string
  cpp?: string
}

export interface Params {
  param_count?: number
  prog_lang?: ProgLang
  entries: Entry[]
  markup_type?: MarkupType
}

export interface Entry {
  description: string
  identifier: string
}

export interface Requires {
  Lua?: string
  Reaper: string
  SWS?: string
  JS?: string
  ReaPack?: string
}

export interface SignaturesClass {
  eel?: Eel
  lua?: Lua
}

export interface Eel {
  parameters: EelParameter[]
  return_values: string[]
  method_name?: string
}

export interface EelParameter {
  type_name?: string
  identifier: string
  modifier?: string
}

export interface Lua {
  parameters: ReturnValueElement[]
  return_values: ReturnValueElement[]
  method_name?: string
}

export interface ReturnValueElement {
  type: string
  identifier?: string
}

export enum SourceDocument {
  ReaperApidocsUSDocML = "reaper-apidocs.USDocML",
  ReaperPluginH = "reaper_plugin.h",
}

export enum TargetDocument {
  ReaperAPIDocumentation = "Reaper_Api_Documentation",
}
