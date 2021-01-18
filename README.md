# ReaScript VS Code Extension

An extension for Reaper's ReaScript API methods in VS Code.
Provides Intellisense/Autocomplete, and doc-comments on hover for all functions.

## Changelog

- 0.0.1
  - Initial version
- 0.0.2 (1/6/2021)

  - Added scraper and parser to grab docs from Ultraschall ReaScript API, and process the important stringified fields into JSON
  - As a byproduct of using Ultraschall as a docs source, the extension now has:
    - SWS methods
    - JS methods
    - Better descriptions
    - Comments about parameter and returns values on many functions
  - Updated formatting on the doc blocks, so that it looks much nicer. Important things are bolded, items are logically spaced, markdown used instead of plain text, etc
  - Intellisense/Autocomplete now works without having to prefix the method with "reaper." and "gfx." (still need to make this a toggleable option)
  - **NOTE**: A big thank-you to Meo-Mespotine for writing/maintaining the Ultraschall docs, and also Extremeraym for his Node function that sanitizes the XML format so that it's properly parseable.

- 0.0.3 (1/10/21)

  - Fixed issue where autocomplete was case-sensitive if trying to autocomplete a method preceeding a dot, IE "getmedia" expected to trigger "reaper.GetMedia\*\* but didn't

- 0.0.4 (1/18/21)
  - **Added syntax highlighting for Eel/Jesusonic/WALTER (all credit to Breeder's TextMate grammar file, see copyright notice in repo)**
  - **Added intellisense/autocomplete for Eel/Jesusonic**
  - Method signatures now show the return types. IE, when pressing `(` to invoke `reaper.AddMediaItemToTrack`, it shows `MediaItem tr = reaper.AddMediaItemToTrack()`
  - Large internal refactor for the shape of the JSON document used to store ReaScript functions. Better parser in Lua using Ultraschall API methods for USDocML to generate this.

![Demo](vscode-reascript-extension-demo.gif)
