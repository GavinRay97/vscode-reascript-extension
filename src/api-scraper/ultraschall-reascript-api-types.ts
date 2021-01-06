export interface TypedIdentifier {
  type: string
  identifier?: string
}

export interface FunctionSignature {
  methodName: string
  parameters: TypedIdentifier[]
  returnValues: TypedIdentifier[]
}

export interface ProcessedUltraschallReaScriptAPIDoc extends UtraschallReaScriptAPIDoc {
  tagsParsed: string[]
  requiresParsed?: Record<string, string>
  parametersParsed: Array<{
    paramName: string
    type: string
    description: string
  }>
  functioncallParsed: {
    lua?: FunctionSignature
    cpp?: FunctionSignature
    eel?: FunctionSignature
    python?: FunctionSignature
  }
}

//////////////////////////////////////////////////////////

export interface UtraschallReaScriptAPIDoc {
  "@_version": string
  "@_spok_lang": SpokLang
  "@_prog_lang"?: ProgLang
  slug: string
  title: string
  description: string[] | DescriptionClass | string
  target_document: TargetDocumentElement[] | TargetDocumentElement
  source_document: SourceDocument
  chapter_context: ChapterContext
  tags: string
  functioncall?: FunctioncallElement | FunctioncallElement[]
  requires?: string
  retvals?: DescriptionClass | string
  parameters?: DescriptionClass | string
}

export enum ProgLang {
  All = "*",
  Cpp = "cpp",
  Eel = "eel",
  Lua = "lua",
  Python = "python",
}

export enum SpokLang {
  En = "en",
}

export enum ChapterContext {
  APIDocumentation = "API-Documentation",
  APIHelperFunctions = "Api-Helper-Functions",
  AdditionalCFunctionsReaperPluginFunctionsH = "Additional C++ Functions\n            reaper_plugin_functions.h",
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
  UserInterfaceWindowManagement = "User Interface\n            Window Management",
}

export interface DescriptionClass {
  "#text": string
  "@_markup_type"?: MarkupType
  "@_markup_version"?: string
  "@_prog_lang"?: ProgLang
}

export enum MarkupType {
  Markdown = "markdown",
}

export interface FunctioncallElement {
  "#text": string
  "@_prog_lang": ProgLang
}

export enum SourceDocument {
  ReaperApidocsUSDocML = "reaper-apidocs.USDocML",
  ReaperPluginH = "reaper_plugin.h",
}

export enum TargetDocumentElement {
  ReaperAPIDocumentation = "Reaper_Api_Documentation",
}
