---@meta

---@class ReaScriptUSDocML
---@field chapters Chapter[]
---@field description Description
---@field functioncall Functioncall
---@field params Params
---@field requires Requires
---@field return_values Params
---@field signatures any[] | SignaturesClass
---@field source_document SourceDocument
---@field tags string[]
---@field target_document TargetDocument
---@field title string

---@enum Chapter
local Chapter = {
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

---@class Description
---@field language string
---@field prog_lang ProgLang
---@field description string
---@field markup_type MarkupType

---@enum MarkupType
local MarkupType = {
  Markdown = "markdown",
  Plaintext = "plaintext",
}

---@enum ProgLang
local ProgLang = {
  Eel = "eel",
  Empty = "*",
  ProgLang = "",
}

---@class Functioncall
---@field  lua string | nil
---@field  python string | nil
---@field  eel string | nil
---@field  cpp string | nil

---@class Params
---@field  param_count number | nil
---@field  prog_lang ProgLang | nil
---@field  entries Entry[]
---@field  markup_type MarkupType | nil

---@class Entry
---@field  description string
---@field  identifier string


---@class Requires
---@field  Lua string | nil
---@field  Reaper string
---@field  SWS string | nil
---@field  JS string | nil
---@field  ReaPack string | nil

---@class SignaturesClass
---@field  eel Eel | nil
---@field  lua Lua | nil

---@class Eel
---@field  parameters EelParameter[]
---@field  return_values string[]
---@field  method_name string

---@class EelParameter
---@field  type_name string | nil
---@field  identifier string
---@field  modifier string | nil

---@class Lua
---@field  parameters ReturnValueElement[]
---@field  return_values ReturnValueElement[]
---@field  method_name string | nil

---@class ReturnValueElement
---@field type string
---@field identifier string | nil

---@enum SourceDocument
local SourceDocument = {
  ReaperApidocsUSDocML = "reaper-apidocs.USDocML",
  ReaperPluginH = "reaper_plugin.h",
}

---@enum TargetDocument
local TargetDocument = {
  ReaperAPIDocumentation = "Reaper_Api_Documentation",
}
