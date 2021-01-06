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

![Demo](vscode-reascript-extension-demo.gif)