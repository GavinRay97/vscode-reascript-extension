---@meta
function reaper.AddMediaItemToTrack(tr) end ---@type function (tr: MediaTrack): item: MediaItem

function reaper.AddProjectMarker(proj, isrgn, pos, rgnend, name, wantidx) end ---@type function (proj: ReaProject, isrgn: boolean, pos: number, rgnend: number, name: string, wantidx: integer): integer

function reaper.AddProjectMarker2(proj, isrgn, pos, rgnend, name, wantidx, color) end ---@type function (proj: ReaProject, isrgn: boolean, pos: number, rgnend: number, name: string, wantidx: integer, color: integer): integer

function reaper.AddRemoveReaScript(add, sectionID, scriptfn, commit) end ---@type function (add: boolean, sectionID: integer, scriptfn: string, commit: boolean): integer

function reaper.AddTakeToMediaItem(item) end ---@type function (item: MediaItem): MediaItem_Take

function reaper.AddTempoTimeSigMarker(proj, timepos, bpm, timesig_num, timesig_denom, lineartempochange) end ---@type function (proj: ReaProject, timepos: number, bpm: number, timesig_num: integer, timesig_denom: integer, lineartempochange: boolean): boolean

function reaper.adjustZoom(amt, forceset, doupd, centermode) end ---@type function (amt: number, forceset: integer, doupd: boolean, centermode: integer)

function reaper.AnyTrackSolo(proj) end ---@type function (proj: ReaProject): boolean

function reaper.APIExists(function_name) end ---@type function (function_name: string): boolean

function reaper.APITest() end ---@type function ()

function reaper.ApplyNudge(project, nudgeflag, nudgewhat, nudgeunits, value, reverse, copies) end ---@type function (project: ReaProject, nudgeflag: integer, nudgewhat: integer, nudgeunits: integer, value: number, reverse: boolean, copies: integer): boolean

function reaper.Audio_Init() end ---@type function ()

function reaper.Audio_IsPreBuffer() end ---@type function (): integer

function reaper.Audio_IsRunning() end ---@type function (): integer

function reaper.Audio_Quit() end ---@type function ()

function reaper.AudioAccessorStateChanged(reaper, accessor) end ---@type function (reaper: boolean, accessor: AudioAccessor)

function reaper.AudioAccessorUpdate(accessor) end ---@type function (accessor: AudioAccessor)

function reaper.AudioAccessorValidateState(accessor) end ---@type function (accessor: AudioAccessor): boolean

function reaper.BypassFxAllTracks(bypass) end ---@type function (bypass: integer)

function reaper.ClearAllRecArmed() end ---@type function ()

function reaper.ClearConsole() end ---@type function ()

function reaper.ClearPeakCache() end ---@type function ()

function reaper.ColorFromNative(col) end ---@type function (col: integer): r: integer, g: integer, b: integer

function reaper.ColorToNative(r, g, b) end ---@type function (r: integer, g: integer, b: integer): integer

function reaper.CountAutomationItems(env) end ---@type function (env: TrackEnvelope): integer

function reaper.CountEnvelopePoints(envelope) end ---@type function (envelope: TrackEnvelope): integer

function reaper.CountEnvelopePointsEx(envelope, autoitem_idx) end ---@type function (envelope: TrackEnvelope, autoitem_idx: integer): integer

function reaper.CountMediaItems(proj) end ---@type function (proj: ReaProject): integer

function reaper.CountProjectMarkers(proj) end ---@type function (proj: ReaProject): retval: integer, num_markers: number, num_regions: number

function reaper.CountSelectedMediaItems(proj) end ---@type function (proj: ReaProject): integer

function reaper.CountSelectedTracks(proj) end ---@type function (proj: ReaProject): integer

function reaper.CountSelectedTracks2(proj, wantmaster) end ---@type function (proj: ReaProject, wantmaster: boolean): integer

function reaper.CountTakeEnvelopes(take) end ---@type function (take: MediaItem_Take): integer

function reaper.CountTakes(item) end ---@type function (item: MediaItem): integer

function reaper.CountTCPFXParms(project, track) end ---@type function (project: ReaProject, track: MediaTrack): integer

function reaper.CountTempoTimeSigMarkers(proj) end ---@type function (proj: ReaProject): integer

function reaper.CountTrackEnvelopes(track) end ---@type function (track: MediaTrack): integer

function reaper.CountTrackMediaItems(track) end ---@type function (track: MediaTrack): integer

function reaper.CountTracks(proj) end ---@type function (proj: ReaProject): integer

function reaper.CreateNewMIDIItemInProj(track, starttime, endtime, boolean) end ---@type function (track: MediaTrack, starttime: number, endtime: number, boolean: optional): MediaItem

function reaper.CreateTakeAudioAccessor(take) end ---@type function (take: MediaItem_Take): AudioAccessor

function reaper.CreateTrackAudioAccessor(track) end ---@type function (track: MediaTrack): AudioAccessor

function reaper.CreateTrackSend(tr, desttrIn) end ---@type function (tr: MediaTrack, desttrIn: MediaTrack): integer

function reaper.CSurf_FlushUndo(force) end ---@type function (force: boolean)

function reaper.CSurf_GetTouchState(trackid, isPan) end ---@type function (trackid: MediaTrack, isPan: integer): boolean

function reaper.CSurf_GoEnd() end ---@type function ()

function reaper.CSurf_GoStart() end ---@type function ()

function reaper.CSurf_NumTracks(mcpView) end ---@type function (mcpView: boolean): integer

function reaper.CSurf_OnArrow(whichdir, wantzoom) end ---@type function (whichdir: integer, wantzoom: boolean)

function reaper.CSurf_OnFwd(seekplay) end ---@type function (seekplay: integer)

function reaper.CSurf_OnFXChange(trackid, en) end ---@type function (trackid: MediaTrack, en: integer): boolean

function reaper.CSurf_OnInputMonitorChange(trackid, monitor) end ---@type function (trackid: MediaTrack, monitor: integer): integer

function reaper.CSurf_OnInputMonitorChangeEx(trackid, monitor, allowgang) end ---@type function (trackid: MediaTrack, monitor: integer, allowgang: boolean): integer

function reaper.CSurf_OnMuteChange(trackid, mute) end ---@type function (trackid: MediaTrack, mute: integer): boolean

function reaper.CSurf_OnMuteChangeEx(trackid, mute, allowgang) end ---@type function (trackid: MediaTrack, mute: integer, allowgang: boolean): boolean

function reaper.CSurf_OnPanChange(trackid, pan, relative) end ---@type function (trackid: MediaTrack, pan: number, relative: boolean): number

function reaper.CSurf_OnPanChangeEx(trackid, pan, relative, allowGang) end ---@type function (trackid: MediaTrack, pan: number, relative: boolean, allowGang: boolean): number

function reaper.CSurf_OnPause() end ---@type function ()

function reaper.CSurf_OnPlay() end ---@type function ()

function reaper.CSurf_OnPlayRateChange(playrate) end ---@type function (playrate: number)

function reaper.CSurf_OnRecArmChange(trackid, recarm) end ---@type function (trackid: MediaTrack, recarm: integer): boolean

function reaper.CSurf_OnRecArmChangeEx(trackid, recarm, allowgang) end ---@type function (trackid: MediaTrack, recarm: integer, allowgang: boolean): boolean

function reaper.CSurf_OnRecord() end ---@type function ()

function reaper.CSurf_OnRecvPanChange(trackid, recv_index, pan, relative) end ---@type function (trackid: MediaTrack, recv_index: integer, pan: number, relative: boolean): number

function reaper.CSurf_OnRecvVolumeChange(trackid, recv_index, volume, relative) end ---@type function (trackid: MediaTrack, recv_index: integer, volume: number, relative: boolean): number

function reaper.CSurf_OnRew(seekplay) end ---@type function (seekplay: integer)

function reaper.CSurf_OnRewFwd(seekplay, dir) end ---@type function (seekplay: integer, dir: integer)

function reaper.CSurf_OnScroll(xdir, ydir) end ---@type function (xdir: integer, ydir: integer)

function reaper.CSurf_OnSelectedChange(trackid, selected) end ---@type function (trackid: MediaTrack, selected: integer): boolean

function reaper.CSurf_OnSendPanChange(trackid, send_index, pan, relative) end ---@type function (trackid: MediaTrack, send_index: integer, pan: number, relative: boolean): number

function reaper.CSurf_OnSendVolumeChange(trackid, send_index, volume, relative) end ---@type function (trackid: MediaTrack, send_index: integer, volume: number, relative: boolean): number

function reaper.CSurf_OnSoloChange(trackid, solo) end ---@type function (trackid: MediaTrack, solo: integer): boolean

function reaper.CSurf_OnSoloChangeEx(trackid, solo, allowgang) end ---@type function (trackid: MediaTrack, solo: integer, allowgang: boolean): retval: boolean

function reaper.CSurf_OnStop() end ---@type function ()

function reaper.CSurf_OnTempoChange(bpm) end ---@type function (bpm: number)

function reaper.CSurf_OnTrackSelection(trackid) end ---@type function (trackid: MediaTrack)

function reaper.CSurf_OnVolumeChange(trackid, volume, relative) end ---@type function (trackid: MediaTrack, volume: number, relative: boolean): number

function reaper.CSurf_OnVolumeChangeEx(trackid, volume, relative, allowGang) end ---@type function (trackid: MediaTrack, volume: number, relative: boolean, allowGang: boolean): number

function reaper.CSurf_OnWidthChange(trackid, width, relative) end ---@type function (trackid: MediaTrack, width: number, relative: boolean): number

function reaper.CSurf_OnWidthChangeEx(trackid, width, relative, allowGang) end ---@type function (trackid: MediaTrack, width: number, relative: boolean, allowGang: boolean): number

function reaper.CSurf_OnZoom(xdir, ydir) end ---@type function (xdir: integer, ydir: integer)

function reaper.CSurf_ResetAllCachedVolPanStates() end ---@type function ()

function reaper.CSurf_ScrubAmt(amt) end ---@type function (amt: number)

function reaper.CSurf_SetAutoMode(mode, ignoresurf) end ---@type function (mode: integer, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetPlayState(play, pause, rec, ignoresurf) end ---@type function (play: boolean, pause: boolean, rec: boolean, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetRepeatState(rep, ignoresurf) end ---@type function (rep: boolean, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetSurfaceMute(trackid, mute, ignoresurf) end ---@type function (trackid: MediaTrack, mute: boolean, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetSurfacePan(trackid, pan, ignoresurf) end ---@type function (trackid: MediaTrack, pan: number, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetSurfaceRecArm(trackid, recarm, ignoresurf) end ---@type function (trackid: MediaTrack, recarm: boolean, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetSurfaceSelected(trackid, selected, ignoresurf) end ---@type function (trackid: MediaTrack, selected: boolean, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetSurfaceSolo(trackid, solo, ignoresurf) end ---@type function (trackid: MediaTrack, solo: boolean, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetSurfaceVolume(trackid, volume, ignoresurf) end ---@type function (trackid: MediaTrack, volume: number, ignoresurf: IReaperControlSurface)

function reaper.CSurf_SetTrackListChange() end ---@type function ()

function reaper.CSurf_TrackFromID(idx, mcpView) end ---@type function (idx: integer, mcpView: boolean): MediaTrack

function reaper.CSurf_TrackToID(track, mcpView) end ---@type function (track: MediaTrack, mcpView: boolean): integer

function reaper.DB2SLIDER(x) end ---@type function (x: number): number

function reaper.DeleteEnvelopePointEx(reaper, envelope, autoitem_idx, ptidx) end ---@type function (reaper: boolean, envelope: TrackEnvelope, autoitem_idx: integer, ptidx: integer)

function reaper.DeleteEnvelopePointRange(envelope, time_start, time_end) end ---@type function (envelope: TrackEnvelope, time_start: number, time_end: number): boolean

function reaper.DeleteEnvelopePointRangeEx(envelope, autoitem_idx, time_start, time_end) end ---@type function (envelope: TrackEnvelope, autoitem_idx: integer, time_start: number, time_end: number): boolean

function reaper.DeleteExtState(section, key, persist) end ---@type function (section: string, key: string, persist: boolean)

function reaper.DeleteProjectMarker(proj, markrgnindexnumber, isrgn) end ---@type function (proj: ReaProject, markrgnindexnumber: integer, isrgn: boolean): boolean

function reaper.DeleteProjectMarkerByIndex(proj, markrgnidx) end ---@type function (proj: ReaProject, markrgnidx: integer): boolean

function reaper.DeleteTakeMarker(take, idx) end ---@type function (take: MediaItem_Take, idx: integer): retval: boolean

function reaper.DeleteTakeStretchMarkers(take, idx, number) end ---@type function (take: MediaItem_Take, idx: integer, number: optional): integer

function reaper.DeleteTempoTimeSigMarker(project, markerindex) end ---@type function (project: ReaProject, markerindex: integer): boolean

function reaper.DeleteTrack(tr) end ---@type function (tr: MediaTrack)

function reaper.DeleteTrackMediaItem(tr, it) end ---@type function (tr: MediaTrack, it: MediaItem): boolean

function reaper.DestroyAudioAccessor(accessor) end ---@type function (accessor: AudioAccessor)

function reaper.Dock_UpdateDockID(ident_str, whichDock) end ---@type function (ident_str: string, whichDock: integer)

function reaper.DockGetPosition(reaper, whichDock) end ---@type function (reaper: integer, whichDock: integer)

function reaper.DockIsChildOfDock(hwnd) end ---@type function (hwnd: HWND): retval: integer, isFloatingDocker: boolean

function reaper.DockWindowActivate(hwnd) end ---@type function (hwnd: HWND)

function reaper.DockWindowAdd(hwnd, name, pos, allowShow) end ---@type function (hwnd: HWND, name: string, pos: integer, allowShow: boolean)

function reaper.DockWindowAddEx(hwnd, name, identstr, allowShow) end ---@type function (hwnd: HWND, name: string, identstr: string, allowShow: boolean)

function reaper.DockWindowRefresh() end ---@type function ()

function reaper.DockWindowRefreshForHWND(hwnd) end ---@type function (hwnd: HWND)

function reaper.DockWindowRemove(hwnd) end ---@type function (hwnd: HWND)

function reaper.EditTempoTimeSigMarker(project, markerindex) end ---@type function (project: ReaProject, markerindex: integer): boolean

function reaper.EnsureNotCompletelyOffscreen(r, r, r, r) end ---@type function (r: integer, r: integer, r: integer, r: integer): r: integer, r: integer, r: integer, r: integer

function reaper.EnumerateFiles(path, fileindex) end ---@type function (path: string, fileindex: integer): string

function reaper.EnumerateSubdirectories(path, subdirindex) end ---@type function (path: string, subdirindex: integer): string

function reaper.EnumPitchShiftModes(mode) end ---@type function (mode: integer): retval: boolean, str: string

function reaper.EnumPitchShiftSubModes(mode, submode) end ---@type function (mode: integer, submode: integer): string

function reaper.EnumProjectMarkers(idx) end ---@type function (idx: integer): retval: integer, isrgn: boolean, pos: number, rgnend: number, name: string, markrgnindexnumber: integer

function reaper.EnumProjectMarkers2(proj, idx) end ---@type function (proj: ReaProject, idx: integer): retval: integer, isrgn: boolean, pos: number, rgnend: number, name: string, markrgnindexnumber: integer

function reaper.EnumProjectMarkers3(proj, idx) end ---@type function (proj: ReaProject, idx: integer): retval: integer, isrgn: boolean, pos: number, rgnend: number, name: string, markrgnindexnumber: integer, color: integer

function reaper.EnumProjects(idx) end ---@type function (idx: integer): retval: ReaProject, string: optional

function reaper.EnumProjExtState(proj, extname, idx) end ---@type function (proj: ReaProject, extname: string, idx: integer): retval: boolean, string: optional, string: optional

function reaper.EnumRegionRenderMatrix(proj, regionindex, rendertrack) end ---@type function (proj: ReaProject, regionindex: integer, rendertrack: integer): MediaTrack

function reaper.EnumTrackMIDIProgramNames(track, programNumber, programName) end ---@type function (track: integer, programNumber: integer, programName: string): retval: boolean, programName: string

function reaper.EnumTrackMIDIProgramNamesEx(proj, track, programNumber, programName) end ---@type function (proj: ReaProject, track: MediaTrack, programNumber: integer, programName: string): retval: boolean, programName: string

function reaper.Envelope_Evaluate(envelope, time, samplerate, samplesRequested) end ---@type function (envelope: TrackEnvelope, time: number, samplerate: number, samplesRequested: integer): retval: integer, number: optional, number: optional, number: optional, number: optional

function reaper.Envelope_FormatValue(env, value) end ---@type function (env: TrackEnvelope, value: number): buf: string

function reaper.Envelope_GetParentTake(env) end ---@type function (env: TrackEnvelope): retval: MediaItem_Take, number: optional, number: optional

function reaper.Envelope_GetParentTrack(env) end ---@type function (env: TrackEnvelope): retval: MediaTrack, number: optional, number: optional

function reaper.Envelope_SortPoints(envelope) end ---@type function (envelope: TrackEnvelope): boolean

function reaper.Envelope_SortPointsEx(envelope, autoitem_idx) end ---@type function (envelope: TrackEnvelope, autoitem_idx: integer): boolean

function reaper.ExecProcess(cmdline, timeoutmsec) end ---@type function (cmdline: string, timeoutmsec: integer): string

function reaper.file_exists(path) end ---@type function (path: string): boolean

function reaper.FindTempoTimeSigMarker(project, time) end ---@type function (project: ReaProject, time: number): integer

function reaper.format_timestr(tpos, buf) end ---@type function (tpos: number, buf: string): buf: string

function reaper.format_timestr_len(tpos, buf, offset, modeoverride) end ---@type function (tpos: number, buf: string, offset: number, modeoverride: integer): buf: string

function reaper.format_timestr_pos(tpos, buf, modeoverride) end ---@type function (tpos: number, buf: string, modeoverride: integer): buf: string

function reaper.genGuid(gGUID) end ---@type function (gGUID: string): gGUID: string

function reaper.get_config_var_string(name) end ---@type function (name: string): retval: boolean, buf: string

function reaper.get_ini_file() end ---@type function (): string

function reaper.GetActiveTake(item) end ---@type function (item: MediaItem): MediaItem_Take

function reaper.GetAllProjectPlayStates(ignoreProject) end ---@type function (ignoreProject: ReaProject): integer

function reaper.GetAppVersion() end ---@type function (): string

function reaper.GetAudioAccessorEndTime(accessor) end ---@type function (accessor: AudioAccessor): number

function reaper.GetAudioAccessorHash(accessor, hashNeed128) end ---@type function (accessor: AudioAccessor, hashNeed128: string): hashNeed128: string

function reaper.GetAudioAccessorSamples(accessor, samplerate, numchannels, starttime_sec, numsamplesperchannel, samplebuffer) end ---@type function (accessor: AudioAccessor, samplerate: integer, numchannels: integer, starttime_sec: number, numsamplesperchannel: integer, samplebuffer: array): integer

function reaper.GetAudioAccessorStartTime(accessor) end ---@type function (accessor: AudioAccessor): number

function reaper.GetAudioDeviceInfo(attribute, desc) end ---@type function (attribute: string, desc: string): retval: boolean, desc: string

function reaper.GetConfigWantsDock(ident_str) end ---@type function (ident_str: string): integer

function reaper.GetCurrentProjectInLoadSave() end ---@type function (): ReaProject

function reaper.GetCursorContext() end ---@type function (): integer

function reaper.GetCursorContext2(want_last_valid) end ---@type function (want_last_valid: boolean): integer

function reaper.GetCursorPosition() end ---@type function (): number

function reaper.GetCursorPositionEx(proj) end ---@type function (proj: ReaProject): number

function reaper.GetDisplayedMediaItemColor(item) end ---@type function (item: MediaItem): integer

function reaper.GetDisplayedMediaItemColor2(item, take) end ---@type function (item: MediaItem, take: MediaItem_Take): integer

function reaper.GetEnvelopeInfo_Value(tr, parmname) end ---@type function (tr: TrackEnvelope, parmname: string): retval: number

function reaper.GetEnvelopeName(env, buf) end ---@type function (env: TrackEnvelope, buf: string): retval: boolean, buf: string

function reaper.GetEnvelopePoint(envelope, ptidx) end ---@type function (envelope: TrackEnvelope, ptidx: integer): retval: boolean, number: optional, number: optional, number: optional, number: optional, boolean: optional

function reaper.GetEnvelopePointByTime(envelope, time) end ---@type function (envelope: TrackEnvelope, time: number): integer

function reaper.GetEnvelopePointByTimeEx(envelope, autoitem_idx, time) end ---@type function (envelope: TrackEnvelope, autoitem_idx: integer, time: number): integer

function reaper.GetEnvelopePointEx(envelope, autoitem_idx, ptidx) end ---@type function (envelope: TrackEnvelope, autoitem_idx: integer, ptidx: integer): retval: boolean, number: optional, number: optional, number: optional, number: optional, boolean: optional

function reaper.GetEnvelopeScalingMode(env) end ---@type function (env: TrackEnvelope): integer

function reaper.GetEnvelopeStateChunk(env, str, isundo) end ---@type function (env: TrackEnvelope, str: string, isundo: boolean): retval: boolean, str: string

function reaper.GetExePath() end ---@type function (): string

function reaper.GetExtState(section, key) end ---@type function (section: string, key: string): string

function reaper.GetFocusedFX() end ---@type function (): retval: integer, tracknumber: integer, itemnumber: integer, fxnumber: integer

function reaper.GetFocusedFX2() end ---@type function (): retval: integer, tracknumber: number, itemnumber: number, fxnumber: number

function reaper.GetFreeDiskSpaceForRecordPath(proj, pathidx) end ---@type function (proj: ReaProject, pathidx: integer): integer

function reaper.GetFXEnvelope(track, fxindex, parameterindex, create) end ---@type function (track: MediaTrack, fxindex: integer, parameterindex: integer, create: boolean): TrackEnvelope

function reaper.GetGlobalAutomationOverride() end ---@type function (): integer

function reaper.GetHZoomLevel() end ---@type function (): number

function reaper.GetInputChannelName(channelIndex) end ---@type function (channelIndex: integer): string

function reaper.GetInputOutputLatency() end ---@type function (): inputlatency: number, outputLatency: number

function reaper.GetItemEditingTime2() end ---@type function (): position: number, which_item: PCM_source, flags: number

function reaper.GetItemFromPoint(screen_x, screen_y, allow_locked, MediaItem_Take) end ---@type function (screen_x: integer, screen_y: integer, allow_locked: boolean, MediaItem_Take: optional): take: MediaItem_Take

function reaper.GetItemProjectContext(item) end ---@type function (item: MediaItem): ReaProject

function reaper.GetItemStateChunk(item, str, isundo) end ---@type function (item: MediaItem, str: string, isundo: boolean): retval: boolean, str: string

function reaper.GetLastColorThemeFile() end ---@type function (): string

function reaper.GetLastMarkerAndCurRegion(proj, time) end ---@type function (proj: ReaProject, time: number): markeridx: integer, regionidx: integer

function reaper.GetLastTouchedFX() end ---@type function (): retval: boolean, tracknumber: integer, fxnumber: integer, paramnumber: integer

function reaper.GetLastTouchedTrack() end ---@type function (): MediaTrack

function reaper.GetMainHwnd() end ---@type function (): hwnd: HWND

function reaper.GetMasterMuteSoloFlags() end ---@type function (): mastermutesolo: integer

function reaper.GetMasterTrack(proj) end ---@type function (proj: ReaProject): track: MediaTrack

function reaper.GetMasterTrackVisibility() end ---@type function (): master_visibility: integer

function reaper.GetMaxMidiInputs() end ---@type function (): integer

function reaper.GetMaxMidiOutputs() end ---@type function (): integer

function reaper.GetMediaItem(proj, itemidx) end ---@type function (proj: ReaProject, itemidx: integer): MediaItem

function reaper.GetMediaItem_Track(item) end ---@type function (item: MediaItem): track: MediaTrack

function reaper.GetArmedCommand() end ---@type function (): retval: integer, sec: string

function reaper.ArmCommand(cmd, sectionname) end ---@type function (cmd: integer, sectionname: string)

function reaper.GetMediaItemInfo_Value(item, parmname) end ---@type function (item: MediaItem, parmname: string): retval: number

function reaper.GetMediaItemNumTakes(item) end ---@type function (item: MediaItem): itemnumtakes: integer

function reaper.GetMediaItemTake(item, tk) end ---@type function (item: MediaItem, tk: integer): MediaItem_Take

function reaper.GetMediaItemTake_Item(take) end ---@type function (take: MediaItem_Take): item: MediaItem

function reaper.GetMediaItemTake_Peaks(take, peakrate, starttime, numchannels, numsamplesperchannel, want_extra_type, buf) end ---@type function (take: MediaItem_Take, peakrate: number, starttime: number, numchannels: integer, numsamplesperchannel: integer, want_extra_type: integer, buf: array): peaks: integer

function reaper.GetMediaItemTake_Source(take) end ---@type function (take: MediaItem_Take): source: PCM_source

function reaper.GetMediaItemTake_Track(take) end ---@type function (take: MediaItem_Take): track: MediaTrack

function reaper.GetMediaItemTakeByGUID(project, guidGUID) end ---@type function (project: ReaProject, guidGUID: string): take: MediaItem_Take

function reaper.GetMediaItemTakeInfo_Value(take, parmname) end ---@type function (take: MediaItem_Take, parmname: string): retval: number

function reaper.GetMediaItemTrack(item) end ---@type function (item: MediaItem): MediaTrack

function reaper.GetMediaSourceFileName(source, filenamebuf) end ---@type function (source: PCM_source, filenamebuf: string): filenamebuf: string

function reaper.GetMediaSourceLength(source) end ---@type function (source: PCM_source): retval: number, lengthIsQN: boolean

function reaper.GetMediaSourceNumChannels(source) end ---@type function (source: PCM_source): mediasourcenumchans: integer

function reaper.GetMediaSourceParent(src) end ---@type function (src: PCM_source): PCM_source

function reaper.GetMediaSourceSampleRate(source) end ---@type function (source: PCM_source): mediasourcesamplerate: integer

function reaper.GetMediaSourceType(source, typebuf) end ---@type function (source: PCM_source, typebuf: string): typebuf: string

function reaper.GetMediaTrackInfo_Value(tr, parmname) end ---@type function (tr: MediaTrack, parmname: string): retval: number

function reaper.GetMIDIInputName(dev, nameout) end ---@type function (dev: integer, nameout: string): retval: boolean, nameout: string

function reaper.GetMIDIOutputName(dev, nameout) end ---@type function (dev: integer, nameout: string): retval: boolean, nameout: string

function reaper.GetMixerScroll() end ---@type function (): leftmosttrack: MediaTrack

function reaper.GetMouseModifier(context, modifier_flag, action) end ---@type function (context: string, modifier_flag: integer, action: string): action: string

function reaper.GetMousePosition() end ---@type function (): x: integer, y: integer

function reaper.GetNumAudioInputs() end ---@type function (): numAudioIns: integer

function reaper.GetNumAudioOutputs() end ---@type function (): numAudioOuts: integer

function reaper.GetNumMIDIInputs() end ---@type function (): numMidiIns: integer

function reaper.GetNumMIDIOutputs() end ---@type function (): numMidiOuts: integer

function reaper.GetNumTakeMarkers(take) end ---@type function (take: MediaItem_Take): retval: integer

function reaper.GetNumTracks() end ---@type function (): numtracks: integer

function reaper.GetOS() end ---@type function (): os: string

function reaper.GetOutputChannelName(channelIndex) end ---@type function (channelIndex: integer): outputchanname: string

function reaper.GetOutputLatency() end ---@type function (): outputlatency: number

function reaper.GetParentTrack(track) end ---@type function (track: MediaTrack): parenttrack: MediaTrack

function reaper.GetPeakFileName(fn, buf) end ---@type function (fn: string, buf: string): buf: string

function reaper.GetPeakFileNameEx(fn, buf, forWrite) end ---@type function (fn: string, buf: string, forWrite: boolean): buf: string

function reaper.GetPeakFileNameEx2(fn, buf, forWrite, peaksfileextension) end ---@type function (fn: string, buf: string, forWrite: boolean, peaksfileextension: string): buf: string

function reaper.GetPlayPosition() end ---@type function (): playposition: number

function reaper.GetPlayPosition2() end ---@type function (): playposition: number

function reaper.GetPlayPosition2Ex(proj) end ---@type function (proj: ReaProject): playposition: number

function reaper.GetPlayPositionEx(proj) end ---@type function (proj: ReaProject): playposition: number

function reaper.GetPlayState() end ---@type function (): playstate: integer

function reaper.GetPlayStateEx(proj) end ---@type function (proj: ReaProject): playstate: integer

function reaper.GetProjectLength(proj) end ---@type function (proj: ReaProject): length: number

function reaper.GetProjectName(proj, buf) end ---@type function (proj: ReaProject, buf: string): buf: string

function reaper.GetProjectPath(buf) end ---@type function (buf: string): buf: string

function reaper.GetProjectPathEx(proj, buf) end ---@type function (proj: ReaProject, buf: string): buf: string

function reaper.GetProjectStateChangeCount(proj) end ---@type function (proj: ReaProject): integer

function reaper.GetProjectTimeOffset(proj, rndframe) end ---@type function (proj: ReaProject, rndframe: boolean): number

function reaper.GetProjectTimeSignature() end ---@type function (): bpm: number, bpi: number

function reaper.GetProjectTimeSignature2(proj) end ---@type function (proj: ReaProject): bpm: number, bpi: number

function reaper.GetProjExtState(proj, extname, key) end ---@type function (proj: ReaProject, extname: string, key: string): retval: integer, val: string

function reaper.GetResourcePath() end ---@type function (): string

function reaper.GetSelectedEnvelope(proj) end ---@type function (proj: ReaProject): TrackEnvelope

function reaper.GetSelectedMediaItem(proj, selitem) end ---@type function (proj: ReaProject, selitem: integer): MediaItem

function reaper.GetSelectedTrack(proj, seltrackidx) end ---@type function (proj: ReaProject, seltrackidx: integer): MediaTrack

function reaper.GetSelectedTrack2(proj, seltrackidx, wantmaster) end ---@type function (proj: ReaProject, seltrackidx: integer, wantmaster: boolean): MediaTrack

function reaper.GetSelectedTrackEnvelope(proj) end ---@type function (proj: ReaProject): TrackEnvelope

function reaper.GetSet_ArrangeView2(proj, isSet, screen_x_start, screen_x_end, start_time, end_time) end ---@type function (proj: ReaProject, isSet: boolean, screen_x_start: integer, screen_x_end: integer, start_time: number, end_time: number): start_time: number, end_time: number

function reaper.GetSet_LoopTimeRange(isSet, isLoop, start, end, allowautoseek) end ---@type function (isSet: boolean, isLoop: boolean, start: number, end: number, allowautoseek: boolean): start: number, end: number

function reaper.GetSet_LoopTimeRange2(proj, isSet, isLoop, start, end, allowautoseek) end ---@type function (proj: ReaProject, isSet: boolean, isLoop: boolean, start: number, end: number, allowautoseek: boolean): start: number, end: number

function reaper.GetSetAutomationItemInfo(env, autoitem_idx, desc, value, is_set) end ---@type function (env: TrackEnvelope, autoitem_idx: integer, desc: string, value: number, is_set: boolean): number

function reaper.GetSetAutomationItemInfo_String(env, autoitem_idx, desc, valuestrNeedBig, is_set) end ---@type function (env: TrackEnvelope, autoitem_idx: integer, desc: string, valuestrNeedBig: string, is_set: boolean): retval: boolean, valuestrNeedBig: string

function reaper.GetSetEnvelopeInfo_String(env, parmname, stringNeedBig, setNewValue) end ---@type function (env: TrackEnvelope, parmname: string, stringNeedBig: string, setNewValue: boolean): retval: boolean, stringNeedBig: string

function reaper.GetSetEnvelopeState(env, str) end ---@type function (env: TrackEnvelope, str: string): retval: boolean, str: string

function reaper.GetSetEnvelopeState2(env, str, isundo) end ---@type function (env: TrackEnvelope, str: string, isundo: boolean): retval: boolean, str: string

function reaper.GetSetItemState(item, str) end ---@type function (item: MediaItem, str: string): retval: boolean, str: string

function reaper.GetSetItemState2(item, str, isundo) end ---@type function (item: MediaItem, str: string, isundo: boolean): retval: boolean, str: string

function reaper.GetSetMediaItemInfo_String(item, parmname, stringNeedBig, setNewValue) end ---@type function (item: MediaItem, parmname: string, stringNeedBig: string, setNewValue: boolean): retval: boolean, stringNeedBig: string

function reaper.GetSetMediaItemTakeInfo_String(tk, parmname, stringNeedBig, setnewvalue) end ---@type function (tk: MediaItem_Take, parmname: string, stringNeedBig: string, setnewvalue: boolean): retval: boolean, stringNeedBig: string

function reaper.GetSetMediaTrackInfo_String(tr, parmname, stringNeedBig, setnewvalue) end ---@type function (tr: MediaTrack, parmname: string, stringNeedBig: string, setnewvalue: boolean): retval: boolean, stringNeedBig: string

function reaper.GetSetProjectAuthor(proj, set, author) end ---@type function (proj: ReaProject, set: boolean, author: string): author: string

function reaper.GetSetProjectGrid(project, set) end ---@type function (project: ReaProject, set: boolean): retval: integer, number: optional, number: optional, number: optional

function reaper.GetSetProjectInfo(project, desc, value, is_set) end ---@type function (project: ReaProject, desc: string, value: number, is_set: boolean): value: number

function reaper.GetSetProjectInfo_String(project, desc, valuestrNeedBig, is_set) end ---@type function (project: ReaProject, desc: string, valuestrNeedBig: string, is_set: boolean): retval: boolean, valuestrNeedBig: string

function reaper.GetSetProjectNotes(proj, set, notes) end ---@type function (proj: ReaProject, set: boolean, notes: string): notes: string

function reaper.GetSetRepeat(val) end ---@type function (val: integer): integer

function reaper.GetSetRepeatEx(proj, val) end ---@type function (proj: ReaProject, val: integer): integer

function reaper.GetSetTrackGroupMembership(tr, groupname, setmask, setvalue) end ---@type function (tr: MediaTrack, groupname: string, setmask: integer, setvalue: integer): integer

function reaper.GetSetTrackState(track, str) end ---@type function (track: MediaTrack, str: string): retval: boolean, str: string

function reaper.GetSetTrackState2(track, str, isundo) end ---@type function (track: MediaTrack, str: string, isundo: boolean): retval: boolean, str: string

function reaper.GetSubProjectFromSource(src) end ---@type function (src: PCM_source): ReaProject

function reaper.GetTake(item, takeidx) end ---@type function (item: MediaItem, takeidx: integer): MediaItem_Take

function reaper.GetTakeEnvelope(take, envidx) end ---@type function (take: MediaItem_Take, envidx: integer): TrackEnvelope

function reaper.GetTakeEnvelopeByName(take, envname) end ---@type function (take: MediaItem_Take, envname: string): TrackEnvelope

function reaper.GetTakeMarker(take, idx) end ---@type function (take: MediaItem_Take, idx: integer): position: number, name: string, number: optional

function reaper.GetTakeName(take) end ---@type function (take: MediaItem_Take): string

function reaper.GetTakeNumStretchMarkers(take) end ---@type function (take: MediaItem_Take): integer

function reaper.GetTakeStretchMarker(take, idx) end ---@type function (take: MediaItem_Take, idx: integer): retval: integer, pos: number, number: optional

function reaper.GetTakeStretchMarkerSlope(take, idx) end ---@type function (take: MediaItem_Take, idx: integer): number

function reaper.GetTCPFXParm(project, track, index) end ---@type function (project: ReaProject, track: MediaTrack, index: integer): retval: boolean, fxindex: number, parmidx: number

function reaper.GetTempoMatchPlayRate(source, srcscale, position, mult) end ---@type function (source: PCM_source, srcscale: number, position: number, mult: number): retval: boolean, rate: number, targetlen: number

function reaper.GetTempoTimeSigMarker(proj, ptidx) end ---@type function (proj: ReaProject, ptidx: integer): retval: boolean, timepos: number, measurepos: number, beatpos: number, bpm: number, timesig_num: number, timesig_denom: number, lineartempo: boolean

function reaper.GetThemeColor(ini_key, flags) end ---@type function (ini_key: string, flags: integer): retval: integer

function reaper.GetToggleCommandState(command_id) end ---@type function (command_id: integer): integer

function reaper.GetToggleCommandStateEx(section_id, command_id) end ---@type function (section_id: integer, command_id: integer): integer

function reaper.GetTooltipWindow() end ---@type function (): HWND

function reaper.GetTrack(proj, trackidx) end ---@type function (proj: ReaProject, trackidx: integer): MediaTrack

function reaper.GetTrackAutomationMode(tr) end ---@type function (tr: MediaTrack): integer

function reaper.GetTrackColor(track) end ---@type function (track: MediaTrack): integer

function reaper.GetTrackDepth(track) end ---@type function (track: MediaTrack): integer

function reaper.GetTrackEnvelope(track, envidx) end ---@type function (track: MediaTrack, envidx: integer): TrackEnvelope

function reaper.GetTrackEnvelopeByChunkName(tr, cfgchunkname) end ---@type function (tr: MediaTrack, cfgchunkname: string): TrackEnvelope

function reaper.GetTrackEnvelopeByName(track, envname) end ---@type function (track: MediaTrack, envname: string): TrackEnvelope

function reaper.GetTrackFromPoint(screen_x, screen_y) end ---@type function (screen_x: integer, screen_y: integer): retval: MediaTrack, number: optional

function reaper.GetTrackGUID(tr) end ---@type function (tr: MediaTrack): GUID: string

function reaper.GetTrackMediaItem(tr, itemidx) end ---@type function (tr: MediaTrack, itemidx: integer): MediaItem

function reaper.GetTrackMIDILyrics(track, flag, bufWant) end ---@type function (track: MediaTrack, flag: integer, bufWant: string): retval: boolean, bufWant: string

function reaper.GetTrackMIDINoteName(track, pitch, chan) end ---@type function (track: integer, pitch: integer, chan: integer): string

function reaper.GetTrackMIDINoteNameEx(proj, track, pitch, chan) end ---@type function (proj: ReaProject, track: MediaTrack, pitch: integer, chan: integer): string

function reaper.GetTrackMIDINoteRange(proj, track) end ---@type function (proj: ReaProject, track: MediaTrack): note_lo: number, note_hi: number

function reaper.GetTrackName(track) end ---@type function (track: MediaTrack): retval: boolean, buf: string

function reaper.GetTrackNumMediaItems(tr) end ---@type function (tr: MediaTrack): integer

function reaper.GetTrackNumSends(tr, category) end ---@type function (tr: MediaTrack, category: integer): integer

function reaper.GetTrackReceiveName(track, recv_index, buf) end ---@type function (track: MediaTrack, recv_index: integer, buf: string): retval: boolean, buf: string

function reaper.GetTrackReceiveUIMute(track, recv_index) end ---@type function (track: MediaTrack, recv_index: integer): retval: boolean, mute: boolean

function reaper.GetTrackReceiveUIVolPan(track, recv_index) end ---@type function (track: MediaTrack, recv_index: integer): retval: boolean, volume: number, pan: number

function reaper.GetTrackSendInfo_Value(tr, category, sendidx, parmname) end ---@type function (tr: MediaTrack, category: integer, sendidx: integer, parmname: string): number

function reaper.GetTrackSendName(track, send_index, buf) end ---@type function (track: MediaTrack, send_index: integer, buf: string): retval: boolean, buf: string

function reaper.GetTrackSendUIMute(track, send_index) end ---@type function (track: MediaTrack, send_index: integer): retval: boolean, mute: boolean

function reaper.GetTrackSendUIVolPan(track, send_index) end ---@type function (track: MediaTrack, send_index: integer): retval: boolean, volume: number, pan: number

function reaper.GetTrackState(track) end ---@type function (track: MediaTrack): retval: string, flags: number

function reaper.GetTrackStateChunk(track, str, isundo) end ---@type function (track: MediaTrack, str: string, isundo: boolean): retval: boolean, str: string

function reaper.GetTrackUIMute(track) end ---@type function (track: MediaTrack): retval: boolean, mute: boolean

function reaper.GetTrackUIPan(track) end ---@type function (track: MediaTrack): retval: boolean, pan1: number, pan2: number, panmode: number

function reaper.GetTrackUIVolPan(track) end ---@type function (track: MediaTrack): retval: boolean, volume: number, pan: number

function reaper.GetUnderrunTime() end ---@type function (): number: optional, retval: audio_xrun, number: optional, number: optional

function reaper.GetUserFileNameForRead(filenameNeed4096, title, defext) end ---@type function (filenameNeed4096: string, title: string, defext: string): retval: boolean, filenameNeed4096: string

function reaper.GetUserInputs(title, num_inputs, captions_csv, retvals_csv) end ---@type function (title: string, num_inputs: integer, captions_csv: string, retvals_csv: string): retval: boolean, retvals_csv: string

function reaper.GoToMarker(proj, marker_index, use_timeline_order) end ---@type function (proj: ReaProject, marker_index: integer, use_timeline_order: boolean)

function reaper.GoToRegion(proj, region_index, use_timeline_order) end ---@type function (proj: ReaProject, region_index: integer, use_timeline_order: boolean)

function reaper.GR_SelectColor(hwnd) end ---@type function (hwnd: HWND): retval: integer, color: number

function reaper.GSC_mainwnd(t) end ---@type function (t: integer): integer

function reaper.guidToString(gGUID, destNeed64) end ---@type function (gGUID: string, destNeed64: string): destNeed64: string

function reaper.HasExtState(section, key) end ---@type function (section: string, key: string): boolean

function reaper.HasTrackMIDIPrograms(track) end ---@type function (track: integer): string

function reaper.HasTrackMIDIProgramsEx(proj, track) end ---@type function (proj: ReaProject, track: MediaTrack): string

function reaper.Help_Set(helpstring, is_temporary_help) end ---@type function (helpstring: string, is_temporary_help: boolean)

function reaper.image_resolve_fn(in, out) end ---@type function (in: string, out: string): out: string

function reaper.InsertAutomationItem(env, pool_id, position, length) end ---@type function (env: TrackEnvelope, pool_id: integer, position: number, length: number): integer

function reaper.InsertEnvelopePoint(envelope, time, value, shape, tension, selected, boolean) end ---@type function (envelope: TrackEnvelope, time: number, value: number, shape: integer, tension: number, selected: boolean, boolean: optional): boolean

function reaper.InsertEnvelopePointEx(envelope, autoitem_idx, time, value, shape, tension, selected, boolean) end ---@type function (envelope: TrackEnvelope, autoitem_idx: integer, time: number, value: number, shape: integer, tension: number, selected: boolean, boolean: optional): boolean

function reaper.InsertMedia(file, mode) end ---@type function (file: string, mode: integer): integer

function reaper.InsertMediaSection(file, mode, startpct, endpct, pitchshift) end ---@type function (file: string, mode: integer, startpct: number, endpct: number, pitchshift: number): integer

function reaper.InsertTrackAtIndex(idx, wantDefaults) end ---@type function (idx: integer, wantDefaults: boolean)

function reaper.IsMediaExtension(ext, wantOthers) end ---@type function (ext: string, wantOthers: boolean): boolean

function reaper.IsMediaItemSelected(item) end ---@type function (item: MediaItem): boolean

function reaper.IsProjectDirty(proj) end ---@type function (proj: ReaProject): integer

function reaper.IsTrackSelected(track) end ---@type function (track: MediaTrack): boolean

function reaper.IsTrackVisible(track, mixer) end ---@type function (track: MediaTrack, mixer: boolean): boolean

function reaper.joystick_create(guidGUID) end ---@type function (guidGUID: string): joystick_device

function reaper.joystick_destroy(device) end ---@type function (device: joystick_device)

function reaper.joystick_enum(index) end ---@type function (index: integer): retval: string, string: optional

function reaper.joystick_getaxis(dev, axis) end ---@type function (dev: joystick_device, axis: integer): number

function reaper.joystick_getbuttonmask(dev) end ---@type function (dev: joystick_device): integer

function reaper.joystick_getinfo(dev) end ---@type function (dev: joystick_device): retval: integer, number: optional, number: optional

function reaper.joystick_getpov(dev, pov) end ---@type function (dev: joystick_device, pov: integer): number

function reaper.joystick_update(dev) end ---@type function (dev: joystick_device): boolean

function reaper.LICE_ClipLine(pX1, pY1, pX2, pY2, xLo, yLo, xHi, yHi) end ---@type function (pX1: number, pY1: number, pX2: number, pY2: number, xLo: integer, yLo: integer, xHi: integer, yHi: integer): retval: boolean, pX1: number, pY1: number, pX2: number, pY2: number

function reaper.LocalizeString(src_string, section, flags) end ---@type function (src_string: string, section: string, flags: integer): retval: string

function reaper.Loop_OnArrow(project, direction) end ---@type function (project: ReaProject, direction: integer): boolean

function reaper.Main_OnCommand(command, flag) end ---@type function (command: integer, flag: integer)

function reaper.Main_OnCommandEx(command, flag, proj) end ---@type function (command: integer, flag: integer, proj: ReaProject)

function reaper.Main_openProject(name) end ---@type function (name: string)

function reaper.Main_SaveProject(proj, forceSaveAsIn) end ---@type function (proj: ReaProject, forceSaveAsIn: boolean)

function reaper.Main_UpdateLoopInfo(ignoremask) end ---@type function (ignoremask: integer)

function reaper.MarkProjectDirty(proj) end ---@type function (proj: ReaProject)

function reaper.MarkTrackItemsDirty(track, item) end ---@type function (track: MediaTrack, item: MediaItem)

function reaper.Master_GetPlayRate(project) end ---@type function (project: ReaProject): number

function reaper.Master_GetPlayRateAtTime(time_s, proj) end ---@type function (time_s: number, proj: ReaProject): number

function reaper.Master_GetTempo() end ---@type function (): number

function reaper.Master_NormalizePlayRate(playrate, isnormalized) end ---@type function (playrate: number, isnormalized: boolean): number

function reaper.Master_NormalizeTempo(bpm, isnormalized) end ---@type function (bpm: number, isnormalized: boolean): number

function reaper.MB(msg, title, type) end ---@type function (msg: string, title: string, type: integer): integer

function reaper.MediaItemDescendsFromTrack(item, track) end ---@type function (item: MediaItem, track: MediaTrack): integer

function reaper.MIDI_CountEvts(take) end ---@type function (take: MediaItem_Take): retval: integer, notecnt: number, ccevtcnt: number, textsyxevtcnt: number

function reaper.MIDI_DeleteCC(take, ccidx) end ---@type function (take: MediaItem_Take, ccidx: integer): boolean

function reaper.MIDI_DeleteEvt(take, evtidx) end ---@type function (take: MediaItem_Take, evtidx: integer): boolean

function reaper.MIDI_DeleteNote(take, noteidx) end ---@type function (take: MediaItem_Take, noteidx: integer): boolean

function reaper.MIDI_DeleteTextSysexEvt(take, textsyxevtidx) end ---@type function (take: MediaItem_Take, textsyxevtidx: integer): boolean

function reaper.MIDI_DisableSort(take) end ---@type function (take: MediaItem_Take)

function reaper.MIDI_EnumSelCC(take, ccidx) end ---@type function (take: MediaItem_Take, ccidx: integer): integer

function reaper.MIDI_EnumSelEvts(take, evtidx) end ---@type function (take: MediaItem_Take, evtidx: integer): integer

function reaper.MIDI_EnumSelNotes(take, noteidx) end ---@type function (take: MediaItem_Take, noteidx: integer): integer

function reaper.MIDI_EnumSelTextSysexEvts(take, textsyxidx) end ---@type function (take: MediaItem_Take, textsyxidx: integer): integer

function reaper.MIDI_GetAllEvts(take, buf) end ---@type function (take: MediaItem_Take, buf: string): retval: boolean, buf: string

function reaper.MIDI_GetCC(take, ccidx) end ---@type function (take: MediaItem_Take, ccidx: integer): retval: boolean, selected: boolean, muted: boolean, ppqpos: number, chanmsg: number, chan: number, msg2: number, msg3: number

function reaper.MIDI_GetCCShape(take, ccidx) end ---@type function (take: MediaItem_Take, ccidx: integer): retval: boolean, shape: number, beztension: number

function reaper.MIDI_GetEvt(take, evtidx, selected, muted, ppqpos, msg) end ---@type function (take: MediaItem_Take, evtidx: integer, selected: boolean, muted: boolean, ppqpos: number, msg: string): retval: boolean, selected: boolean, muted: boolean, ppqpos: number, msg: string

function reaper.MIDI_GetGrid(take) end ---@type function (take: MediaItem_Take): retval: number, number: optional, number: optional

function reaper.MIDI_GetHash(take, notesonly, hash) end ---@type function (take: MediaItem_Take, notesonly: boolean, hash: string): retval: boolean, hash: string

function reaper.MIDI_GetNote(take, noteidx) end ---@type function (take: MediaItem_Take, noteidx: integer): retval: boolean, selected: boolean, muted: boolean, startppqpos: number, endppqpos: number, chan: number, pitch: number, vel: number

function reaper.MIDI_GetPPQPos_EndOfMeasure(take, ppqpos) end ---@type function (take: MediaItem_Take, ppqpos: number): number

function reaper.MIDI_GetPPQPos_StartOfMeasure(take, ppqpos) end ---@type function (take: MediaItem_Take, ppqpos: number): number

function reaper.MIDI_GetPPQPosFromProjQN(take, projqn) end ---@type function (take: MediaItem_Take, projqn: number): number

function reaper.MIDI_GetPPQPosFromProjTime(take, projtime) end ---@type function (take: MediaItem_Take, projtime: number): number

function reaper.MIDI_GetProjQNFromPPQPos(take, ppqpos) end ---@type function (take: MediaItem_Take, ppqpos: number): number

function reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos) end ---@type function (take: MediaItem_Take, ppqpos: number): number

function reaper.MIDI_GetScale(take, root, scale, name) end ---@type function (take: MediaItem_Take, root: number, scale: number, name: string): retval: boolean, root: number, scale: number, name: string

function reaper.MIDI_GetTextSysexEvt(take, textsyxevtidx, boolean, boolean, number, number, string) end ---@type function (take: MediaItem_Take, textsyxevtidx: integer, boolean: optional, boolean: optional, number: optional, number: optional, string: optional): retval: boolean, boolean: optional, boolean: optional, number: optional, number: optional, string: optional

function reaper.MIDI_GetTrackHash(track, notesonly, hash) end ---@type function (track: MediaTrack, notesonly: boolean, hash: string): retval: boolean, hash: string

function reaper.MIDI_InsertCC(take, selected, muted, ppqpos, chanmsg, chan, msg2, msg3) end ---@type function (take: MediaItem_Take, selected: boolean, muted: boolean, ppqpos: number, chanmsg: integer, chan: integer, msg2: integer, msg3: integer): boolean

function reaper.MIDI_InsertEvt(take, selected, muted, ppqpos, bytestr) end ---@type function (take: MediaItem_Take, selected: boolean, muted: boolean, ppqpos: number, bytestr: string): boolean

function reaper.MIDI_InsertNote(take, selected, muted, startppqpos, endppqpos, chan, pitch, vel, boolean) end ---@type function (take: MediaItem_Take, selected: boolean, muted: boolean, startppqpos: number, endppqpos: number, chan: integer, pitch: integer, vel: integer, boolean: optional): boolean

function reaper.MIDI_InsertTextSysexEvt(take, selected, muted, ppqpos, type, bytestr) end ---@type function (take: MediaItem_Take, selected: boolean, muted: boolean, ppqpos: number, type: integer, bytestr: string): boolean

function reaper.midi_reinit() end ---@type function ()

function reaper.MIDI_SelectAll(take, select) end ---@type function (take: MediaItem_Take, select: boolean)

function reaper.MIDI_SetAllEvts(take, buf) end ---@type function (take: MediaItem_Take, buf: string): boolean

function reaper.MIDI_SetCC(take, ccidx, boolean, boolean, number, number, number, number, number, boolean) end ---@type function (take: MediaItem_Take, ccidx: integer, boolean: optional, boolean: optional, number: optional, number: optional, number: optional, number: optional, number: optional, boolean: optional): boolean

function reaper.MIDI_SetCCShape(reaper, take, ccidx, shape, beztension, boolean) end ---@type function (reaper: boolean, take: MediaItem_Take, ccidx: integer, shape: integer, beztension: number, boolean: optional)

function reaper.MIDI_SetEvt(take, evtidx, boolean, boolean, number, string, boolean) end ---@type function (take: MediaItem_Take, evtidx: integer, boolean: optional, boolean: optional, number: optional, string: optional, boolean: optional): boolean

function reaper.MIDI_SetItemExtents(item, startQN, endQN) end ---@type function (item: MediaItem, startQN: number, endQN: number): boolean

function reaper.MIDI_SetNote(take, noteidx, boolean, boolean, number, number, number, number, number, boolean) end ---@type function (take: MediaItem_Take, noteidx: integer, boolean: optional, boolean: optional, number: optional, number: optional, number: optional, number: optional, number: optional, boolean: optional): boolean

function reaper.MIDI_SetTextSysexEvt(take, textsyxevtidx, boolean, boolean, number, number, string, boolean) end ---@type function (take: MediaItem_Take, textsyxevtidx: integer, boolean: optional, boolean: optional, number: optional, number: optional, string: optional, boolean: optional): boolean

function reaper.MIDI_Sort(take) end ---@type function (take: MediaItem_Take)

function reaper.MIDIEditor_GetActive() end ---@type function (): HWND

function reaper.MIDIEditor_GetMode(midieditor) end ---@type function (midieditor: HWND): integer

function reaper.MIDIEditor_GetSetting_int(midieditor, setting_desc) end ---@type function (midieditor: HWND, setting_desc: string): integer

function reaper.MIDIEditor_GetSetting_str(midieditor, setting_desc, buf) end ---@type function (midieditor: HWND, setting_desc: string, buf: string): retval: boolean, buf: string

function reaper.MIDIEditor_GetTake(midieditor) end ---@type function (midieditor: HWND): MediaItem_Take

function reaper.MIDIEditor_LastFocused_OnCommand(command_id, islistviewcommand) end ---@type function (command_id: integer, islistviewcommand: boolean): boolean

function reaper.MIDIEditor_OnCommand(midieditor, command_id) end ---@type function (midieditor: HWND, command_id: integer): boolean

function reaper.MIDIEditor_SetSetting_int(midieditor, setting_desc, setting) end ---@type function (midieditor: HWND, setting_desc: string, setting: integer): retval: boolean

function reaper.mkpanstr(strNeed64, pan) end ---@type function (strNeed64: string, pan: number): strNeed64: string

function reaper.mkvolpanstr(strNeed64, vol, pan) end ---@type function (strNeed64: string, vol: number, pan: number): strNeed64: string

function reaper.mkvolstr(strNeed64, vol) end ---@type function (strNeed64: string, vol: number): strNeed64: string

function reaper.MoveEditCursor(adjamt, dosel) end ---@type function (adjamt: number, dosel: boolean)

function reaper.MoveMediaItemToTrack(item, desttr) end ---@type function (item: MediaItem, desttr: MediaTrack): boolean

function reaper.MuteAllTracks(mute) end ---@type function (mute: boolean)

function reaper.my_getViewport(r, r, r, r, sr, sr, sr, sr, wantWorkArea) end ---@type function (r: number, r: number, r: number, r: number, sr: number, sr: number, sr: number, sr: number, wantWorkArea: boolean): left: integer, top: integer, right: integer, bottom: integer

function reaper.NamedCommandLookup(command_name) end ---@type function (command_name: string): integer

function reaper.OnPauseButton() end ---@type function ()

function reaper.OnPauseButtonEx(proj) end ---@type function (proj: ReaProject)

function reaper.OnPlayButton() end ---@type function ()

function reaper.OnPlayButtonEx(proj) end ---@type function (proj: ReaProject)

function reaper.OnStopButton() end ---@type function ()

function reaper.OnStopButtonEx(proj) end ---@type function (proj: ReaProject)

function reaper.OpenColorThemeFile(fn) end ---@type function (fn: string): retval: boolean

function reaper.OpenMediaExplorer(mediafn, play) end ---@type function (mediafn: string, play: boolean): HWND

function reaper.OscLocalMessageToHost(message, number) end ---@type function (message: string, number: optional)

function reaper.parse_timestr(buf) end ---@type function (buf: string): timestr: number

function reaper.parse_timestr_len(buf, offset, modeoverride) end ---@type function (buf: string, offset: number, modeoverride: integer): number

function reaper.parse_timestr_pos(buf, modeoverride) end ---@type function (buf: string, modeoverride: integer): number

function reaper.parsepanstr(str) end ---@type function (str: string): retval: number

function reaper.PCM_Sink_Enum(idx) end ---@type function (idx: integer): retval: integer, descstr: string

function reaper.PCM_Sink_GetExtension(data) end ---@type function (data: string): string

function reaper.PCM_Sink_ShowConfig(cfg, hwndParent) end ---@type function (cfg: string, hwndParent: HWND): HWND

function reaper.PCM_Source_CreateFromFile(filename) end ---@type function (filename: string): PCM_source

function reaper.PCM_Source_CreateFromFileEx(filename, forcenoMidiImp) end ---@type function (filename: string, forcenoMidiImp: boolean): PCM_source

function reaper.PCM_Source_CreateFromType(sourcetype) end ---@type function (sourcetype: string): PCM_source

function reaper.PCM_Source_Destroy(src) end ---@type function (src: PCM_source)

function reaper.PCM_Source_GetPeaks(src, peakrate, starttime, numchannels, numsamplesperchannel, want_extra_type, buf) end ---@type function (src: PCM_source, peakrate: number, starttime: number, numchannels: integer, numsamplesperchannel: integer, want_extra_type: integer, buf: array): integer

function reaper.PCM_Source_GetSectionInfo(src) end ---@type function (src: PCM_source): retval: boolean, offs: number, len: number, rev: boolean

function reaper.PluginWantsAlwaysRunFx(amt) end ---@type function (amt: integer)

function reaper.PreventUIRefresh(prevent_count) end ---@type function (prevent_count: integer)

function reaper.PromptForAction(session_mode, init_id, section_id) end ---@type function (session_mode: integer, init_id: integer, section_id: integer): retval: integer

function reaper.ReaScriptError(errmsg) end ---@type function (errmsg: string)

function reaper.RecursiveCreateDirectory(path, ignored) end ---@type function (path: string, ignored: integer): integer

function reaper.reduce_open_files(reaper, flags) end ---@type function (reaper: integer, flags: integer)

function reaper.RefreshToolbar(command_id) end ---@type function (command_id: integer)

function reaper.RefreshToolbar2(section_id, command_id) end ---@type function (section_id: integer, command_id: integer)

function reaper.relative_fn(in, out) end ---@type function (in: string, out: string): out: string

function reaper.RemoveTrackSend(tr, category, sendidx) end ---@type function (tr: MediaTrack, category: integer, sendidx: integer): boolean

function reaper.RenderFileSection(source_filename, target_filename, start_percent, end_percent, playrate) end ---@type function (source_filename: string, target_filename: string, start_percent: number, end_percent: number, playrate: number): boolean

function reaper.ReorderSelectedTracks(beforeTrackIdx, makePrevFolder) end ---@type function (beforeTrackIdx: integer, makePrevFolder: integer): retval: boolean

function reaper.Resample_EnumModes(mode) end ---@type function (mode: integer): string

function reaper.resolve_fn(in, out) end ---@type function (in: string, out: string): out: string

function reaper.resolve_fn2(in, out, string) end ---@type function (in: string, out: string, string: optional): out: string

function reaper.ReverseNamedCommandLookup(command_id) end ---@type function (command_id: integer): string

function reaper.ScaleFromEnvelopeMode(scaling_mode, val) end ---@type function (scaling_mode: integer, val: number): number

function reaper.ScaleToEnvelopeMode(scaling_mode, val) end ---@type function (scaling_mode: integer, val: number): number

function reaper.SelectAllMediaItems(proj, selected) end ---@type function (proj: ReaProject, selected: boolean)

function reaper.SelectProjectInstance(proj) end ---@type function (proj: ReaProject)

function reaper.SetActiveTake(take) end ---@type function (take: MediaItem_Take)

function reaper.SetAutomationMode(mode, onlySel) end ---@type function (mode: integer, onlySel: boolean)

function reaper.SetCurrentBPM(proj, bpm, wantUndo) end ---@type function (proj: ReaProject, bpm: number, wantUndo: boolean)

function reaper.SetCursorContext(mode, envIn) end ---@type function (mode: integer, envIn: TrackEnvelope)

function reaper.SetEditCurPos(time, moveview, seekplay) end ---@type function (time: number, moveview: boolean, seekplay: boolean)

function reaper.SetEditCurPos2(proj, time, moveview, seekplay) end ---@type function (proj: ReaProject, time: number, moveview: boolean, seekplay: boolean)

function reaper.SetEnvelopePoint(envelope, ptidx, number, number, number, number, boolean, boolean) end ---@type function (envelope: TrackEnvelope, ptidx: integer, number: optional, number: optional, number: optional, number: optional, boolean: optional, boolean: optional): boolean

function reaper.SetEnvelopePointEx(envelope, autoitem_idx, ptidx, number, number, number, number, boolean, boolean) end ---@type function (envelope: TrackEnvelope, autoitem_idx: integer, ptidx: integer, number: optional, number: optional, number: optional, number: optional, boolean: optional, boolean: optional): boolean

function reaper.SetEnvelopeStateChunk(env, str, isundo) end ---@type function (env: TrackEnvelope, str: string, isundo: boolean): boolean

function reaper.SetExtState(section, key, value, persist) end ---@type function (section: string, key: string, value: string, persist: boolean)

function reaper.SetGlobalAutomationOverride(mode) end ---@type function (mode: integer)

function reaper.SetItemStateChunk(item, str, isundo) end ---@type function (item: MediaItem, str: string, isundo: boolean): boolean

function reaper.SetMasterTrackVisibility(flag) end ---@type function (flag: integer): integer

function reaper.SetMediaItemInfo_Value(item, parmname, newvalue) end ---@type function (item: MediaItem, parmname: string, newvalue: number): boolean

function reaper.SetMediaItemLength(item, length, refreshUI) end ---@type function (item: MediaItem, length: number, refreshUI: boolean): boolean

function reaper.SetMediaItemPosition(item, position, refreshUI) end ---@type function (item: MediaItem, position: number, refreshUI: boolean): boolean

function reaper.SetMediaItemSelected(item, selected) end ---@type function (item: MediaItem, selected: boolean)

function reaper.SetMediaItemTake_Source(take, source) end ---@type function (take: MediaItem_Take, source: PCM_source): boolean

function reaper.SetMediaItemTakeInfo_Value(take, parmname, newvalue) end ---@type function (take: MediaItem_Take, parmname: string, newvalue: number): boolean

function reaper.SetMediaTrackInfo_Value(tr, parmname, newvalue) end ---@type function (tr: MediaTrack, parmname: string, newvalue: number): boolean

function reaper.SetMIDIEditorGrid(project, division) end ---@type function (project: ReaProject, division: number)

function reaper.SetMixerScroll(leftmosttrack) end ---@type function (leftmosttrack: MediaTrack): MediaTrack

function reaper.SetMouseModifier(context, modifier_flag, action) end ---@type function (context: string, modifier_flag: integer, action: string)

function reaper.SetOnlyTrackSelected(track) end ---@type function (track: MediaTrack)

function reaper.SetProjectGrid(project, division) end ---@type function (project: ReaProject, division: number)

function reaper.SetProjectMarker(markrgnindexnumber, isrgn, pos, rgnend, name) end ---@type function (markrgnindexnumber: integer, isrgn: boolean, pos: number, rgnend: number, name: string): boolean

function reaper.SetProjectMarker2(proj, markrgnindexnumber, isrgn, pos, rgnend, name) end ---@type function (proj: ReaProject, markrgnindexnumber: integer, isrgn: boolean, pos: number, rgnend: number, name: string): boolean

function reaper.SetProjectMarker3(proj, markrgnindexnumber, isrgn, pos, rgnend, name, color) end ---@type function (proj: ReaProject, markrgnindexnumber: integer, isrgn: boolean, pos: number, rgnend: number, name: string, color: integer): boolean

function reaper.SetProjectMarker4(proj, markrgnindexnumber, isrgn, pos, rgnend, name, color, flags) end ---@type function (proj: ReaProject, markrgnindexnumber: integer, isrgn: boolean, pos: number, rgnend: number, name: string, color: integer, flags: integer): boolean

function reaper.SetProjectMarkerByIndex(proj, markrgnidx, isrgn, pos, rgnend, IDnumber, name, color) end ---@type function (proj: ReaProject, markrgnidx: integer, isrgn: boolean, pos: number, rgnend: number, IDnumber: integer, name: string, color: integer): boolean

function reaper.SetProjectMarkerByIndex2(proj, markrgnidx, isrgn, pos, rgnend, IDnumber, name, color, flags) end ---@type function (proj: ReaProject, markrgnidx: integer, isrgn: boolean, pos: number, rgnend: number, IDnumber: integer, name: string, color: integer, flags: integer): boolean

function reaper.SetProjExtState(proj, extname, key, value) end ---@type function (proj: ReaProject, extname: string, key: string, value: string): integer

function reaper.SetRegionRenderMatrix(proj, regionindex, track, addorremove) end ---@type function (proj: ReaProject, regionindex: integer, track: MediaTrack, addorremove: integer)

function reaper.SetTakeMarker(take, idx, nameIn, number, number) end ---@type function (take: MediaItem_Take, idx: integer, nameIn: string, number: optional, number: optional): index: integer

function reaper.SetTakeStretchMarker(take, idx, pos, number) end ---@type function (take: MediaItem_Take, idx: integer, pos: number, number: optional): integer

function reaper.SetTakeStretchMarkerSlope(take, idx, slope) end ---@type function (take: MediaItem_Take, idx: integer, slope: number): boolean

function reaper.SetTempoTimeSigMarker(proj, ptidx, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo) end ---@type function (proj: ReaProject, ptidx: integer, timepos: number, measurepos: integer, beatpos: number, bpm: number, timesig_num: integer, timesig_denom: integer, lineartempo: boolean): boolean

function reaper.SetThemeColor(ini_key, color, flags) end ---@type function (ini_key: string, color: integer, flags: integer): retval: integer

function reaper.SetToggleCommandState(section_id, command_id, state) end ---@type function (section_id: integer, command_id: integer, state: integer): boolean

function reaper.SetTrackAutomationMode(tr, mode) end ---@type function (tr: MediaTrack, mode: integer)

function reaper.SetTrackColor(track, color) end ---@type function (track: MediaTrack, color: integer)

function reaper.SetTrackMIDILyrics(track, flag, str) end ---@type function (track: MediaTrack, flag: integer, str: string): boolean

function reaper.SetTrackMIDINoteName(track, pitch, chan, name) end ---@type function (track: integer, pitch: integer, chan: integer, name: string): boolean

function reaper.SetTrackMIDINoteNameEx(proj, track, pitch, chan, name) end ---@type function (proj: ReaProject, track: MediaTrack, pitch: integer, chan: integer, name: string): boolean

function reaper.SetTrackSelected(track, selected) end ---@type function (track: MediaTrack, selected: boolean)

function reaper.SetTrackSendInfo_Value(tr, category, sendidx, parmname, newvalue) end ---@type function (tr: MediaTrack, category: integer, sendidx: integer, parmname: string, newvalue: number): boolean

function reaper.SetTrackSendUIPan(track, send_idx, pan, isend) end ---@type function (track: MediaTrack, send_idx: integer, pan: number, isend: integer): boolean

function reaper.SetTrackSendUIVol(track, send_idx, vol, isend) end ---@type function (track: MediaTrack, send_idx: integer, vol: number, isend: integer): boolean

function reaper.SetTrackStateChunk(track, str, isundo) end ---@type function (track: MediaTrack, str: string, isundo: boolean): boolean

function reaper.ShowPopupMenu(name, x, y, HWND, ctx, ctx2, ctx3) end ---@type function (name: string, x: integer, y: integer, HWND: optional, ctx: identifier, ctx2: integer, ctx3: integer)

function reaper.ShowActionList(caller, HWND) end ---@type function (caller: KbdSectionInfo, HWND: optional)

function reaper.ShowConsoleMsg(msg) end ---@type function (msg: string)

function reaper.ShowMessageBox(msg, title, type) end ---@type function (msg: string, title: string, type: integer): integer

function reaper.SLIDER2DB(y) end ---@type function (y: number): number

function reaper.SnapToGrid(project, time_pos) end ---@type function (project: ReaProject, time_pos: number): number

function reaper.SoloAllTracks(solo) end ---@type function (solo: integer)

function reaper.Splash_GetWnd() end ---@type function (): HWND

function reaper.SplitMediaItem(item, position) end ---@type function (item: MediaItem, position: number): MediaItem

function reaper.stringToGuid(str, gGUID) end ---@type function (str: string, gGUID: string): gGUID: string

function reaper.StuffMIDIMessage(mode, msg1, msg2, msg3) end ---@type function (mode: integer, msg1: integer, msg2: integer, msg3: integer)

function reaper.TakeFX_AddByName(take, fxname, instantiate) end ---@type function (take: MediaItem_Take, fxname: string, instantiate: integer): integer

function reaper.TakeFX_EndParamEdit(take, fx, param) end ---@type function (take: MediaItem_Take, fx: integer, param: integer): boolean

function reaper.TakeFX_FormatParamValue(take, fx, param, val, buf) end ---@type function (take: MediaItem_Take, fx: integer, param: integer, val: number, buf: string): retval: boolean, buf: string

function reaper.TakeFX_FormatParamValueNormalized(take, fx, param, value, buf) end ---@type function (take: MediaItem_Take, fx: integer, param: integer, value: number, buf: string): retval: boolean, buf: string

function reaper.TakeFX_GetChainVisible(take) end ---@type function (take: MediaItem_Take): integer

function reaper.TakeFX_GetCount(take) end ---@type function (take: MediaItem_Take): integer

function reaper.TakeFX_GetEnabled(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): boolean

function reaper.TakeFX_GetEnvelope(take, fxindex, parameterindex, create) end ---@type function (take: MediaItem_Take, fxindex: integer, parameterindex: integer, create: boolean): TrackEnvelope

function reaper.TakeFX_GetFloatingWindow(take, index) end ---@type function (take: MediaItem_Take, index: integer): HWND

function reaper.TakeFX_GetFormattedParamValue(take, fx, param, buf) end ---@type function (take: MediaItem_Take, fx: integer, param: integer, buf: string): retval: boolean, buf: string

function reaper.TakeFX_GetFXGUID(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): GUID: string

function reaper.TakeFX_GetFXName(take, fx, buf) end ---@type function (take: MediaItem_Take, fx: integer, buf: string): retval: boolean, buf: string

function reaper.TakeFX_GetIOSize(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): retval: integer, number: optional, number: optional

function reaper.TakeFX_GetNamedConfigParm(take, fx, parmname) end ---@type function (take: MediaItem_Take, fx: integer, parmname: string): retval: boolean, buf: string

function reaper.TakeFX_GetNumParams(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): integer

function reaper.TakeFX_GetOpen(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): boolean

function reaper.TakeFX_GetParam(take, fx, param) end ---@type function (take: MediaItem_Take, fx: integer, param: integer): retval: number, minval: number, maxval: number

function reaper.TakeFX_GetParameterStepSizes(take, fx, param) end ---@type function (take: MediaItem_Take, fx: integer, param: integer): retval: boolean, step: number, smallstep: number, largestep: number, istoggle: boolean

function reaper.TakeFX_GetParamEx(take, fx, param) end ---@type function (take: MediaItem_Take, fx: integer, param: integer): retval: number, minval: number, maxval: number, midval: number

function reaper.TakeFX_GetParamName(take, fx, param, buf) end ---@type function (take: MediaItem_Take, fx: integer, param: integer, buf: string): retval: boolean, buf: string

function reaper.TakeFX_GetParamNormalized(take, fx, param) end ---@type function (take: MediaItem_Take, fx: integer, param: integer): number

function reaper.TakeFX_GetPinMappings(tr, fx, is, pin) end ---@type function (tr: MediaItem_Take, fx: integer, is: integer, pin: integer): retval: integer, number: optional

function reaper.TakeFX_GetPreset(take, fx, presetname) end ---@type function (take: MediaItem_Take, fx: integer, presetname: string): retval: boolean, presetname: string

function reaper.TakeFX_GetPresetIndex(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): retval: integer, numberOfPresets: number

function reaper.TakeFX_GetUserPresetFilename(take, fx, fn) end ---@type function (take: MediaItem_Take, fx: integer, fn: string): fn: string

function reaper.TakeFX_NavigatePresets(take, fx, presetmove) end ---@type function (take: MediaItem_Take, fx: integer, presetmove: integer): boolean

function reaper.TakeFX_SetEnabled(take, fx, enabled) end ---@type function (take: MediaItem_Take, fx: integer, enabled: boolean)

function reaper.TakeFX_SetNamedConfigParm(take, fx, parmname, value) end ---@type function (take: MediaItem_Take, fx: integer, parmname: string, value: string): boolean

function reaper.TakeFX_SetOpen(take, fx, open) end ---@type function (take: MediaItem_Take, fx: integer, open: boolean)

function reaper.TakeFX_SetParam(take, fx, param, val) end ---@type function (take: MediaItem_Take, fx: integer, param: integer, val: number): boolean

function reaper.TakeFX_SetParamNormalized(take, fx, param, value) end ---@type function (take: MediaItem_Take, fx: integer, param: integer, value: number): boolean

function reaper.TakeFX_SetPinMappings(tr, fx, is, pin, low32bits, hi32bits) end ---@type function (tr: MediaItem_Take, fx: integer, is: integer, pin: integer, low32bits: integer, hi32bits: integer): boolean

function reaper.TakeFX_SetPreset(take, fx, presetname) end ---@type function (take: MediaItem_Take, fx: integer, presetname: string): boolean

function reaper.TakeFX_SetPresetByIndex(take, fx, idx) end ---@type function (take: MediaItem_Take, fx: integer, idx: integer): boolean

function reaper.TakeFX_Show(take, index, showFlag) end ---@type function (take: MediaItem_Take, index: integer, showFlag: integer)

function reaper.TakeIsMIDI(take) end ---@type function (take: MediaItem_Take): boolean

function reaper.ThemeLayout_GetLayout(section, idx) end ---@type function (section: string, idx: integer): retval: boolean, name: string

function reaper.ThemeLayout_GetParameter(wp) end ---@type function (wp: integer): retval: string, string: optional, number: optional, number: optional, number: optional, number: optional

function reaper.ThemeLayout_RefreshAll() end ---@type function ()

function reaper.ThemeLayout_SetLayout(section, layout) end ---@type function (section: string, layout: string): retval: boolean

function reaper.ThemeLayout_SetParameter(wp, value, persist) end ---@type function (wp: integer, value: integer, persist: boolean): retval: boolean

function reaper.time_precise() end ---@type function (): number

function reaper.TimeMap2_beatsToTime(proj, tpos, number) end ---@type function (proj: ReaProject, tpos: number, number: optional): number

function reaper.TimeMap2_GetDividedBpmAtTime(proj, time) end ---@type function (proj: ReaProject, time: number): number

function reaper.TimeMap2_GetNextChangeTime(proj, time) end ---@type function (proj: ReaProject, time: number): number

function reaper.TimeMap2_QNToTime(proj, qn) end ---@type function (proj: ReaProject, qn: number): number

function reaper.TimeMap2_timeToBeats(proj, tpos) end ---@type function (proj: ReaProject, tpos: number): retval: number, number: optional, number: optional, number: optional, number: optional

function reaper.TimeMap2_timeToQN(proj, tpos) end ---@type function (proj: ReaProject, tpos: number): number

function reaper.TimeMap_curFrameRate(proj) end ---@type function (proj: ReaProject): retval: number, boolean: optional

function reaper.TimeMap_GetDividedBpmAtTime(time) end ---@type function (time: number): number

function reaper.TimeMap_GetMeasureInfo(proj, measure) end ---@type function (proj: ReaProject, measure: integer): retval: number, qn_start: number, qn_end: number, timesig_num: number, timesig_denom: number, tempo: number

function reaper.TimeMap_GetMetronomePattern(proj, time, pattern) end ---@type function (proj: ReaProject, time: number, pattern: string): retval: integer, pattern: string

function reaper.TimeMap_GetTimeSigAtTime(proj, time) end ---@type function (proj: ReaProject, time: number): timesig_num: number, timesig_denom: number, tempo: number

function reaper.TimeMap_QNToMeasures(proj, qn) end ---@type function (proj: ReaProject, qn: number): retval: integer, number: optional, number: optional

function reaper.TimeMap_QNToTime(qn) end ---@type function (qn: number): number

function reaper.TimeMap_QNToTime_abs(proj, qn) end ---@type function (proj: ReaProject, qn: number): number

function reaper.TimeMap_timeToQN(tpos) end ---@type function (tpos: number): number

function reaper.TimeMap_timeToQN_abs(proj, tpos) end ---@type function (proj: ReaProject, tpos: number): number

function reaper.ToggleTrackSendUIMute(track, send_idx) end ---@type function (track: MediaTrack, send_idx: integer): boolean

function reaper.Track_GetPeakHoldDB(track, channel, clear) end ---@type function (track: MediaTrack, channel: integer, clear: boolean): number

function reaper.Track_GetPeakInfo(track, channel) end ---@type function (track: MediaTrack, channel: integer): number

function reaper.TrackCtl_SetToolTip(fmt, xpos, ypos, topmost) end ---@type function (fmt: string, xpos: integer, ypos: integer, topmost: boolean)

function reaper.TrackFX_AddByName(track, fxname, recFX, instantiate) end ---@type function (track: MediaTrack, fxname: string, recFX: boolean, instantiate: integer): retval: integer

function reaper.TrackFX_CopyToTrack(src_track, src_fx, dest_track, dest_fx, is_move) end ---@type function (src_track: MediaTrack, src_fx: integer, dest_track: MediaTrack, dest_fx: integer, is_move: boolean)

function reaper.TrackFX_CopyToTake(src_track, src_fx, dest_take, dest_fx, is_move) end ---@type function (src_track: MediaTrack, src_fx: integer, dest_take: MediaItem_Take, dest_fx: integer, is_move: boolean)

function reaper.TrackFX_EndParamEdit(track, fx, param) end ---@type function (track: MediaTrack, fx: integer, param: integer): boolean

function reaper.TrackFX_FormatParamValue(track, fx, param, val, buf) end ---@type function (track: MediaTrack, fx: integer, param: integer, val: number, buf: string): retval: boolean, buf: string

function reaper.TrackFX_FormatParamValueNormalized(track, fx, param, value, buf) end ---@type function (track: MediaTrack, fx: integer, param: integer, value: number, buf: string): retval: boolean, buf: string

function reaper.TrackFX_GetByName(track, fxname, instantiate) end ---@type function (track: MediaTrack, fxname: string, instantiate: boolean): retval: integer

function reaper.TrackFX_GetChainVisible(track) end ---@type function (track: MediaTrack): integer

function reaper.TrackFX_GetCount(track) end ---@type function (track: MediaTrack): integer

function reaper.TrackFX_GetEnabled(track, fx) end ---@type function (track: MediaTrack, fx: integer): boolean

function reaper.TrackFX_GetEQ(track, instantiate) end ---@type function (track: MediaTrack, instantiate: boolean): integer

function reaper.TrackFX_GetEQBandEnabled(track, fxidx, bandtype, bandidx) end ---@type function (track: MediaTrack, fxidx: integer, bandtype: integer, bandidx: integer): boolean

function reaper.TrackFX_GetEQParam(track, fxidx, paramidx) end ---@type function (track: MediaTrack, fxidx: integer, paramidx: integer): retval: boolean, bandtype: number, bandidx: number, paramtype: number, normval: number

function reaper.TrackFX_GetFloatingWindow(track, index) end ---@type function (track: MediaTrack, index: integer): HWND

function reaper.TrackFX_GetFormattedParamValue(track, fx, param, buf) end ---@type function (track: MediaTrack, fx: integer, param: integer, buf: string): retval: boolean, buf: string

function reaper.TrackFX_GetFXGUID(track, fx) end ---@type function (track: MediaTrack, fx: integer): GUID: string

function reaper.TrackFX_GetFXName(track, fx, buf) end ---@type function (track: MediaTrack, fx: integer, buf: string): retval: boolean, buf: string

function reaper.TrackFX_GetInstrument(track) end ---@type function (track: MediaTrack): integer

function reaper.TrackFX_GetIOSize(track, fx) end ---@type function (track: MediaTrack, fx: integer): retval: integer, number: optional, number: optional

function reaper.TrackFX_GetNamedConfigParm(track, fx, parmname) end ---@type function (track: MediaTrack, fx: integer, parmname: string): retval: boolean, buf: string

function reaper.TrackFX_GetNumParams(track, fx) end ---@type function (track: MediaTrack, fx: integer): integer

function reaper.TrackFX_GetOpen(track, fx) end ---@type function (track: MediaTrack, fx: integer): boolean

function reaper.TrackFX_GetParam(track, fx, param) end ---@type function (track: MediaTrack, fx: integer, param: integer): retval: number, minval: number, maxval: number

function reaper.TrackFX_GetParameterStepSizes(track, fx, param) end ---@type function (track: MediaTrack, fx: integer, param: integer): retval: boolean, step: number, smallstep: number, largestep: number, istoggle: boolean

function reaper.TrackFX_GetParamEx(track, fx, param) end ---@type function (track: MediaTrack, fx: integer, param: integer): retval: number, minval: number, maxval: number, midval: number

function reaper.TrackFX_GetParamName(track, fx, param, buf) end ---@type function (track: MediaTrack, fx: integer, param: integer, buf: string): retval: boolean, buf: string

function reaper.TrackFX_GetParamNormalized(track, fx, param) end ---@type function (track: MediaTrack, fx: integer, param: integer): number

function reaper.TrackFX_GetPinMappings(tr, fx, is, pin) end ---@type function (tr: MediaTrack, fx: integer, is: integer, pin: integer): retval: integer, number: optional

function reaper.TrackFX_GetPreset(track, fx, presetname) end ---@type function (track: MediaTrack, fx: integer, presetname: string): retval: boolean, presetname: string

function reaper.TrackFX_GetPresetIndex(track, fx) end ---@type function (track: MediaTrack, fx: integer): retval: integer, numberOfPresets: number

function reaper.TrackFX_GetRecChainVisible(track) end ---@type function (track: MediaTrack): integer

function reaper.TrackFX_GetRecCount(track) end ---@type function (track: MediaTrack): integer

function reaper.TrackFX_GetUserPresetFilename(track, fx, fn) end ---@type function (track: MediaTrack, fx: integer, fn: string): fn: string

function reaper.TrackFX_NavigatePresets(track, fx, presetmove) end ---@type function (track: MediaTrack, fx: integer, presetmove: integer): boolean

function reaper.TrackFX_SetEnabled(track, fx, enabled) end ---@type function (track: MediaTrack, fx: integer, enabled: boolean)

function reaper.TrackFX_SetEQBandEnabled(track, fxidx, bandtype, bandidx, enable) end ---@type function (track: MediaTrack, fxidx: integer, bandtype: integer, bandidx: integer, enable: boolean): boolean

function reaper.TrackFX_SetEQParam(track, fxidx, bandtype, bandidx, paramtype, val, isnorm) end ---@type function (track: MediaTrack, fxidx: integer, bandtype: integer, bandidx: integer, paramtype: integer, val: number, isnorm: boolean): boolean

function reaper.TrackFX_SetNamedConfigParm(track, fx, parmname, value) end ---@type function (track: MediaTrack, fx: integer, parmname: string, value: string): boolean

function reaper.TrackFX_SetOffline(track, fx, offline) end ---@type function (track: MediaTrack, fx: integer, offline: boolean)

function reaper.TakeFX_SetOffline(take, fx, offline) end ---@type function (take: MediaItem_Take, fx: integer, offline: boolean)

function reaper.TakeFX_GetOffline(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): retval: boolean

function reaper.TakeFX_Delete(take, fx) end ---@type function (take: MediaItem_Take, fx: integer): retval: boolean

function reaper.TakeFX_CopyToTake(src_take, src_fx, dest_take, dest_fx, is_move) end ---@type function (src_take: MediaItem_Take, src_fx: integer, dest_take: MediaItem_Take, dest_fx: integer, is_move: boolean)

function reaper.TakeFX_CopyToTrack(src_take, src_fx, dest_track, dest_fx, is_move) end ---@type function (src_take: MediaItem_Take, src_fx: integer, dest_track: MediaTrack, dest_fx: integer, is_move: boolean)

function reaper.TrackFX_GetOffline(track, fx) end ---@type function (track: MediaTrack, fx: integer): retval: boolean

function reaper.TakeFX_CopyToTake(src_take, src_fx, dest_take, dest_fx, is_move) end ---@type function (src_take: MediaItem_Take, src_fx: integer, dest_take: MediaItem_Take, dest_fx: integer, is_move: boolean)

function reaper.TakeFX_CopyToTrack(src_take, src_fx, dest_track, dest_fx, is_move) end ---@type function (src_take: MediaItem_Take, src_fx: integer, dest_track: MediaTrack, dest_fx: integer, is_move: boolean)

function reaper.TrackFX_Delete(track, fx) end ---@type function (track: MediaTrack, fx: integer): retval: boolean

function reaper.TrackFX_SetOpen(track, fx, open) end ---@type function (track: MediaTrack, fx: integer, open: boolean)

function reaper.TrackFX_SetParam(track, fx, param, val) end ---@type function (track: MediaTrack, fx: integer, param: integer, val: number): boolean

function reaper.TrackFX_SetParamNormalized(track, fx, param, value) end ---@type function (track: MediaTrack, fx: integer, param: integer, value: number): boolean

function reaper.TrackFX_SetPinMappings(tr, fx, is, pin, low32bits, hi32bits) end ---@type function (tr: MediaTrack, fx: integer, is: integer, pin: integer, low32bits: integer, hi32bits: integer): boolean

function reaper.TrackFX_SetPreset(track, fx, presetname) end ---@type function (track: MediaTrack, fx: integer, presetname: string): boolean

function reaper.TrackFX_SetPresetByIndex(track, fx, idx) end ---@type function (track: MediaTrack, fx: integer, idx: integer): boolean

function reaper.TrackFX_Show(track, index, showFlag) end ---@type function (track: MediaTrack, index: integer, showFlag: integer)

function reaper.TrackList_AdjustWindows(isMinor) end ---@type function (isMinor: boolean)

function reaper.TrackList_UpdateAllExternalSurfaces() end ---@type function ()

function reaper.Undo_BeginBlock() end ---@type function ()

function reaper.Undo_BeginBlock2(proj) end ---@type function (proj: ReaProject)

function reaper.Undo_CanRedo2(proj) end ---@type function (proj: ReaProject): string

function reaper.Undo_CanUndo2(proj) end ---@type function (proj: ReaProject): string

function reaper.Undo_DoRedo2(proj) end ---@type function (proj: ReaProject): integer

function reaper.Undo_DoUndo2(proj) end ---@type function (proj: ReaProject): integer

function reaper.Undo_EndBlock(descchange, extraflags) end ---@type function (descchange: string, extraflags: integer)

function reaper.Undo_EndBlock2(proj, descchange, extraflags) end ---@type function (proj: ReaProject, descchange: string, extraflags: integer)

function reaper.Undo_OnStateChange(descchange) end ---@type function (descchange: string)

function reaper.Undo_OnStateChange2(proj, descchange) end ---@type function (proj: ReaProject, descchange: string)

function reaper.Undo_OnStateChange_Item(proj, name, item) end ---@type function (proj: ReaProject, name: string, item: MediaItem)

function reaper.Undo_OnStateChangeEx(descchange, whichStates, trackparm) end ---@type function (descchange: string, whichStates: integer, trackparm: integer)

function reaper.Undo_OnStateChangeEx2(proj, descchange, whichStates, trackparm) end ---@type function (proj: ReaProject, descchange: string, whichStates: integer, trackparm: integer)

function reaper.UpdateArrange() end ---@type function ()

function reaper.UpdateItemInProject(item) end ---@type function (item: MediaItem)

function reaper.UpdateTimeline() end ---@type function ()

function reaper.ValidatePtr(pointer, ctypename) end ---@type function (pointer: identifier, ctypename: string): boolean

function reaper.ValidatePtr2(proj, pointer, ctypename) end ---@type function (proj: ReaProject, pointer: identifier, ctypename: string): boolean

function reaper.ViewPrefs(page, pageByName) end ---@type function (page: integer, pageByName: string)

function reaper.GetSetTrackGroupMembershipHigh(tr, groupname, setmask, setvalue) end ---@type function (tr: MediaTrack, groupname: string, setmask: integer, setvalue: integer): groupstate: integer

function reaper.GetSetTrackSendInfo_String(tr, category, sendidx, parmname, stringNeedBig, setNewValue) end ---@type function (tr: MediaTrack, category: integer, sendidx: integer, parmname: string, stringNeedBig: string, setNewValue: boolean): retval: boolean, stringNeedBig: string

function reaper.BR_EnvAlloc(envelope, takeEnvelopesUseProjectTime) end ---@type function (envelope: TrackEnvelope, takeEnvelopesUseProjectTime: boolean): BR_Envelope

function reaper.BR_EnvCountPoints(envelope) end ---@type function (envelope: BR_Envelope): integer

function reaper.BR_EnvDeletePoint(envelope, id) end ---@type function (envelope: BR_Envelope, id: integer): boolean

function reaper.BR_EnvFind(envelope, position, delta) end ---@type function (envelope: BR_Envelope, position: number, delta: number): integer

function reaper.BR_EnvFindNext(envelope, position) end ---@type function (envelope: BR_Envelope, position: number): integer

function reaper.BR_EnvFindPrevious(envelope, position) end ---@type function (envelope: BR_Envelope, position: number): integer

function reaper.BR_EnvFree(envelope, commit) end ---@type function (envelope: BR_Envelope, commit: boolean): boolean

function reaper.BR_EnvGetParentTake(envelope) end ---@type function (envelope: BR_Envelope): MediaItem_Take

function reaper.BR_EnvGetParentTrack(envelope) end ---@type function (envelope: BR_Envelope): MediaItem

function reaper.BR_EnvGetPoint(envelope, id) end ---@type function (envelope: BR_Envelope, id: integer): retval: boolean, position: number, value: number, shape: number, selected: boolean, bezier: number

function reaper.BR_EnvGetProperties(envelope) end ---@type function (envelope: BR_Envelope): active: boolean, visible: boolean, armed: boolean, inLane: boolean, laneHeight: number, defaultShape: number, minValue: number, maxValue: number, centerValue: number, type: number, faderScaling: boolean, number: optional

function reaper.BR_EnvSetPoint(envelope, id, position, value, shape, selected, bezier) end ---@type function (envelope: BR_Envelope, id: integer, position: number, value: number, shape: integer, selected: boolean, bezier: number): boolean

function reaper.BR_EnvSetProperties(envelope, active, visible, armed, inLane, laneHeight, defaultShape, faderScaling, number) end ---@type function (envelope: BR_Envelope, active: boolean, visible: boolean, armed: boolean, inLane: boolean, laneHeight: integer, defaultShape: integer, faderScaling: boolean, number: optional)

function reaper.BR_EnvSortPoints(envelope) end ---@type function (envelope: BR_Envelope)

function reaper.BR_EnvValueAtPos(envelope, position) end ---@type function (envelope: BR_Envelope, position: number): number

function reaper.BR_GetArrangeView(proj) end ---@type function (proj: ReaProject): startTime: number, endTime: number

function reaper.BR_GetClosestGridDivision(position) end ---@type function (position: number): number

function reaper.BR_GetCurrentTheme() end ---@type function (): themePath: string, themeName: string

function reaper.BR_GetMediaItemByGUID(proj, guidStringIn) end ---@type function (proj: ReaProject, guidStringIn: string): MediaItem

function reaper.BR_GetMediaItemGUID(item) end ---@type function (item: MediaItem): guidString: string

function reaper.BR_GetMediaItemImageResource(item) end ---@type function (item: MediaItem): retval: boolean, image: string, imageFlags: number

function reaper.BR_GetMediaItemTakeGUID(take) end ---@type function (take: MediaItem_Take): guidString: string

function reaper.BR_GetMediaSourceProperties(take) end ---@type function (take: MediaItem_Take): retval: boolean, section: boolean, start: number, length: number, fade: number, reverse: boolean

function reaper.BR_GetMediaTrackByGUID(proj, guidStringIn) end ---@type function (proj: ReaProject, guidStringIn: string): MediaTrack

function reaper.BR_GetMediaTrackFreezeCount(track) end ---@type function (track: MediaTrack): integer

function reaper.BR_GetMediaTrackGUID(track) end ---@type function (track: MediaTrack): guidString: string

function reaper.BR_GetMediaTrackLayouts(track) end ---@type function (track: MediaTrack): mcpLayoutName: string, tcpLayoutName: string

function reaper.BR_GetMediaTrackSendInfo_Envelope(track, category, sendidx, envelopeType) end ---@type function (track: MediaTrack, category: integer, sendidx: integer, envelopeType: integer): TrackEnvelope

function reaper.BR_GetMediaTrackSendInfo_Track(track, category, sendidx, trackType) end ---@type function (track: MediaTrack, category: integer, sendidx: integer, trackType: integer): MediaTrack

function reaper.BR_GetMidiSourceLenPPQ(take) end ---@type function (take: MediaItem_Take): number

function reaper.BR_GetMidiTakePoolGUID(take) end ---@type function (take: MediaItem_Take): retval: boolean, guidString: string

function reaper.BR_GetMidiTakeTempoInfo(take) end ---@type function (take: MediaItem_Take): retval: boolean, ignoreProjTempo: boolean, bpm: number, num: number, den: number

function reaper.BR_GetMouseCursorContext() end ---@type function (): window: string, segment: string, details: string

function reaper.BR_GetMouseCursorContext_Envelope() end ---@type function (): retval: TrackEnvelope, takeEnvelope: boolean

function reaper.BR_GetMouseCursorContext_Item() end ---@type function (): MediaItem

function reaper.BR_GetMouseCursorContext_MIDI() end ---@type function (): retval: identifier, inlineEditor: boolean, noteRow: number, ccLane: number, ccLaneVal: number, ccLaneId: number

function reaper.BR_GetMouseCursorContext_Position() end ---@type function (): number

function reaper.BR_GetMouseCursorContext_StretchMarker() end ---@type function (): integer

function reaper.BR_GetMouseCursorContext_Take() end ---@type function (): MediaItem_Take

function reaper.BR_GetMouseCursorContext_Track() end ---@type function (): MediaTrack

function reaper.BR_GetNextGridDivision(position) end ---@type function (position: number): number

function reaper.BR_GetPrevGridDivision(position) end ---@type function (position: number): number

function reaper.BR_GetSetTrackSendInfo(track, category, sendidx, parmname, setNewValue, newValue) end ---@type function (track: MediaTrack, category: integer, sendidx: integer, parmname: string, setNewValue: boolean, newValue: number): number

function reaper.BR_GetTakeFXCount(take) end ---@type function (take: MediaItem_Take): integer

function reaper.BR_IsMidiOpenInInlineEditor(take) end ---@type function (take: MediaItem_Take): boolean

function reaper.BR_IsTakeMidi(take) end ---@type function (take: MediaItem_Take): retval: boolean, inProjectMidi: boolean

function reaper.BR_ItemAtMouseCursor() end ---@type function (): retval: MediaItem, position: number

function reaper.BR_MIDI_CCLaneRemove(midiEditor, laneId) end ---@type function (midiEditor: identifier, laneId: integer): boolean

function reaper.BR_MIDI_CCLaneReplace(midiEditor, laneId, newCC) end ---@type function (midiEditor: identifier, laneId: integer, newCC: integer): boolean

function reaper.BR_PositionAtMouseCursor(checkRuler) end ---@type function (checkRuler: boolean): number

function reaper.BR_SetArrangeView(proj, startTime, endTime) end ---@type function (proj: ReaProject, startTime: number, endTime: number)

function reaper.BR_SetItemEdges(item, startTime, endTime) end ---@type function (item: MediaItem, startTime: number, endTime: number): boolean

function reaper.BR_SetMediaItemImageResource(item, imageIn, imageFlags) end ---@type function (item: MediaItem, imageIn: string, imageFlags: integer)

function reaper.BR_SetMediaSourceProperties(take, section, start, length, fade, reverse) end ---@type function (take: MediaItem_Take, section: boolean, start: number, length: number, fade: number, reverse: boolean): boolean

function reaper.BR_SetMediaTrackLayouts(track, mcpLayoutNameIn, tcpLayoutNameIn) end ---@type function (track: MediaTrack, mcpLayoutNameIn: string, tcpLayoutNameIn: string): boolean

function reaper.BR_SetMidiTakeTempoInfo(take, ignoreProjTempo, bpm, num, den) end ---@type function (take: MediaItem_Take, ignoreProjTempo: boolean, bpm: number, num: integer, den: integer): boolean

function reaper.BR_SetTakeSourceFromFile(take, filenameIn, inProjectData) end ---@type function (take: MediaItem_Take, filenameIn: string, inProjectData: boolean): boolean

function reaper.BR_SetTakeSourceFromFile2(take, filenameIn, inProjectData, keepSourceProperties) end ---@type function (take: MediaItem_Take, filenameIn: string, inProjectData: boolean, keepSourceProperties: boolean): boolean

function reaper.BR_TakeAtMouseCursor() end ---@type function (): retval: MediaItem_Take, position: number

function reaper.BR_TrackAtMouseCursor() end ---@type function (): retval: MediaTrack, context: number, position: number

function reaper.BR_TrackFX_GetFXModuleName(track, fx) end ---@type function (track: MediaTrack, fx: integer): retval: boolean, name: string

function reaper.BR_Win32_GetPrivateProfileString(sectionName, keyName, defaultString, filePath) end ---@type function (sectionName: string, keyName: string, defaultString: string, filePath: string): retval: integer, string: string

function reaper.BR_Win32_ShellExecute(operation, file, parameters, directory, showFlags) end ---@type function (operation: string, file: string, parameters: string, directory: string, showFlags: integer): integer

function reaper.BR_Win32_WritePrivateProfileString(sectionName, keyName, value, filePath) end ---@type function (sectionName: string, keyName: string, value: string, filePath: string): boolean

function reaper.CF_GetClipboard() end ---@type function (): text: string

function reaper.CF_GetClipboardBig(output) end ---@type function (output: WDL_FastString): string

function reaper.CF_SetClipboard(str) end ---@type function (str: string)

function reaper.FNG_AddMidiNote(midiTake) end ---@type function (midiTake: RprMidiTake): RprMidiNote

function reaper.FNG_AllocMidiTake(take) end ---@type function (take: MediaItem_Take): RprMidiTake

function reaper.FNG_CountMidiNotes(midiTake) end ---@type function (midiTake: RprMidiTake): integer

function reaper.FNG_FreeMidiTake(midiTake) end ---@type function (midiTake: RprMidiTake)

function reaper.FNG_GetMidiNote(midiTake, index) end ---@type function (midiTake: RprMidiTake, index: integer): RprMidiNote

function reaper.FNG_GetMidiNoteIntProperty(midiNote, property) end ---@type function (midiNote: RprMidiNote, property: string): integer

function reaper.FNG_SetMidiNoteIntProperty(midiNote, property, value) end ---@type function (midiNote: RprMidiNote, property: string, value: integer)

function reaper.NF_AnalyzeTakeLoudness(take, analyzeTruePeak) end ---@type function (take: MediaItem_Take, analyzeTruePeak: boolean): retval: boolean, lufsIntegrated: number, range: number, truePeak: number, truePeakPos: number, shortTermMax: number, momentaryMax: number

function reaper.NF_AnalyzeTakeLoudness2(take, analyzeTruePeak) end ---@type function (take: MediaItem_Take, analyzeTruePeak: boolean): retval: boolean, lufsIntegrated: number, range: number, truePeak: number, truePeakPos: number, shortTermMax: number, momentaryMax: number, shortTermMaxPos: number, momentaryMaxPos: number

function reaper.NF_AnalyzeTakeLoudness_IntegratedOnly(take) end ---@type function (take: MediaItem_Take): retval: boolean, lufsIntegrated: number

function reaper.NF_GetMediaItemAverageRMS(item) end ---@type function (item: MediaItem): number

function reaper.NF_GetMediaItemMaxPeak(item) end ---@type function (item: MediaItem): number

function reaper.NF_GetMediaItemPeakRMS_NonWindowed(item) end ---@type function (item: MediaItem): number

function reaper.NF_GetMediaItemPeakRMS_Windowed(item) end ---@type function (item: MediaItem): number

function reaper.SNM_AddReceive(src, dest, type) end ---@type function (src: MediaTrack, dest: MediaTrack, type: integer): boolean

function reaper.SNM_AddTCPFXParm(tr, fxId, prmId) end ---@type function (tr: MediaTrack, fxId: integer, prmId: integer): boolean

function reaper.SNM_CreateFastString(str) end ---@type function (str: string): WDL_FastString

function reaper.SNM_DeleteFastString(str) end ---@type function (str: WDL_FastString)

function reaper.SNM_GetDoubleConfigVar(varname, errvalue) end ---@type function (varname: string, errvalue: number): number

function reaper.SNM_GetFastString(str) end ---@type function (str: WDL_FastString): string

function reaper.SNM_GetFastStringLength(str) end ---@type function (str: WDL_FastString): integer

function reaper.SNM_GetIntConfigVar(varname, errvalue) end ---@type function (varname: string, errvalue: integer): retval: integer

function reaper.SNM_GetLongConfigVar(varname) end ---@type function (varname: string): retval: boolean, high: number, low: number

function reaper.SNM_GetMediaItemTakeByGUID(project, guid) end ---@type function (project: ReaProject, guid: string): MediaItem_Take

function reaper.SNM_GetProjectMarkerName(proj, num, isrgn, name) end ---@type function (proj: ReaProject, num: integer, isrgn: boolean, name: WDL_FastString): boolean

function reaper.SNM_GetSetObjectState(obj, state, setnewvalue, wantminimalstate) end ---@type function (obj: identifier, state: WDL_FastString, setnewvalue: boolean, wantminimalstate: boolean): boolean

function reaper.SNM_GetSetSourceState(item, takeidxWDL_FastString, setnewvalue) end ---@type function (item: MediaItem, takeidxWDL_FastString: integer, setnewvalue: boolean): boolean

function reaper.SNM_GetSetSourceState2(takeWDL_FastString, setnewvalue) end ---@type function (takeWDL_FastString: MediaItem_Take, setnewvalue: boolean): boolean

function reaper.SNM_GetSourceType(takeWDL_FastString) end ---@type function (takeWDL_FastString: MediaItem_Take): boolean

function reaper.SNM_MoveOrRemoveTrackFX(tr, fxId, what) end ---@type function (tr: MediaTrack, fxId: integer, what: integer): boolean

function reaper.SNM_ReadMediaFileTag(fn, tag) end ---@type function (fn: string, tag: string): retval: boolean, tagval: string

function reaper.SNM_RemoveReceive(tr, rcvidx) end ---@type function (tr: MediaTrack, rcvidx: integer): boolean

function reaper.SNM_RemoveReceivesFrom(tr, srctr) end ---@type function (tr: MediaTrack, srctr: MediaTrack): boolean

function reaper.SNM_SelectResourceBookmark(name) end ---@type function (name: string): integer

function reaper.SNM_SetDoubleConfigVar(varname, newvalue) end ---@type function (varname: string, newvalue: number): retval: boolean

function reaper.SNM_SetFastString(str, newstr) end ---@type function (str: WDL_FastString, newstr: string): WDL_FastString

function reaper.SNM_SetIntConfigVar(varname, newvalue) end ---@type function (varname: string, newvalue: integer): retval: boolean

function reaper.SNM_SetLongConfigVar(reaper, varname, newHighValue, newLowValue) end ---@type function (reaper: boolean, varname: string, newHighValue: integer, newLowValue: integer)

function reaper.SNM_SetProjectMarker(proj, num, isrgn, pos, rgnend, name, color) end ---@type function (proj: ReaProject, num: integer, isrgn: boolean, pos: number, rgnend: number, name: string, color: integer): boolean

function reaper.SNM_TagMediaFile(fn, tag, tagval) end ---@type function (fn: string, tag: string, tagval: string): boolean

function reaper.SNM_TieResourceSlotActions(bookmarkId) end ---@type function (bookmarkId: integer)

function reaper.SN_FocusMIDIEditor() end ---@type function ()

function reaper.ULT_GetMediaItemNote(item) end ---@type function (item: MediaItem): string

function reaper.ULT_SetMediaItemNote(item, note) end ---@type function (item: MediaItem, note: string)

function reaper.JS_Byte(pointer, offset) end ---@type function (pointer: identifier, offset: integer): byte: number

function reaper.JS_Composite(reaper, windowHWND, dstx, dsty, dstw, dsth, sysBitmap, srcx, srcy, srcw, srch, boolean) end ---@type function (reaper: integer, windowHWND: identifier, dstx: integer, dsty: integer, dstw: integer, dsth: integer, sysBitmap: identifier, srcx: integer, srcy: integer, srcw: integer, srch: integer, boolean: optional)

function reaper.JS_Composite_Delay(windowHWND, minTime, maxTime, numBitmapsWhenMax) end ---@type function (windowHWND: identifier, minTime: number, maxTime: number, numBitmapsWhenMax: integer): retval: integer, prevMinTime: number, prevMaxTime: number, prevBitmaps: number

function reaper.JS_Composite_ListBitmaps(windowHWND) end ---@type function (windowHWND: identifier): retval: integer, list: string

function reaper.JS_Composite_Unlink(windowHWND, bitmap, autoUpdate) end ---@type function (windowHWND: identifier, bitmap: identifier, autoUpdate: unsupported)

function reaper.JS_Double(address, pointer) end ---@type function (address: identifier, pointer: integer): double: number

function reaper.JS_File_Stat(filePath) end ---@type function (filePath: string): retval: integer, size: number, accessedTime: string, modifiedTime: string, cTime: string, deviceID: number, deviceSpecialID: number, inode: number, mode: number, numLinks: number, ownerUserID: number, ownerGroupID: number

function reaper.JS_GDI_Blit(destHDC, dstx, dsty, sourceHDC, srcx, srxy, width, height, string) end ---@type function (destHDC: identifier, dstx: integer, dsty: integer, sourceHDC: identifier, srcx: integer, srxy: integer, width: integer, height: integer, string: optional)

function reaper.JS_GDI_CreateFillBrush(reaper, color) end ---@type function (reaper: identifier, color: integer)

function reaper.JS_GDI_CreateFont(reaper, height, weight, angle, italic, underline, strike, fontName) end ---@type function (reaper: identifier, height: integer, weight: integer, angle: integer, italic: boolean, underline: boolean, strike: boolean, fontName: string)

function reaper.JS_GDI_CreatePen(reaper, width, color) end ---@type function (reaper: identifier, width: integer, color: integer)

function reaper.JS_GDI_DeleteObject(GDIObject) end ---@type function (GDIObject: identifier)

function reaper.JS_GDI_DrawText(reaper, deviceHDC, text, len, left, top, right, bottom, align) end ---@type function (reaper: integer, deviceHDC: identifier, text: string, len: integer, left: integer, top: integer, right: integer, bottom: integer, align: string)

function reaper.JS_GDI_FillEllipse(deviceHDC, left, top, right, bottom) end ---@type function (deviceHDC: identifier, left: integer, top: integer, right: integer, bottom: integer)

function reaper.JS_GDI_FillPolygon(deviceHDC, packedX, packedY, numPoints) end ---@type function (deviceHDC: identifier, packedX: string, packedY: string, numPoints: integer)

function reaper.JS_GDI_FillRect(deviceHDC, left, top, right, bottom) end ---@type function (deviceHDC: identifier, left: integer, top: integer, right: integer, bottom: integer)

function reaper.JS_GDI_FillRoundRect(deviceHDC, left, top, right, bottom, xrnd, yrnd) end ---@type function (deviceHDC: identifier, left: integer, top: integer, right: integer, bottom: integer, xrnd: integer, yrnd: integer)

function reaper.JS_GDI_GetClientDC(reaper, windowHWND) end ---@type function (reaper: identifier, windowHWND: identifier)

function reaper.JS_GDI_GetScreenDC(reaper) end ---@type function (reaper: identifier)

function reaper.JS_GDI_GetSysColor(reaper, GUIElement) end ---@type function (reaper: integer, GUIElement: string)

function reaper.JS_GDI_GetTextColor(reaper, deviceHDC) end ---@type function (reaper: integer, deviceHDC: identifier)

function reaper.JS_GDI_GetWindowDC(reaper, windowHWND) end ---@type function (reaper: identifier, windowHWND: identifier)

function reaper.JS_GDI_Line(deviceHDC, x1, y1, x2, y2) end ---@type function (deviceHDC: identifier, x1: integer, y1: integer, x2: integer, y2: integer)

function reaper.JS_GDI_Polyline(deviceHDC, packedX, packedY, numPoints) end ---@type function (deviceHDC: identifier, packedX: string, packedY: string, numPoints: integer)

function reaper.JS_GDI_ReleaseDC(windowHWND, deviceHDC) end ---@type function (windowHWND: identifier, deviceHDC: identifier)

function reaper.JS_GDI_SelectObject(reaper, deviceHDC, GDIObject) end ---@type function (reaper: identifier, deviceHDC: identifier, GDIObject: identifier)

function reaper.JS_GDI_SetPixel(deviceHDC, x, y, color) end ---@type function (deviceHDC: identifier, x: integer, y: integer, color: integer)

function reaper.JS_GDI_SetTextBkColor(deviceHDC, color) end ---@type function (deviceHDC: identifier, color: integer)

function reaper.JS_GDI_SetTextBkMode(deviceHDC, mode) end ---@type function (deviceHDC: identifier, mode: integer)

function reaper.JS_GDI_SetTextColor(deviceHDC, color) end ---@type function (deviceHDC: identifier, color: integer)

function reaper.JS_GDI_StretchBlit(destHDC, dstx, dsty, dstw, dsth, sourceHDC, srcx, srxy, srcw, srch, string) end ---@type function (destHDC: identifier, dstx: integer, dsty: integer, dstw: integer, dsth: integer, sourceHDC: identifier, srcx: integer, srxy: integer, srcw: integer, srch: integer, string: optional)

function reaper.JS_Int(pointer, offset) end ---@type function (pointer: identifier, offset: integer): int: number

function reaper.JS_LICE_AlterBitmapHSV(bitmap, hue, saturation, value) end ---@type function (bitmap: identifier, hue: number, saturation: number, value: number)

function reaper.JS_LICE_AlterRectHSV(bitmap, x, y, w, h, hue, saturation, value) end ---@type function (bitmap: identifier, x: integer, y: integer, w: integer, h: integer, hue: number, saturation: number, value: number)

function reaper.JS_LICE_Arc(bitmap, cx, cy, r, minAngle, maxAngle, color, alpha, mode, antialias) end ---@type function (bitmap: identifier, cx: number, cy: number, r: number, minAngle: number, maxAngle: number, color: integer, alpha: number, mode: string, antialias: boolean)

function reaper.JS_LICE_ArrayAllBitmaps(reaperarray) end ---@type function (reaperarray: identifier): retval: integer

function reaper.JS_LICE_Bezier(bitmap, xstart, ystart, xctl1, yctl1, xctl2, yctl2, xend, yend, tol, color, alpha, mode, antialias) end ---@type function (bitmap: identifier, xstart: number, ystart: number, xctl1: number, yctl1: number, xctl2: number, yctl2: number, xend: number, yend: number, tol: number, color: integer, alpha: number, mode: string, antialias: boolean)

function reaper.JS_LICE_Blit(destBitmap, dstx, dsty, sourceBitmap, srcx, srcy, width, height, alpha, mode) end ---@type function (destBitmap: identifier, dstx: integer, dsty: integer, sourceBitmap: identifier, srcx: integer, srcy: integer, width: integer, height: integer, alpha: number, mode: string)

function reaper.JS_LICE_Circle(bitmap, cx, cy, r, color, alpha, mode, antialias) end ---@type function (bitmap: identifier, cx: number, cy: number, r: number, color: integer, alpha: number, mode: string, antialias: boolean)

function reaper.JS_LICE_Clear(bitmap, color) end ---@type function (bitmap: identifier, color: integer)

function reaper.JS_LICE_CreateBitmap(reaper, isSysBitmap, width, height) end ---@type function (reaper: identifier, isSysBitmap: boolean, width: integer, height: integer)

function reaper.JS_LICE_CreateFont(reaper) end ---@type function (reaper: identifier)

function reaper.JS_LICE_DestroyBitmap(bitmap) end ---@type function (bitmap: identifier)

function reaper.JS_LICE_DestroyFont(LICEFont) end ---@type function (LICEFont: identifier)

function reaper.JS_LICE_DrawChar(bitmap, x, y, c, color, alpha, mode) end ---@type function (bitmap: identifier, x: integer, y: integer, c: integer, color: integer, alpha: number, mode: integer)

function reaper.JS_LICE_DrawText(reaper, bitmap, LICEFont, text, textLen, x1, y1, x2, y2) end ---@type function (reaper: integer, bitmap: identifier, LICEFont: identifier, text: string, textLen: integer, x1: integer, y1: integer, x2: integer, y2: integer)

function reaper.JS_LICE_FillCircle(bitmap, cx, cy, r, color, alpha, mode, antialias) end ---@type function (bitmap: identifier, cx: number, cy: number, r: number, color: integer, alpha: number, mode: string, antialias: boolean)

function reaper.JS_LICE_FillPolygon(bitmap, packedX, packedY, numPoints, color, alpha, mode) end ---@type function (bitmap: identifier, packedX: string, packedY: string, numPoints: integer, color: integer, alpha: number, mode: string)

function reaper.JS_LICE_FillRect(bitmap, x, y, w, h, color, alpha, mode) end ---@type function (bitmap: identifier, x: integer, y: integer, w: integer, h: integer, color: integer, alpha: number, mode: string)

function reaper.JS_LICE_FillTriangle(bitmap, x1, y1, x2, y2, x3, y3, color, alpha, mode) end ---@type function (bitmap: identifier, x1: integer, y1: integer, x2: integer, y2: integer, x3: integer, y3: integer, color: integer, alpha: number, mode: string)

function reaper.JS_LICE_GetDC(reaper, bitmap) end ---@type function (reaper: identifier, bitmap: identifier)

function reaper.JS_LICE_GetHeight(reaper, bitmap) end ---@type function (reaper: integer, bitmap: identifier)

function reaper.JS_LICE_GetPixel(reaper, bitmap, x, y) end ---@type function (reaper: integer, bitmap: identifier, x: integer, y: integer)

function reaper.JS_LICE_GetWidth(reaper, bitmap) end ---@type function (reaper: integer, bitmap: identifier)

function reaper.JS_LICE_GradRect(bitmap, dstx, dsty, dstw, dsth, ir, ig, ib, ia, drdx, dgdx, dbdx, dadx, drdy, dgdy, dbdy, dady, mode) end ---@type function (bitmap: identifier, dstx: integer, dsty: integer, dstw: integer, dsth: integer, ir: number, ig: number, ib: number, ia: number, drdx: number, dgdx: number, dbdx: number, dadx: number, drdy: number, dgdy: number, dbdy: number, dady: number, mode: string)

function reaper.JS_LICE_IsFlipped(reaper, bitmap) end ---@type function (reaper: boolean, bitmap: identifier)

function reaper.JS_LICE_Line(bitmap, x1, y1, x2, y2, color, alpha, mode, antialias) end ---@type function (bitmap: identifier, x1: number, y1: number, x2: number, y2: number, color: integer, alpha: number, mode: string, antialias: boolean)

function reaper.JS_LICE_ListAllBitmaps() end ---@type function (): retval: integer, list: string

function reaper.JS_LICE_LoadJPG(reaper, filename) end ---@type function (reaper: identifier, filename: string)

function reaper.JS_LICE_LoadPNG(reaper, filename) end ---@type function (reaper: identifier, filename: string)

function reaper.JS_LICE_MeasureText(text) end ---@type function (text: string): width: number, Height: number

function reaper.JS_LICE_ProcessRect(reaper, bitmap, x, y, w, h, mode, operand) end ---@type function (reaper: boolean, bitmap: identifier, x: integer, y: integer, w: integer, h: integer, mode: string, operand: number)

function reaper.JS_LICE_PutPixel(bitmap, x, y, color, alpha, mode) end ---@type function (bitmap: identifier, x: integer, y: integer, color: integer, alpha: number, mode: string)

function reaper.JS_LICE_Resize(bitmap, width, height) end ---@type function (bitmap: identifier, width: integer, height: integer)

function reaper.JS_LICE_RotatedBlit(destBitmap, dstx, dsty, dstw, dsth, sourceBitmap, srcx, srcy, srcw, srch, angle, rotxcent, rotycent, cliptosourcerect, alpha, mode) end ---@type function (destBitmap: identifier, dstx: integer, dsty: integer, dstw: integer, dsth: integer, sourceBitmap: identifier, srcx: number, srcy: number, srcw: number, srch: number, angle: number, rotxcent: number, rotycent: number, cliptosourcerect: boolean, alpha: number, mode: string)

function reaper.JS_LICE_RoundRect(bitmap, x, y, w, h, cornerradius, color, alpha, mode, antialias) end ---@type function (bitmap: identifier, x: number, y: number, w: number, h: number, cornerradius: integer, color: integer, alpha: number, mode: string, antialias: boolean)

function reaper.JS_LICE_ScaledBlit(destBitmap, dstx, dsty, dstw, dsth, srcBitmap, srcx, srcy, srcw, srch, alpha, mode) end ---@type function (destBitmap: identifier, dstx: integer, dsty: integer, dstw: integer, dsth: integer, srcBitmap: identifier, srcx: number, srcy: number, srcw: number, srch: number, alpha: number, mode: string)

function reaper.JS_LICE_SetAlphaFromColorMask(bitmap, colorRGB) end ---@type function (bitmap: identifier, colorRGB: integer)

function reaper.JS_LICE_SetFontBkColor(LICEFont, color) end ---@type function (LICEFont: identifier, color: integer)

function reaper.JS_LICE_SetFontColor(LICEFont, color) end ---@type function (LICEFont: identifier, color: integer)

function reaper.JS_LICE_SetFontFromGDI(LICEFont, GDIFont, moreFormats) end ---@type function (LICEFont: identifier, GDIFont: identifier, moreFormats: string)

function reaper.JS_LICE_WriteJPG(reaper, filenameLICE_IBitmap, quality, boolean) end ---@type function (reaper: boolean, filenameLICE_IBitmap: string, quality: integer, boolean: optional)

function reaper.JS_LICE_WritePNG(reaper, filenameLICE_IBitmap, wantAlpha) end ---@type function (reaper: boolean, filenameLICE_IBitmap: string, wantAlpha: boolean)

function reaper.JS_ListView_EnsureVisible(listviewHWND, index, partialOK) end ---@type function (listviewHWND: identifier, index: integer, partialOK: boolean)

function reaper.JS_Localize(USEnglish, LangPackSection) end ---@type function (USEnglish: string, LangPackSection: string): translation: string

function reaper.JS_MIDIEditor_ArrayAll(reaperarray) end ---@type function (reaperarray: identifier)

function reaper.JS_MIDIEditor_ListAll(buf) end ---@type function (buf: string): buf: string

function reaper.JS_Mem_Alloc(reaper, sizeBytes) end ---@type function (reaper: identifier, sizeBytes: integer)

function reaper.JS_Mem_Alloc(reaper, sizeBytes) end ---@type function (reaper: identifier, sizeBytes: integer)

function reaper.JS_Mem_FromString(reaper, mallocPointer, offset, packedString, stringLength) end ---@type function (reaper: boolean, mallocPointer: identifier, offset: integer, packedString: string, stringLength: integer)

function reaper.JS_Mouse_GetCursor() end ---@type function (): identifier

function reaper.JS_Mouse_GetState(reaper, flags) end ---@type function (reaper: integer, flags: integer)

function reaper.JS_Mouse_LoadCursor(reaper, cursorNumber) end ---@type function (reaper: identifier, cursorNumber: integer)

function reaper.JS_Mouse_LoadCursorFromFile(reaper, pathAndFileName, boolean) end ---@type function (reaper: identifier, pathAndFileName: string, boolean: optional)

function reaper.JS_Mouse_SetCursor(cursorHandle) end ---@type function (cursorHandle: identifier)

function reaper.JS_Mouse_SetPosition(reaper, x, y) end ---@type function (reaper: boolean, x: integer, y: integer)

function reaper.JS_PtrFromStr(reaper, s) end ---@type function (reaper: identifier, s: string)

function reaper.JS_ReaScriptAPI_Version() end ---@type function (): version: number

function reaper.JS_String(pointer, offset, lengthChars) end ---@type function (pointer: identifier, offset: integer, lengthChars: integer): retval: boolean, buf: string

function reaper.JS_VKeys_GetDown(cutoffTime) end ---@type function (cutoffTime: number): state: string

function reaper.JS_VKeys_ClearHistory() end ---@type function ()

function reaper.JS_VKeys_GetHistory() end ---@type function (): retval: boolean, state: string

function reaper.JS_VKeys_GetState() end ---@type function (): retval: boolean, state: string

function reaper.JS_VKeys_GetUp(cutoffTime) end ---@type function (cutoffTime: number): state: string

function reaper.JS_VKeys_Intercept(keyCode, intercept) end ---@type function (keyCode: integer, intercept: integer): retval: integer

function reaper.JS_WindowMessage_Intercept(reaper, windowHWND, messages, passThrough) end ---@type function (reaper: integer, windowHWND: identifier, messages: string, passThrough: boolean)

function reaper.JS_WindowMessage_InterceptList(reaper, windowHWND, messages) end ---@type function (reaper: integer, windowHWND: identifier, messages: string)

function reaper.JS_WindowMessage_ListIntercepts(windowHWND, buf) end ---@type function (windowHWND: identifier, buf: string): retval: boolean, buf: string

function reaper.JS_WindowMessage_PassThrough(reaper, windowHWND, message, passThrough) end ---@type function (reaper: integer, windowHWND: identifier, message: string, passThrough: boolean)

function reaper.JS_WindowMessage_Peek(windowHWND, message) end ---@type function (windowHWND: identifier, message: string): retval: boolean, passedThrough: boolean, time: number, wParamLow: number, wParamHigh: number, lParamLow: number, lParamHigh: number

function reaper.JS_WindowMessage_Post(windowHWND, message, wParam, wParamHighWord, lParam, lParamHighWord) end ---@type function (windowHWND: identifier, message: string, wParam: number, wParamHighWord: integer, lParam: number, lParamHighWord: integer): retval: boolean

function reaper.JS_WindowMessage_Release(reaper, windowHWND, messages) end ---@type function (reaper: integer, windowHWND: identifier, messages: string)

function reaper.JS_WindowMessage_ReleaseAll() end ---@type function ()

function reaper.JS_WindowMessage_ReleaseWindow(windowHWND) end ---@type function (windowHWND: identifier)

function reaper.JS_WindowMessage_Send(reaper, windowHWND, message, wParam, wParamHighWord, lParam, lParamHighWord) end ---@type function (reaper: integer, windowHWND: identifier, message: string, wParam: number, wParamHighWord: integer, lParam: number, lParamHighWord: integer)

function reaper.JS_Window_AddressFromHandle(handle) end ---@type function (handle: identifier): address: number

function reaper.JS_Window_ArrayAllChild(parentHWND, reaperarray) end ---@type function (parentHWND: identifier, reaperarray: identifier)

function reaper.JS_Window_ArrayAllTop(reaperarray) end ---@type function (reaperarray: identifier)

function reaper.JS_Window_ArrayFind(title, exact, reaperarray) end ---@type function (title: string, exact: boolean, reaperarray: identifier)

function reaper.JS_Window_AttachResizeGrip(windowHWND) end ---@type function (windowHWND: identifier)

function reaper.JS_Window_AttachTopmostPin(windowHWND) end ---@type function (windowHWND: identifier): HWND: identifier

function reaper.JS_Window_ClientToScreen(windowHWND, x, y) end ---@type function (windowHWND: identifier, x: integer, y: integer): x: number, y: number

function reaper.JS_Window_Create(title, className, x, y, w, h, string, ownerHWND) end ---@type function (title: string, className: string, x: integer, y: integer, w: integer, h: integer, string: optional, ownerHWND: identifier): retval: identifier, string: optional

function reaper.JS_Window_Destroy(windowHWND) end ---@type function (windowHWND: identifier)

function reaper.JS_Window_Enable(windowHWND, enable) end ---@type function (windowHWND: identifier, enable: boolean)

function reaper.JS_Window_EnableMetal(windowHWND) end ---@type function (windowHWND: identifier): retval: integer

function reaper.JS_Window_Find(reaper, title, exact) end ---@type function (reaper: identifier, title: string, exact: boolean)

function reaper.JS_Window_FindChild(reaper, parentHWND, title, exact) end ---@type function (reaper: identifier, parentHWND: identifier, title: string, exact: boolean)

function reaper.JS_Window_FindChildByID(parentHWND, ID) end ---@type function (parentHWND: identifier, ID: integer): HWND: identifier

function reaper.JS_Window_FindEx(HWND, parentHWND, childHWND, className, title) end ---@type function (HWND: identifier, parentHWND: identifier, childHWND: identifier, className: string, title: string)

function reaper.JS_Window_FindTop(reaper, title, exact) end ---@type function (reaper: identifier, title: string, exact: boolean)

function reaper.JS_Window_FromPoint(reaper, x, y) end ---@type function (reaper: identifier, x: integer, y: integer)

function reaper.JS_Window_GetClassName(windowHWND, buf) end ---@type function (windowHWND: identifier, buf: string): buf: string

function reaper.JS_Window_GetClientRect(windowHWND) end ---@type function (windowHWND: identifier): retval: boolean, left: number, top: number, right: number, bottom: number

function reaper.JS_Window_GetClientSize(windowHWND) end ---@type function (windowHWND: identifier): retval: boolean, width: number, height: number

function reaper.JS_Window_GetFocus(reaper) end ---@type function (reaper: identifier)

function reaper.JS_Window_GetForeground(reaper) end ---@type function (reaper: identifier)

function reaper.JS_Window_GetLong(windowHWND, info) end ---@type function (windowHWND: identifier, info: string): retval: number

function reaper.JS_Window_GetLongPtr(reaper, windowHWND, info) end ---@type function (reaper: identifier, windowHWND: identifier, info: string)

function reaper.JS_Window_GetParent(reaper, windowHWND) end ---@type function (reaper: identifier, windowHWND: identifier)

function reaper.JS_Window_GetRect(windowHWND) end ---@type function (windowHWND: identifier): retval: boolean, left: number, top: number, right: number, bottom: number

function reaper.JS_Window_GetRelated(reaper, windowHWND, relation) end ---@type function (reaper: identifier, windowHWND: identifier, relation: string)

function reaper.JS_Window_GetScrollInfo(windowHWND, scrollbar) end ---@type function (windowHWND: identifier, scrollbar: string): retval: boolean, position: number, pageSize: number, min: number, max: number, trackPos: number

function reaper.JS_Window_GetTitle(windowHWND) end ---@type function (windowHWND: identifier): title: string

function reaper.JS_Window_GetViewportFromRect(x1, y1, x2, y2, wantWork) end ---@type function (x1: integer, y1: integer, x2: integer, y2: integer, wantWork: boolean): left: number, top: number, right: number, bottom: number

function reaper.JS_Window_HandleFromAddress(reaper, address) end ---@type function (reaper: identifier, address: number)

function reaper.JS_Window_InvalidateRect(windowHWND, left, top, right, bottom, eraseBackground) end ---@type function (windowHWND: identifier, left: integer, top: integer, right: integer, bottom: integer, eraseBackground: boolean): retval: boolean

function reaper.JS_Window_IsChild(reaper, parentHWND, childHWND) end ---@type function (reaper: boolean, parentHWND: identifier, childHWND: identifier)

function reaper.JS_Window_IsVisible(reaper, windowHWND) end ---@type function (reaper: boolean, windowHWND: identifier)

function reaper.JS_Window_IsWindow(reaper, windowHWND) end ---@type function (reaper: boolean, windowHWND: identifier)

function reaper.JS_Window_ListAllChild(parentHWND) end ---@type function (parentHWND: identifier): retval: integer, list: string

function reaper.JS_Window_ListAllTop() end ---@type function (): retval: integer, list: string

function reaper.JS_Window_ListFind(title, exact) end ---@type function (title: string, exact: boolean): retval: integer, list: string

function reaper.JS_Window_MonitorFromRect(x1, y1, x2, y2, wantWork) end ---@type function (x1: integer, y1: integer, x2: integer, y2: integer, wantWork: boolean): left: number, top: number, right: number, bottom: number

function reaper.JS_Window_Move(windowHWND, left, top) end ---@type function (windowHWND: identifier, left: integer, top: integer)

function reaper.JS_Window_OnCommand(windowHWND, commandID) end ---@type function (windowHWND: identifier, commandID: integer): retval: boolean

function reaper.JS_Window_RemoveXPStyle(reaper, windowHWND, remove) end ---@type function (reaper: boolean, windowHWND: identifier, remove: boolean)

function reaper.JS_Window_Resize(windowHWND, width, height) end ---@type function (windowHWND: identifier, width: integer, height: integer)

function reaper.JS_Window_ScreenToClient(windowHWND, x, y) end ---@type function (windowHWND: identifier, x: integer, y: integer): x: number, y: number

function reaper.JS_Window_SetFocus(windowHWND) end ---@type function (windowHWND: identifier)

function reaper.JS_Window_SetForeground(windowHWND) end ---@type function (windowHWND: identifier)

function reaper.JS_Window_SetLong(windowHWND, info, value) end ---@type function (windowHWND: identifier, info: string, value: number): retval: number

function reaper.JS_Window_SetOpacity(reaper, windowHWND, mode, value) end ---@type function (reaper: boolean, windowHWND: identifier, mode: string, value: number)

function reaper.JS_Window_SetParent(reaper, childHWND, parentHWND) end ---@type function (reaper: identifier, childHWND: identifier, parentHWND: identifier)

function reaper.JS_Window_SetPosition(windowHWND, left, top, width, height, string, string) end ---@type function (windowHWND: identifier, left: integer, top: integer, width: integer, height: integer, string: optional, string: optional): retval: boolean, string: optional, string: optional

function reaper.JS_Window_SetScrollPos(reaper, windowHWND, scrollbar, position) end ---@type function (reaper: boolean, windowHWND: identifier, scrollbar: string, position: integer)

function reaper.JS_Window_SetStyle(windowHWND, style) end ---@type function (windowHWND: identifier, style: string): retval: boolean, style: string

function reaper.JS_Window_SetTitle(reaper, windowHWND, title) end ---@type function (reaper: boolean, windowHWND: identifier, title: string)

function reaper.JS_Window_SetZOrder(reaper, windowHWND, ZOrder, insertAfterHWND) end ---@type function (reaper: boolean, windowHWND: identifier, ZOrder: string, insertAfterHWND: identifier)

function reaper.JS_Window_Show(windowHWND, state) end ---@type function (windowHWND: identifier, state: string)

function reaper.JS_Window_Update(windowHWND) end ---@type function (windowHWND: identifier)

function reaper.JS_Dialog_BrowseForFolder(caption, initialFolder) end ---@type function (caption: string, initialFolder: string): retval: integer, folder: string

function reaper.JS_Dialog_BrowseForOpenFiles(windowTitle, initialFolder, initialFile, extensionList, allowMultiple) end ---@type function (windowTitle: string, initialFolder: string, initialFile: string, extensionList: string, allowMultiple: boolean): retval: integer, fileNames: string

function reaper.JS_Dialog_BrowseForSaveFile(windowTitle, initialFolder, initialFile, extensionList) end ---@type function (windowTitle: string, initialFolder: string, initialFile: string, extensionList: string): retval: integer, fileName: string

function reaper.JS_ListView_EnumSelItems(reaper, listviewHWND, index) end ---@type function (reaper: integer, listviewHWND: identifier, index: integer)

function reaper.JS_ListView_GetFocusedItem(listviewHWND) end ---@type function (listviewHWND: identifier): retval: integer, text: string

function reaper.JS_ListView_GetItem(listviewHWND, index, subItem) end ---@type function (listviewHWND: identifier, index: integer, subItem: integer): text: string, state: number

function reaper.JS_ListView_GetItemCount(listviewHWND) end ---@type function (listviewHWND: identifier): retval: integer

function reaper.JS_ListView_GetItemRect(listviewHWND, index) end ---@type function (listviewHWND: identifier, index: integer): retval: boolean, left: number, top: number, right: number, bottom: number

function reaper.JS_ListView_GetItemState(listviewHWND, index) end ---@type function (listviewHWND: identifier, index: integer): retval: integer

function reaper.JS_ListView_GetItemText(listviewHWND, index, subItem) end ---@type function (listviewHWND: identifier, index: integer, subItem: integer): text: string

function reaper.JS_ListView_GetSelectedCount(listviewHWND) end ---@type function (listviewHWND: identifier): retval: integer

function reaper.JS_ListView_GetTopIndex(reaper, listviewHWND) end ---@type function (reaper: integer, listviewHWND: identifier)

function reaper.JS_ListView_HitTest(listviewHWND, clientX, clientY) end ---@type function (listviewHWND: identifier, clientX: integer, clientY: integer): index: number, subItem: number, flags: number

function reaper.JS_ListView_ListAllSelItems(listviewHWND) end ---@type function (listviewHWND: identifier): retval: integer, items: string

function reaper.JS_ListView_SetItemState(listviewHWND, index, state, mask) end ---@type function (listviewHWND: identifier, index: integer, state: integer, mask: integer)

function reaper.JS_ListView_SetItemText(listviewHWND, index, subItem, text) end ---@type function (listviewHWND: identifier, index: integer, subItem: integer, text: string)

function reaper.Xen_AudioWriter_Create(reaper, filename, numchans, samplerate) end ---@type function (reaper: AudioWriter, filename: string, numchans: integer, samplerate: integer)

function reaper.Xen_AudioWriter_Destroy(writer) end ---@type function (writer: AudioWriter)

function reaper.Xen_AudioWriter_Write(reaper, writer, numframes, data, offset) end ---@type function (reaper: integer, writer: AudioWriter, numframes: integer, data: identifier, offset: integer)

function reaper.Xen_GetMediaSourceSamples(reaper, src, destbuf, destbufoffset, numframes, numchans, samplerate, sourceposition) end ---@type function (reaper: integer, src: PCM_source, destbuf: identifier, destbufoffset: integer, numframes: integer, numchans: integer, samplerate: number, sourceposition: number)

function reaper.Xen_StartSourcePreview(reaper, source, gain, loop, number) end ---@type function (reaper: integer, source: PCM_source, gain: number, loop: boolean, number: optional)

function reaper.Xen_StopSourcePreview(preview_id) end ---@type function (preview_id: integer): retval: integer

function reaper.BR_Win32_CB_FindString(reaper, comboBoxHwnd, startId, string) end ---@type function (reaper: integer, comboBoxHwnd: identifier, startId: integer, string: string)

function reaper.BR_Win32_CB_FindStringExact(reaper, comboBoxHwnd, startId, string) end ---@type function (reaper: integer, comboBoxHwnd: identifier, startId: integer, string: string)

function reaper.BR_Win32_ClientToScreen(hwnd, xIn, yIn) end ---@type function (hwnd: identifier, xIn: integer, yIn: integer): x: number, y: number

function reaper.BR_Win32_FindWindowEx(reaper, hwndParent, hwndChildAfter, className, windowName, searchClass, searchName) end ---@type function (reaper: identifier, hwndParent: string, hwndChildAfter: string, className: string, windowName: string, searchClass: boolean, searchName: boolean)

function reaper.BR_Win32_GET_X_LPARAM(reaper, lParam) end ---@type function (reaper: integer, lParam: integer)

function reaper.BR_Win32_GET_Y_LPARAM(reaper, lParam) end ---@type function (reaper: integer, lParam: integer)

function reaper.BR_Win32_GetConstant(reaper, constantName) end ---@type function (reaper: integer, constantName: string)

function reaper.BR_Win32_GetCursorPos() end ---@type function (): retval: boolean, x: number, y: number

function reaper.BR_Win32_GetFocus(reaper) end ---@type function (reaper: identifier)

function reaper.BR_Win32_GetForegroundWindow(reaper) end ---@type function (reaper: identifier)

function reaper.BR_Win32_GetMainHwnd(reaper) end ---@type function (reaper: identifier)

function reaper.BR_Win32_GetMixerHwnd() end ---@type function (): retval: identifier, isDocked: boolean

function reaper.BR_Win32_GetMonitorRectFromRect(workingAreaOnly, leftIn, topIn, rightIn, bottomIn) end ---@type function (workingAreaOnly: boolean, leftIn: integer, topIn: integer, rightIn: integer, bottomIn: integer): left: number, top: number, right: number, bottom: number

function reaper.BR_Win32_GetParent(reaper, hwnd) end ---@type function (reaper: identifier, hwnd: identifier)

function reaper.BR_Win32_GetWindow(reaper, hwnd, cmd) end ---@type function (reaper: identifier, hwnd: identifier, cmd: integer)

function reaper.BR_Win32_GetWindowLong(reaper, hwnd, index) end ---@type function (reaper: integer, hwnd: identifier, index: integer)

function reaper.BR_Win32_GetWindowRect(hwnd) end ---@type function (hwnd: identifier): retval: boolean, left: number, top: number, right: number, bottom: number

function reaper.BR_Win32_GetWindowText(hwnd) end ---@type function (hwnd: identifier): retval: integer, text: string

function reaper.BR_Win32_HIBYTE(reaper, value) end ---@type function (reaper: integer, value: integer)

function reaper.BR_Win32_HIWORD(reaper, value) end ---@type function (reaper: integer, value: integer)

function reaper.BR_Win32_HwndToString(hwnd) end ---@type function (hwnd: identifier): string: string

function reaper.BR_Win32_IsWindow(reaper, hwnd) end ---@type function (reaper: boolean, hwnd: identifier)

function reaper.BR_Win32_IsWindowVisible(reaper, hwnd) end ---@type function (reaper: boolean, hwnd: identifier)

function reaper.BR_Win32_LOBYTE(reaper, value) end ---@type function (reaper: integer, value: integer)

function reaper.BR_Win32_LOWORD(reaper, value) end ---@type function (reaper: integer, value: integer)

function reaper.BR_Win32_MAKELONG(reaper, low, high) end ---@type function (reaper: integer, low: integer, high: integer)

function reaper.BR_Win32_MAKELPARAM(reaper, low, high) end ---@type function (reaper: integer, low: integer, high: integer)

function reaper.BR_Win32_MAKELRESULT(reaper, low, high) end ---@type function (reaper: integer, low: integer, high: integer)

function reaper.BR_Win32_MAKEWORD(reaper, low, high) end ---@type function (reaper: integer, low: integer, high: integer)

function reaper.BR_Win32_MAKEWPARAM(reaper, low, high) end ---@type function (reaper: integer, low: integer, high: integer)

function reaper.BR_Win32_MIDIEditor_GetActive(reaper) end ---@type function (reaper: identifier)

function reaper.BR_Win32_ScreenToClient(hwnd, xIn, yIn) end ---@type function (hwnd: identifier, xIn: integer, yIn: integer): x: number, y: number

function reaper.BR_Win32_SendMessage(reaper, hwnd, msg, lParam, wParam) end ---@type function (reaper: integer, hwnd: identifier, msg: integer, lParam: integer, wParam: integer)

function reaper.BR_Win32_SetFocus(reaper, hwnd) end ---@type function (reaper: identifier, hwnd: identifier)

function reaper.BR_Win32_SetForegroundWindow(reaper, hwnd) end ---@type function (reaper: integer, hwnd: identifier)

function reaper.BR_Win32_SetWindowLong(reaper, hwnd, index, newLong) end ---@type function (reaper: integer, hwnd: identifier, index: integer, newLong: integer)

function reaper.BR_Win32_SetWindowPos(reaper, hwnd, hwndInsertAfter, x, y, width, height, flags) end ---@type function (reaper: boolean, hwnd: identifier, hwndInsertAfter: string, x: integer, y: integer, width: integer, height: integer, flags: integer)

function reaper.BR_Win32_ShowWindow(reaper, hwnd, cmdShow) end ---@type function (reaper: boolean, hwnd: identifier, cmdShow: integer)

function reaper.BR_Win32_StringToHwnd(reaper, string) end ---@type function (reaper: identifier, string: string)

function reaper.BR_Win32_WindowFromPoint(reaper, x, y) end ---@type function (reaper: identifier, x: integer, y: integer)

function reaper.CF_EnumMediaSourceCues(src, index) end ---@type function (src: PCM_source, index: integer): retval: integer, time: number, endTime: number, isRegion: boolean, name: string

function reaper.CF_EnumSelectedFX(reaper, hwnd, index) end ---@type function (reaper: integer, hwnd: FxChain, index: integer)

function reaper.CF_EnumerateActions(section, index) end ---@type function (section: integer, index: integer): retval: integer, name: string

function reaper.CF_ExportMediaSource(reaper, src, fn) end ---@type function (reaper: boolean, src: PCM_source, fn: string)

function reaper.CF_GetCommandText(reaper, section, command) end ---@type function (reaper: string, section: integer, command: integer)

function reaper.CF_GetFocusedFXChain() end ---@type function (): FxChain

function reaper.CF_GetMediaSourceBitDepth(reaper, src) end ---@type function (reaper: integer, src: PCM_source)

function reaper.CF_GetMediaSourceMetadata(src, name, out) end ---@type function (src: PCM_source, name: string, out: string): retval: boolean, out: string

function reaper.CF_GetMediaSourceOnline(reaper, src) end ---@type function (reaper: boolean, src: PCM_source)

function reaper.CF_GetMediaSourceRPP(src) end ---@type function (src: PCM_source): retval: boolean, fn: string

function reaper.CF_GetSWSVersion() end ---@type function (): version: string

function reaper.CF_GetTakeFXChain(reaper, take) end ---@type function (reaper: FxChain, take: MediaItem_Take)

function reaper.CF_GetTrackFXChain(reaper, track) end ---@type function (reaper: FxChain, track: MediaTrack)

function reaper.CF_LocateInExplorer(reaper, file) end ---@type function (reaper: boolean, file: string)

function reaper.CF_SelectTrackFX(reaper, track, index) end ---@type function (reaper: boolean, track: MediaTrack, index: integer)

function reaper.CF_SetMediaSourceOnline(src, set) end ---@type function (src: PCM_source, set: boolean)

function reaper.CF_ShellExecute(reaper, file) end ---@type function (reaper: boolean, file: string)

function reaper.NF_AnalyzeMediaItemPeakAndRMS(reaper, item, windowSize, reaper, reaper, reaper, reaper) end ---@type function (reaper: boolean, item: MediaItem, windowSize: number, reaper: identifier, reaper: identifier, reaper: identifier, reaper: identifier)

function reaper.NF_GetMediaItemMaxPeakAndMaxPeakPos(item) end ---@type function (item: MediaItem): retval: number, maxPeakPos: number

function reaper.NF_GetSWSMarkerRegionSub(reaper, markerRegionIdx) end ---@type function (reaper: string, markerRegionIdx: integer)

function reaper.NF_GetSWSTrackNotes(tracknotes, track) end ---@type function (tracknotes: string, track: MediaTrack)

function reaper.NF_GetSWS_RMSoptions() end ---@type function (): target: number, windowSize: number

function reaper.NF_ReadID3v2Tag(fn, tag) end ---@type function (fn: string, tag: string): retval: boolean, tagval: string

function reaper.NF_SetSWSMarkerRegionSub(reaper, markerRegionSub, markerRegionIdx) end ---@type function (reaper: boolean, markerRegionSub: string, markerRegionIdx: integer)

function reaper.NF_SetSWSTrackNotes(track, str) end ---@type function (track: MediaTrack, str: string)

function reaper.NF_SetSWS_RMSoptions(retval, targetLevel, windowSize) end ---@type function (retval: boolean, targetLevel: number, windowSize: number)

function reaper.NF_TakeFX_GetModuleName(item, fx) end ---@type function (item: MediaItem, fx: integer): retval: boolean, name: string

function reaper.NF_UpdateSWSMarkerRegionSubWindow() end ---@type function ()

function reaper.NF_Win32_GetSystemMetrics(nIndex) end ---@type function (nIndex: integer): retval: integer

function reaper.atexit(function) end ---@type function (function: function)

function reaper.defer(function) end ---@type function (function: function): retval: boolean

function reaper.get_action_context() end ---@type function (): is_new_value: boolean, filename_with_path: string, sectionID: integer, cmdID: integer, mode: integer, resolution: integer, val: integer

function VARIABLES(VARIABLES) end ---@type function (VARIABLES: gfx)

function gfx.arc(x, y, r, ang1, ang2, number) end ---@type function (x: integer, y: integer, r: integer, ang1: number, ang2: number, number: optional)

function gfx.blit(source, scale, rotation, number, number, number, number, integer, integer, integer, integer, integer, integer) end ---@type function (source: integer, scale: number, rotation: number, number: optional, number: optional, number: optional, number: optional, integer: optional, integer: optional, integer: optional, integer: optional, integer: optional, integer: optional): source: integer

function gfx.blit(source, scale, rotation) end ---@type function (source: integer, scale: number, rotation: number): source: integer

function gfx.blitext() end ---@type function ()

function gfx.blurto(x, y) end ---@type function (x: integer, y: integer)

function gfx.circle(x, y, r, number, number) end ---@type function (x: integer, y: integer, r: integer, number: optional, number: optional)

function gfx.clienttoscreen(x, y) end ---@type function (x: integer, y: integer): convx: int, convy: int

function gfx.deltablit(srcimg, srcs, srct, srcw, srch, destx, desty, destw, desth, dsdx, dtdx, dsdy, dtdy, dsdxdy, dtdxdy, integer) end ---@type function (srcimg: integer, srcs: integer, srct: integer, srcw: integer, srch: integer, destx: number, desty: number, destw: number, desth: number, dsdx: number, dtdx: number, dsdy: number, dtdy: number, dsdxdy: number, dtdxdy: number, integer: optional): retval: number

function gfx.dock(v, integer, integer, integer, integer) end ---@type function (v: integer, integer: optional, integer: optional, integer: optional, integer: optional): querystate: number, integer: optional, integer: optional, integer: optional, integer: optional

function gfx.drawchar(char) end ---@type function (char: integer): char: integer

function gfx.drawnumber(n, ndigits) end ---@type function (n: number, ndigits: integer)

function gfx.drawstr(str, integer, integer, integer) end ---@type function (str: string, integer: optional, integer: optional, integer: optional)

function gfx.getchar(integer) end ---@type function (integer: optional): charactercode: integer

function gfx.getdropfile(idx) end ---@type function (idx: integer): retval: integer, filename: string

function gfx.getfont() end ---@type function (): fontindex: integer

function gfx.getimgdim(handle) end ---@type function (handle: integer): w: integer, h: integer

function gfx.getpixel() end ---@type function (): r: integer, g: integer, b: integer

function gfx.gradrect() end ---@type function ()

function gfx.init(integer, integer, integer, integer, integer) end ---@type function (integer: optional, integer: optional, integer: optional, integer: optional, integer: optional): retval: integer

function gfx.line(x, y, x2, y2, number) end ---@type function (x: integer, y: integer, x2: integer, y2: integer, number: optional)

function gfx.lineto(x, y, aa) end ---@type function (x: integer, y: integer, aa: number)

function gfx.loadimg(image, filename) end ---@type function (image: integer, filename: string): retval: integer

function gfx.measurechar(char) end ---@type function (char: integer): width: integer, height: integer

function gfx.measurestr(str) end ---@type function (str: string): width: integer, height: integer

function gfx.muladdrect(x, y, w, h, mul_r, mul_g, mul_b, number, number, number, number, number) end ---@type function (x: integer, y: integer, w: integer, h: integer, mul_r: number, mul_g: number, mul_b: number, number: optional, number: optional, number: optional, number: optional, number: optional): retval: integer

function gfx.printf() end ---@type function ()

function gfx.quit() end ---@type function (): retval: integer

function gfx.rect(x, y, w, h, integer) end ---@type function (x: integer, y: integer, w: integer, h: integer, integer: optional): retval: integer

function gfx.rectto(x, y) end ---@type function (x: integer, y: integer): x_coordinate: integer

function gfx.roundrect(x, y, w, h, radius, integer) end ---@type function (x: integer, y: integer, w: integer, h: integer, radius: number, integer: optional): retval: integer

function gfx.screentoclient(x, y) end ---@type function (x: integer, y: integer): convx: integer, convy: integer

function gfx.set(r, number, number, number, integer, integer) end ---@type function (r: number, number: optional, number: optional, number: optional, integer: optional, integer: optional): retval: integer

function gfx.setcursor() end ---@type function ()

function gfx.setfont(idx, string, integer, integer) end ---@type function (idx: integer, string: optional, integer: optional, integer: optional)

function gfx.setimgdim(image, w, h) end ---@type function (image: integer, w: integer, h: integer): retval: integer

function gfx.setpixel(r, g, b) end ---@type function (r: number, g: number, b: number): retval: integer

function gfx.showmenu(str) end ---@type function (str: string): selection: integer

function gfx.transformblit(srcimg, destx, desty, destw, desth, div_w, div_h, table) end ---@type function (srcimg: integer, destx: integer, desty: integer, destw: integer, desth: integer, div_w: integer, div_h: integer, table: table)

function gfx.triangle(x1, y1, x2, y2, x3, y3, integer, integer) end ---@type function (x1: integer, y1: integer, x2: integer, y2: integer, x3: integer, y3: integer, integer: optional, integer: optional)

function reaper.gmem_attach(sharedMemoryName) end ---@type function (sharedMemoryName: string)

function reaper.gmem_read(index) end ---@type function (index: integer): retval: number

function reaper.gmem_write(index, value) end ---@type function (index: integer, value: number)

function gfx.update() end ---@type function ()

function reaper.new_array() end ---@type function (): reaper_array: ReaperArray

function reaper.runloop(function) end ---@type function (function: function): retval: boolean

function {reaper.array}.clear() end ---@type function (): retval: boolean

function {reaper.array}.convolve() end ---@type function (): retval: integer

function {reaper.array}.copy() end ---@type function (): retval: integer

function {reaper.array}.fft() end ---@type function ()

function {reaper.array}.fft_real() end ---@type function ()

function {reaper.array}.get_alloc() end ---@type function (): size: integer

function {reaper.array}.ifft() end ---@type function ()

function {reaper.array}.ifft_real() end ---@type function ()

function {reaper.array}.multiply() end ---@type function ()

function {reaper.array}.resize() end ---@type function ()

function {reaper.array}.table() end ---@type function ()

function reaper.ReaPack_AboutInstalledPackage(reaper, entry) end ---@type function (reaper: boolean, entry: PackageEntry)

function reaper.ReaPack_AboutRepository(reaper, repoName) end ---@type function (reaper: boolean, repoName: string)

function reaper.ReaPack_AddSetRepository(name, url, enable, autoInstall) end ---@type function (name: string, url: string, enable: boolean, autoInstall: integer): retval: boolean, error: string

function reaper.ReaPack_BrowsePackages(filter) end ---@type function (filter: string)

function reaper.ReaPack_CompareVersions(ver1, ver2) end ---@type function (ver1: string, ver2: string): retval: integer, error: string

function reaper.ReaPack_EnumOwnedFiles(entry, index) end ---@type function (entry: PackageEntry, index: integer): retval: boolean, path: string, sections: number, type: number

function reaper.ReaPack_FreeEntry(reaper, entry) end ---@type function (reaper: boolean, entry: PackageEntry)

function reaper.ReaPack_GetEntryInfo(entry) end ---@type function (entry: PackageEntry): retval: boolean, repo: string, cat: string, pkg: string, desc: string, type: number, ver: string, author: string, pinned: boolean, fileCount: number

function reaper.ReaPack_GetOwner(fn) end ---@type function (fn: string): retval: PackageEntry, error: string

function reaper.ReaPack_GetRepositoryInfo(name) end ---@type function (name: string): retval: boolean, url: string, enabled: boolean, autoInstall: number

function reaper.ReaPack_ProcessQueue(refreshUI) end ---@type function (refreshUI: boolean)
