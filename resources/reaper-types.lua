---@meta
reaper = {}
gfx = {}

---Creates a new media item. It will be empty and therefore not be shown in the arrange-view, until you associate a mediafile(audio, picture, video, etc) or a length and position to it using [SetMediaItemInfo\_Value](#SetMediaItemInfo_Value)
---@param tr MediaTrack
---@return MediaItem item
function reaper.AddMediaItemToTrack(tr) end

---Creates a new Projectmarker/Region.
---Returns the index of the created marker/region, or -1 on failure. Supply wantidx&gt;=0 if you want a particular index number, but you'll get a different index number a region and wantidx is already in use.
---@param proj ReaProject
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param name string
---@param wantidx integer
---@return integer 
function reaper.AddProjectMarker(proj, isrgn, pos, rgnend, name, wantidx) end

---Returns the index of the created marker/region, or -1 on failure. Supply wantidx&gt;=0 if you want a particular index number, but you'll get a different index number a region and wantidx is already in use. color should be 0 (default color), or [ColorToNative(r,g,b)|0x1000000](#ColorToNative)
---@param proj ReaProject
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param name string
---@param wantidx integer
---@param color integer
---@return integer 
function reaper.AddProjectMarker2(proj, isrgn, pos, rgnend, name, wantidx, color) end

---Adds a ReaScript (returns the new command ID, or 0 if failed) or removes a ReaScript
---Returns &gt;0 on success. 
---Use commit==true when adding/removing a single script. 
---When bulk adding/removing multiple scripts, you can optimize the n-1 first calls with commit==false and commit==true for the last call.            
---The commandID returned, might change, when addng this script into an other Reaper-installation. 
---To be sure to use the right command-id, use [ReverseNamedCommandLookup()](#ReverseNamedCommandLookup) to get the ActionCommandID, which will never change, until you remove the script.If you want to add a script to several sections, you need to add them individually, by calling the function again with the changed section-number.
---@param add boolean
---@param sectionID integer
---@param scriptfn string
---@param commit boolean
---@return integer 
function reaper.AddRemoveReaScript(add, sectionID, scriptfn, commit) end

---creates a new take in an item
---@param item MediaItem
---@return MediaItem_Take 
function reaper.AddTakeToMediaItem(item) end

---Deprecated. Use [SetTempoTimeSigMarker](#SetTempoTimeSigMarker) with ptidx=-1.
---@param proj ReaProject
---@param timepos number
---@param bpm number
---@param timesig_num integer
---@param timesig_denom integer
---@param lineartempochange boolean
---@return boolean 
function reaper.AddTempoTimeSigMarker(proj, timepos, bpm, timesig_num, timesig_denom, lineartempochange) end

---Sets horizontal zoom in track view.
---@param amt number
---@param forceset integer
---@param doupd boolean
---@param centermode integer
function reaper.adjustZoom(amt, forceset, doupd, centermode) end

---returns, whether any of the tracks is solo in Project proj
---@param proj ReaProject
---@return boolean 
function reaper.AnyTrackSolo(proj) end

---Returns true if function_name exists in the REAPER API
---@param function_name string
---@return boolean 
function reaper.APIExists(function_name) end

---Displays a message window with "Hello World", if the API was successfully called.
function reaper.APITest() end

---Nudges elements like items, cursor, contents, etc to or by a value you want. Nudges only selected mediaitems.
---@param project ReaProject
---@param nudgeflag integer
---@param nudgewhat integer
---@param nudgeunits integer
---@param value number
---@param reverse boolean
---@param copies integer
---@return boolean 
function reaper.ApplyNudge(project, nudgeflag, nudgewhat, nudgeunits, value, reverse, copies) end

---open all audio and MIDI devices, if not open
function reaper.Audio_Init() end

---is in pre-buffer? threadsafe
---@return integer 
function reaper.Audio_IsPreBuffer() end

---is audio running at all? threadsafe
---@return integer 
function reaper.Audio_IsRunning() end

---close all audio and MIDI devices, if open
function reaper.Audio_Quit() end

---Returns true if the underlying samples (track or media item take) have changed, but does not update the audio accessor, so the user can selectively call [AudioAccessorValidateState](#AudioAccessorValidateState) only when needed. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples).
---@param reaper boolean
---@param accessor AudioAccessor
function reaper.AudioAccessorStateChanged(reaper, accessor) end

---Force the accessor to reload its state from the underlying track or media item take. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples).
---@param accessor AudioAccessor
function reaper.AudioAccessorUpdate(accessor) end

---Validates the current state of the audio accessor -- must ONLY call this from the main thread. Returns true if the state changed.
---@param accessor AudioAccessor
---@return boolean 
function reaper.AudioAccessorValidateState(accessor) end

---Does bypassing of the fx of all tracks.
---@param bypass integer
function reaper.BypassFxAllTracks(bypass) end

---Clears all armed states of all tracks.
function reaper.ClearAllRecArmed() end

---Clear the ReaScript console. See [ShowConsoleMsg](#ShowConsoleMsg)
function reaper.ClearConsole() end

---resets the global peak caches
function reaper.ClearPeakCache() end

---Extract RGB values from an OS dependent color. See [ColorToNative](#ColorToNative).As Reaper treats colors differently on Mac and Windows, you should always use [ColorFromNative](#ColorFromNative) and [ColorToNative](#ColorToNative).
---@param col integer
---@return integer r, integer g, integer b
function reaper.ColorFromNative(col) end

---Make an OS dependent color from RGB values (e.g. RGB() macro on Windows). r,g and b are in [0..255]. See [ColorFromNative](#ColorFromNative)
---As Reaper treats colors differently on Mac and Windows, you should always use [ColorFromNative](#ColorFromNative) and [ColorToNative](ColorToNative).When using the returned colorvalue, you need to add |0x1000000 at the end of it, like ColorToNative(20,30,40)|0x1000000.
---@param r integer
---@param g integer
---@param b integer
---@return integer 
function reaper.ColorToNative(r, g, b) end

---Returns the number of automation items on this envelope. See [GetSetAutomationItemInfo](#GetSetAutomationItemInfo).
---@param env TrackEnvelope
---@return integer 
function reaper.CountAutomationItems(env) end

---Returns the number of points in the envelope. See [#CountEnvelopePointsEx](#CountEnvelopePointsEx)
---@param envelope TrackEnvelope
---@return integer 
function reaper.CountEnvelopePoints(envelope) end

---Returns the number of points in the envelope.
---autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
---For automation items, pass autoitem\_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
---even if the automation item is trimmed so that not all points are visible.
---Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.See [GetEnvelopePointEx](#GetEnvelopePointEx), [SetEnvelopePointEx](#SetEnvelopePointEx), [InsertEnvelopePointEx](#InsertEnvelopePointEx), [DeleteEnvelopePointEx](#DeleteEnvelopePointEx).
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@return integer 
function reaper.CountEnvelopePointsEx(envelope, autoitem_idx) end

---count the number of items in the project (proj=0 for active project)
---@param proj ReaProject
---@return integer 
function reaper.CountMediaItems(proj) end

---returns the number of all markers and regions, as well as all markers and all regions in a project.
---num_markersOut and num_regionsOut may be NULL.
---@param proj ReaProject
---@return integer retval, number num_markers, number num_regions
function reaper.CountProjectMarkers(proj) end

---count the number of selected items in the project (proj=0 for active project)
---@param proj ReaProject
---@return integer 
function reaper.CountSelectedMediaItems(proj) end

---Count the number of selected tracks in the project. 
---This function ignores the master track, see [CountSelectedTracks2](#CountSelectedTracks2)
---@param proj ReaProject
---@return integer 
function reaper.CountSelectedTracks(proj) end

---Count the number of selected tracks in the project.
---if you set wantmaster to true, it will include the master track as well.
---@param proj ReaProject
---@param wantmaster boolean
---@return integer 
function reaper.CountSelectedTracks2(proj, wantmaster) end

---See [GetTakeEnvelope](#GetTakeEnvelope)
---@param take MediaItem_Take
---@return integer 
function reaper.CountTakeEnvelopes(take) end

---count the number of takes in the item
---@param item MediaItem
---@return integer 
function reaper.CountTakes(item) end

---Count the number of FX parameter knobs displayed on the track control panel.
---@param project ReaProject
---@param track MediaTrack
---@return integer 
function reaper.CountTCPFXParms(project, track) end

---Count the number of tempo/time signature markers in the project. See [GetTempoTimeSigMarker](#GetTempoTimeSigMarker), [SetTempoTimeSigMarker](#SetTempoTimeSigMarker), [AddTempoTimeSigMarker](#AddTempoTimeSigMarker), [DeleteTempoTimeSigMarker](#DeleteTempoTimeSigMarker).
---@param proj ReaProject
---@return integer 
function reaper.CountTempoTimeSigMarkers(proj) end

---Counts the number of track-envelopes of a certain track.
---see [GetTrackEnvelope](#GetTrackEnvelope)
---@param track MediaTrack
---@return integer 
function reaper.CountTrackEnvelopes(track) end

---count the number of items in the track
---@param track MediaTrack
---@return integer 
function reaper.CountTrackMediaItems(track) end

---count the number of tracks in the project (proj=0 for active project)
---@param proj ReaProject
---@return integer 
function reaper.CountTracks(proj) end

---Create a new MIDI media item, containing no MIDI events. Time is in seconds unless qn is set.
---@param track MediaTrack
---@param starttime number
---@param endtime number
---@param boolean optional
---@return MediaItem 
function reaper.CreateNewMIDIItemInProj(track, starttime, endtime, boolean) end

---Create an audio accessor object for this take. Must only call from the main thread. See [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples).
---@param take MediaItem_Take
---@return AudioAccessor 
function reaper.CreateTakeAudioAccessor(take) end

---Create an audio accessor object for this track. Must only call from the main thread. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples).
---@param track MediaTrack
---@return AudioAccessor 
function reaper.CreateTrackAudioAccessor(track) end

---Create a send/receive (desttrInOptional!=NULL), or a hardware output (desttrInOptional==NULL) with default properties, return &gt;=0 on success (== new send/receive index). See [RemoveTrackSend](#RemoveTrackSend), [GetSetTrackSendInfo](#GetSetTrackSendInfo), [GetTrackSendInfo\_Value](#GetTrackSendInfo_Value), [SetTrackSendInfo\_Value](#SetTrackSendInfo_Value).For ReaRoute-users: the outputs are hardware outputs, but with 512 added to the destination channel index (512 is the first rearoute channel, 513 the second, etc).
---@param tr MediaTrack
---@param desttrIn MediaTrack
---@return integer 
function reaper.CreateTrackSend(tr, desttrIn) end

---call this to force flushing of the undo states after using CSurf_On*Change()
---@param force boolean
function reaper.CSurf_FlushUndo(force) end

---@param trackid MediaTrack
---@param isPan integer
---@return boolean 
function reaper.CSurf_GetTouchState(trackid, isPan) end

---Moves the cursor to the end of the last item in the project.
function reaper.CSurf_GoEnd() end

---Moves the cursor to the start of the project.
function reaper.CSurf_GoStart() end

---counts the number of tracks, or the number of visible tracks, when mcpView is set to true.
---@param mcpView boolean
---@return integer 
function reaper.CSurf_NumTracks(mcpView) end

---Zoom or scroll the Arrangeview vertically. 
---The stepsize with scrolling is track by track.
---@param whichdir integer
---@param wantzoom boolean
function reaper.CSurf_OnArrow(whichdir, wantzoom) end

---Moves editcursor forward, and optionally with seekplay.
---@param seekplay integer
function reaper.CSurf_OnFwd(seekplay) end

---Sets/toggles activation of FX-Chain.
---@param trackid MediaTrack
---@param en integer
---@return boolean 
function reaper.CSurf_OnFXChange(trackid, en) end

---sets rec-monitoring of a specific track.
---@param trackid MediaTrack
---@param monitor integer
---@return integer 
function reaper.CSurf_OnInputMonitorChange(trackid, monitor) end

---Sets monitor-input-state. If MediaTrack is selected, among others, and allowgang is set to true, the new state will be set to them as well.
---@param trackid MediaTrack
---@param monitor integer
---@param allowgang boolean
---@return integer 
function reaper.CSurf_OnInputMonitorChangeEx(trackid, monitor, allowgang) end

---Sets mute state of a MediaTrack.
---@param trackid MediaTrack
---@param mute integer
---@return boolean 
function reaper.CSurf_OnMuteChange(trackid, mute) end

---Sets/toggles mute-state for a MediaTrack. If MediaTrack is selected, among others, and allowgang is set to true, the new state will be set to them as well.
---@param trackid MediaTrack
---@param mute integer
---@param allowgang boolean
---@return boolean 
function reaper.CSurf_OnMuteChangeEx(trackid, mute, allowgang) end

---Changes the pan-value of a track.
---@param trackid MediaTrack
---@param pan number
---@param relative boolean
---@return number 
function reaper.CSurf_OnPanChange(trackid, pan, relative) end

---Changes the pan-value of a track. If MediaTrack is selected, among others, and allowgang is set to true, the new state will be set to them as well.
---@param trackid MediaTrack
---@param pan number
---@param relative boolean
---@param allowGang boolean
---@return number 
function reaper.CSurf_OnPanChangeEx(trackid, pan, relative, allowGang) end

---Toggles between pause and play or when recording has started between pause and rec. Unlike [CSurf\_OnPlay()](#CSurf_OnPlay) it toggles pause first, then plays.
function reaper.CSurf_OnPause() end

---Toggles between play and pause or, when recording, rec and pause. Unlike [CSurf\_OnPause()](#CSurf_OnPause) it toggles play first, then pauses.
function reaper.CSurf_OnPlay() end

---Sets the playbackrate of the current project. Can be between 0.25x to 4x.
---@param playrate number
function reaper.CSurf_OnPlayRateChange(playrate) end

---Sets a MediaTrack's armed state.
---@param trackid MediaTrack
---@param recarm integer
---@return boolean 
function reaper.CSurf_OnRecArmChange(trackid, recarm) end

---Sets a MediaTrack's armed state. If MediaTrack is selected, among others, and allowgang is set to true, the new state will be set to them as well.
---@param trackid MediaTrack
---@param recarm integer
---@param allowgang boolean
---@return boolean 
function reaper.CSurf_OnRecArmChangeEx(trackid, recarm, allowgang) end

---Toggles recording on and off. Starts recording from edit-cursor-position.
function reaper.CSurf_OnRecord() end

---Sets/alters a pan-value for a received-track. Will also change pan in the accompanying send-track!
---@param trackid MediaTrack
---@param recv_index integer
---@param pan number
---@param relative boolean
---@return number 
function reaper.CSurf_OnRecvPanChange(trackid, recv_index, pan, relative) end

---Sets/alters the volume-value of a received track. Will also change volume in the accompanying send-track!Note: You can't(!) use SLIDER2DB or DB2SLIDER for getting the volume-values, you want to set here! Use [mkvolstr](#mkvolstr) instead.
---@param trackid MediaTrack
---@param recv_index integer
---@param volume number
---@param relative boolean
---@return number 
function reaper.CSurf_OnRecvVolumeChange(trackid, recv_index, volume, relative) end

---Moves editcursor backward, and optionally with seekplay.
---@param seekplay integer
function reaper.CSurf_OnRew(seekplay) end

---Will move editcursor for or backward, depending on parameter dir.
---During play and whith seekplay set, the movement of the editcursor depends on the playcursor-position at the time of calling CSurf_OnRewFwd.
---@param seekplay integer
---@param dir integer
function reaper.CSurf_OnRewFwd(seekplay, dir) end

---Scroll arrangeview relative to it's current view-settings.
---@param xdir integer
---@param ydir integer
function reaper.CSurf_OnScroll(xdir, ydir) end

---Sets a track selected or not.
---@param trackid MediaTrack
---@param selected integer
---@return boolean 
function reaper.CSurf_OnSelectedChange(trackid, selected) end

---Sets/alters the pan-volume of a send-track. Will also change the volume of the accompanying receive-track!
---@param trackid MediaTrack
---@param send_index integer
---@param pan number
---@param relative boolean
---@return number 
function reaper.CSurf_OnSendPanChange(trackid, send_index, pan, relative) end

---Sets/alters the volume-value of a send-track. Will also alter the volume of the accompanying receive-track.Note: You can't(!) use SLIDER2DB or DB2SLIDER for getting the volume-values, you want to set here!
---@param trackid MediaTrack
---@param send_index integer
---@param volume number
---@param relative boolean
---@return number 
function reaper.CSurf_OnSendVolumeChange(trackid, send_index, volume, relative) end

---Sets/toggles solo state of a track.
---@param trackid MediaTrack
---@param solo integer
---@return boolean 
function reaper.CSurf_OnSoloChange(trackid, solo) end

---Sets/toggles solo state of a track. If MediaTrack is selected, among others, and allowgang is set to true, the new state will be set to them as well.
---@param trackid MediaTrack
---@param solo integer
---@param allowgang boolean
---@return boolean retval
function reaper.CSurf_OnSoloChangeEx(trackid, solo, allowgang) end

---Stops playing/recording in current project.
function reaper.CSurf_OnStop() end

---Sets the tempo of the project in beats per minute.
---@param bpm number
function reaper.CSurf_OnTempoChange(bpm) end

---@param trackid MediaTrack
function reaper.CSurf_OnTrackSelection(trackid) end

---Sets or alters volume of a track to a new value.Use [DB2SLIDER](#DB2SLIDER) to convert dB-value to fitting numbers of the volume-parameter.
---@param trackid MediaTrack
---@param volume number
---@param relative boolean
---@return number 
function reaper.CSurf_OnVolumeChange(trackid, volume, relative) end

---Sets or alters volume of a track to a new value. If MediaTrack is selected, among others, and allowgang is set to true, the new state will be set to them as well.Use [DB2SLIDER](#DB2SLIDER) to convert dB-value to fitting numbers of the volume-parameter.
---@param trackid MediaTrack
---@param volume number
---@param relative boolean
---@param allowGang boolean
---@return number 
function reaper.CSurf_OnVolumeChangeEx(trackid, volume, relative, allowGang) end

---Sets/alters the width-value of a track.
---@param trackid MediaTrack
---@param width number
---@param relative boolean
---@return number 
function reaper.CSurf_OnWidthChange(trackid, width, relative) end

---Sets/alters the width-value of a track. If MediaTrack is selected, among others, and allowgang is set to true, the new state will be set to them as well.
---@param trackid MediaTrack
---@param width number
---@param relative boolean
---@param allowGang boolean
---@return number 
function reaper.CSurf_OnWidthChangeEx(trackid, width, relative, allowGang) end

---Changes horizontal/vertical zoom.
---@param xdir integer
---@param ydir integer
function reaper.CSurf_OnZoom(xdir, ydir) end

---Resets all cached vol-pan-states.
function reaper.CSurf_ResetAllCachedVolPanStates() end

---Changes position of the editcursor by amt-value in seconds. When playing, the playposition changes to the editcursor-position.
---During recording, it changes only the position of the editcursor.
---@param amt number
function reaper.CSurf_ScrubAmt(amt) end

---@param mode integer
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetAutoMode(mode, ignoresurf) end

---@param play boolean
---@param pause boolean
---@param rec boolean
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetPlayState(play, pause, rec, ignoresurf) end

---@param rep boolean
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetRepeatState(rep, ignoresurf) end

---@param trackid MediaTrack
---@param mute boolean
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetSurfaceMute(trackid, mute, ignoresurf) end

---@param trackid MediaTrack
---@param pan number
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetSurfacePan(trackid, pan, ignoresurf) end

---@param trackid MediaTrack
---@param recarm boolean
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetSurfaceRecArm(trackid, recarm, ignoresurf) end

---@param trackid MediaTrack
---@param selected boolean
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetSurfaceSelected(trackid, selected, ignoresurf) end

---@param trackid MediaTrack
---@param solo boolean
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetSurfaceSolo(trackid, solo, ignoresurf) end

---@param trackid MediaTrack
---@param volume number
---@param ignoresurf IReaperControlSurface
function reaper.CSurf_SetSurfaceVolume(trackid, volume, ignoresurf) end

function reaper.CSurf_SetTrackListChange() end

---Gets a MediaTrack-object by it's number.
---@param idx integer
---@param mcpView boolean
---@return MediaTrack 
function reaper.CSurf_TrackFromID(idx, mcpView) end

---Get the tracknumber of a MediaTrack-object.
---@param track MediaTrack
---@param mcpView boolean
---@return integer 
function reaper.CSurf_TrackToID(track, mcpView) end

---Converts dB-value into a slider-value. Good for converting envelope-point-values.
---@param x number
---@return number 
function reaper.DB2SLIDER(x) end

---Delete an envelope point. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done.
---autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
---For automation items, pass autoitem\_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
---even if the automation item is trimmed so that not all points are visible.
---Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.See [CountEnvelopePointsEx](#CountEnvelopePointsEx), [GetEnvelopePointEx](#GetEnvelopePointEx), [SetEnvelopePointEx](#SetEnvelopePointEx), [InsertEnvelopePointEx](#InsertEnvelopePointEx).
---@param reaper boolean
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@param ptidx integer
function reaper.DeleteEnvelopePointEx(reaper, envelope, autoitem_idx, ptidx) end

---Delete a range of envelope points. See [DeleteEnvelopePointRangeEx](#DeleteEnvelopePointRangeEx), [DeleteEnvelopePointEx](#DeleteEnvelopePointEx).
---@param envelope TrackEnvelope
---@param time_start number
---@param time_end number
---@return boolean 
function reaper.DeleteEnvelopePointRange(envelope, time_start, time_end) end

---Delete a range of envelope points. autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@param time_start number
---@param time_end number
---@return boolean 
function reaper.DeleteEnvelopePointRangeEx(envelope, autoitem_idx, time_start, time_end) end

---Delete the extended state value for a specific section and key. persist=true means the value should remain deleted the next time REAPER is opened. If persistent, the value will be deleted from the file reaper-extstate.ini in the ressources-folder.
---See [SetExtState](#SetExtState), [GetExtState](#GetExtState), [HasExtState](#HasExtState).
---@param section string
---@param key string
---@param persist boolean
function reaper.DeleteExtState(section, key, persist) end

---Deletes a marker or a region. proj==NULL for the active project.Does not delete tempo/timesignature markers!
---@param proj ReaProject
---@param markrgnindexnumber integer
---@param isrgn boolean
---@return boolean 
function reaper.DeleteProjectMarker(proj, markrgnindexnumber, isrgn) end

---Differs from DeleteProjectMarker only in that markrgnidx is 0 for the first marker/region in the project, 1 for the next, etc, rather than representing the displayed marker/region ID number.
---See [EnumProjectMarkers3](#EnumProjectMarkers3)) and [SetProjectMarker4](#SetProjectMarker4).
---@param proj ReaProject
---@param markrgnidx integer
---@return boolean 
function reaper.DeleteProjectMarkerByIndex(proj, markrgnidx) end

---Delete a take marker. Note that idx will change for all following take markers. 
---See [GetNumTakeMarkers](#GetNumTakeMarkers)), [GetTakeMarker](#GetTakeMarker) and [SetTakeMarker](#SetTakeMarker).
---@param take MediaItem_Take
---@param idx integer
---@return boolean retval
function reaper.DeleteTakeMarker(take, idx) end

---Deletes one or more stretch markers. Returns number of stretch markers deleted.
---@param take MediaItem_Take
---@param idx integer
---@param number optional
---@return integer 
function reaper.DeleteTakeStretchMarkers(take, idx, number) end

---Delete a tempo/time signature marker. See [CountTempoTimeSigMarkers](#CountTempoTimeSigMarkers), [GetTempoTimeSigMarker](#GetTempoTimeSigMarker), [SetTempoTimeSigMarker](#SetTempoTimeSigMarker), [AddTempoTimeSigMarker](#AddTempoTimeSigMarker).
---@param project ReaProject
---@param markerindex integer
---@return boolean 
function reaper.DeleteTempoTimeSigMarker(project, markerindex) end

---deletes a track
---@param tr MediaTrack
function reaper.DeleteTrack(tr) end

---Deletes a MediaItem.
---@param tr MediaTrack
---@param it MediaItem
---@return boolean 
function reaper.DeleteTrackMediaItem(tr, it) end

---Destroy an audio accessor. Must only call from the main thread. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples). 
---@param accessor AudioAccessor
function reaper.DestroyAudioAccessor(accessor) end

---updates preference for docker window ident_str to be in dock whichDock on next open
---@param ident_str string
---@param whichDock integer
function reaper.Dock_UpdateDockID(ident_str, whichDock) end

---returns the position of docker whichDock
---@param reaper integer
---@param whichDock integer
function reaper.DockGetPosition(reaper, whichDock) end

---returns dock index that contains hwnd, or -1
---@param hwnd HWND
---@return integer retval, boolean isFloatingDocker
function reaper.DockIsChildOfDock(hwnd) end

---@param hwnd HWND
function reaper.DockWindowActivate(hwnd) end

---@param hwnd HWND
---@param name string
---@param pos integer
---@param allowShow boolean
function reaper.DockWindowAdd(hwnd, name, pos, allowShow) end

---@param hwnd HWND
---@param name string
---@param identstr string
---@param allowShow boolean
function reaper.DockWindowAddEx(hwnd, name, identstr, allowShow) end

---Refreshes docked windows.
function reaper.DockWindowRefresh() end

---@param hwnd HWND
function reaper.DockWindowRefreshForHWND(hwnd) end

---@param hwnd HWND
function reaper.DockWindowRemove(hwnd) end

---Open the tempo/time signature marker editor dialog.
---@param project ReaProject
---@param markerindex integer
---@return boolean 
function reaper.EditTempoTimeSigMarker(project, markerindex) end

---call with a saved window rect for your window and it'll correct any positioning info.
---@param r integer
---@param r integer
---@param r integer
---@param r integer
---@return integer r, integer r, integer r, integer r
function reaper.EnsureNotCompletelyOffscreen(r, r, r, r) end

---List the files in the "path" directory. Returns NULL (or empty string, in Lua) when all files have been listed. See [EnumerateSubdirectories](#EnumerateSubdirectories)
---@param path string
---@param fileindex integer
---@return string 
function reaper.EnumerateFiles(path, fileindex) end

---List the subdirectories in the "path" directory. Returns NULL (or empty string, in Lua) when all subdirectories have been listed. See [EnumerateFiles](#EnumerateFiles)
---@param path string
---@param subdirindex integer
---@return string 
function reaper.EnumerateSubdirectories(path, subdirindex) end

---Start querying modes at 0, returns FALSE when no more modes possible, sets strOut to NULL if a mode is currently unsupported
---@param mode integer
---@return boolean retval, string str
function reaper.EnumPitchShiftModes(mode) end

---Returns submode name, or NULL
---@param mode integer
---@param submode integer
---@return string 
function reaper.EnumPitchShiftSubModes(mode, submode) end

---Returns the values of a given marker or region idx.
---@param idx integer
---@return integer retval, boolean isrgn, number pos, number rgnend, string name, integer markrgnindexnumber
function reaper.EnumProjectMarkers(idx) end

---Returns the values of a given marker or region idx from a given project proj.
---@param proj ReaProject
---@param idx integer
---@return integer retval, boolean isrgn, number pos, number rgnend, string name, integer markrgnindexnumber
function reaper.EnumProjectMarkers2(proj, idx) end

---Returns the values of a given marker or region idx from a given project proj.
---@param proj ReaProject
---@param idx integer
---@return integer retval, boolean isrgn, number pos, number rgnend, string name, integer markrgnindexnumber, integer color
function reaper.EnumProjectMarkers3(proj, idx) end

---Get ReaProject-object and filename of a project.
---idx=-1 for current project,projfn can be NULL if not interested in filename. use idx 0x40000000 for currently rendering project, if any.If you need the path to the recording-folder, use [GetProjectPath](#GetProjectPath) instead.
---@param idx integer
---@return ReaProject retval, optional string
function reaper.EnumProjects(idx) end

---Enumerate the data stored with the project for a specific extname. Returns false when there is no more data. See [SetProjExtState](#SetProjExtState), [GetProjExtState](#GetProjExtState).
---@param proj ReaProject
---@param extname string
---@param idx integer
---@return boolean retval, optional string, optional string
function reaper.EnumProjExtState(proj, extname, idx) end

---Enumerate which tracks will be rendered within this region when using the region render matrix. When called with rendertrack==0, the function returns the first track that will be rendered (which may be the master track); rendertrack==1 will return the next track rendered, and so on. The function returns NULL when there are no more tracks that will be rendered within this region.
---@param proj ReaProject
---@param regionindex integer
---@param rendertrack integer
---@return MediaTrack 
function reaper.EnumRegionRenderMatrix(proj, regionindex, rendertrack) end

---returns false if there are no plugins on the track that support MIDI programs,or if all programs have been enumerated
---@param track integer
---@param programNumber integer
---@param programName string
---@return boolean retval, string programName
function reaper.EnumTrackMIDIProgramNames(track, programNumber, programName) end

---returns false if there are no plugins on the track that support MIDI programs,or if all programs have been enumerated
---@param proj ReaProject
---@param track MediaTrack
---@param programNumber integer
---@param programName string
---@return boolean retval, string programName
function reaper.EnumTrackMIDIProgramNamesEx(proj, track, programNumber, programName) end

---Get the effective envelope value at a given time position. samplesRequested is how long the caller expects until the next call to Envelope_Evaluate (often, the buffer block size). The return value is how many samples beyond that time position that the returned values are valid. dVdS is the change in value per sample (first derivative), ddVdS is the second derivative, dddVdS is the third derivative. See [GetEnvelopeScalingMode](#GetEnvelopeScalingMode).
---@param envelope TrackEnvelope
---@param time number
---@param samplerate number
---@param samplesRequested integer
---@return integer retval, optional number, optional number, optional number, optional number
function reaper.Envelope_Evaluate(envelope, time, samplerate, samplesRequested) end

---Formats the value of an envelope to a user-readable form
---@param env TrackEnvelope
---@param value number
---@return string buf
function reaper.Envelope_FormatValue(env, value) end

---If take envelope, gets the take from the envelope. If FX, indexOutOptional set to FX index, index2OutOptional set to parameter index, otherwise -1.
---@param env TrackEnvelope
---@return MediaItem_Take retval, optional number, optional number
function reaper.Envelope_GetParentTake(env) end

---If track envelope, gets the track from the envelope. If FX, indexOutOptional set to FX index, index2OutOptional set to parameter index, otherwise -1.
---@param env TrackEnvelope
---@return MediaTrack retval, optional number, optional number
function reaper.Envelope_GetParentTrack(env) end

---Sort envelope points by time. See [SetEnvelopePoint](#SetEnvelopePoint), [InsertEnvelopePoint](#InsertEnvelopePoint).
---@param envelope TrackEnvelope
---@return boolean 
function reaper.Envelope_SortPoints(envelope) end

---Sort envelope points by time. autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc. See [SetEnvelopePoint](#SetEnvelopePoint), [InsertEnvelopePoint](#InsertEnvelopePoint).
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@return boolean 
function reaper.Envelope_SortPointsEx(envelope, autoitem_idx) end

---Executes command line, returns NULL on total failure, otherwise the return value, a newline, and then the output of the command.             
---        
---Commands executed with ExecProcess() don't benefit from PATH-system-variables. That said, you must give the full path to a command, even if you can usually just type the command into a shell. You also may need to set a codepage manually to get the correct character-encoding. So in some cases, writing a batch-script and executing it with ExecProcess() might be a good idea.The base-directory is Reaper's appdirectory.On Windows, you can not use command-line-internal commands, like dir or cd, directly. To use them, you need to use cmd.exe. 
---You can do it like:-    "$Path_to_Command_Exe\\cmd.exe /Q /C command"where "/Q" executes cmd.exe silently(otherwise a command-line-window pops up; but output of commands will show anyway) and "/C command" executes command.To get a full directory-listing of c:\\ in a file c:\\directorylisting.txt, you can use:
----   "c:\\windows\\system32\\cmd.exe /Q /C dir c:\\ >c:\\directorylisting.txt"
---@param cmdline string
---@param timeoutmsec integer
---@return string 
function reaper.ExecProcess(cmdline, timeoutmsec) end

---Checks, if a specified file exists and is readable.returns true if path points to a valid, readable file
---@param path string
---@return boolean 
function reaper.file_exists(path) end

---Find the tempo/time signature marker that falls at or before this time position (the marker that is in effect as of this time position).
---@param project ReaProject
---@param time number
---@return integer 
function reaper.FindTempoTimeSigMarker(project, time) end

---Creates a timestring and formats it as hh:mm:ss.sss. See [format\_timestr_pos](#format_timestr_pos), [format\_timestr_len](#format_timestr_len).
---@param tpos number
---@param buf string
---@return string buf
function reaper.format_timestr(tpos, buf) end

---time formatting mode overrides: -1=proj default.
---0=time
---1=measures.beats + time
---2=measures.beats
---3=seconds
---4=samples
---5=h:m:s:f
---offset is start of where the length will be calculated from
---@param tpos number
---@param buf string
---@param offset number
---@param modeoverride integer
---@return string buf
function reaper.format_timestr_len(tpos, buf, offset, modeoverride) end

---time formatting mode overrides: -1=proj default.
---    0=time
---    1=measures.beats + time
---    2=measures.beats
---    3=seconds
---    4=samples
---    5=h:m:s:f
---@param tpos number
---@param buf string
---@param modeoverride integer
---@return string buf
function reaper.format_timestr_pos(tpos, buf, modeoverride) end

---Generates a GUID.
---@param gGUID string
---@return string gGUID
function reaper.genGuid(gGUID) end

---gets ini configuration variable value as stringsee the [configuration-variable documentation](Reaper_Config_Variables.html) for more details
---@param name string
---@return boolean retval, string buf
function reaper.get_config_var_string(name) end

---Get reaper.ini full filename+path.
---@return string 
function reaper.get_ini_file() end

---get the active take in this item
---@param item MediaItem
---@return MediaItem_Take 
function reaper.GetActiveTake(item) end

---returns the bitwise OR of all project play states, eg. and project is playing/pausing/recording (1=playing, 2=pause, 4=recording)
---@param ignoreProject ReaProject
---@return integer 
function reaper.GetAllProjectPlayStates(ignoreProject) end

---Returns the current version of Reaper, e.g "5.62/x64"(windows x64) or "6.16/macOS-arm64"(for arm macs)
---@return string 
function reaper.GetAppVersion() end

---Get the end time of the audio that can be returned from this accessor. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples).
---@param accessor AudioAccessor
---@return number 
function reaper.GetAudioAccessorEndTime(accessor) end

---Get a short hash string (128 chars or less) that will change only if the underlying samples change. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples).Deprecated. See [AudioAccessorStateChanged](#AudioAccessorStateChanged) instead.
---@param accessor AudioAccessor
---@param hashNeed128 string
---@return string hashNeed128
function reaper.GetAudioAccessorHash(accessor, hashNeed128) end

---Get a block of samples from the audio accessor. Samples are extracted immediately pre-FX, and returned interleaved (first sample of first channel, first sample of second channel...). Returns 0 if no audio, 1 if audio, -1 on error. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime).This function has special handling in Python, and only returns two objects, the API function return value, and the sample buffer. Example usage:
---            
---            tr = RPR\_GetTrack(0, 0)
---            aa = RPR\_CreateTrackAudioAccessor(tr)
---            buf = list([0]\*2\*1024) \# 2 channels, 1024 samples each, initialized to zero
---            pos = 0.0
---            (ret, buf) = GetAudioAccessorSamples(aa, 44100, 2, pos, 1024, buf)
---            \# buf now holds the first 2\*1024 audio samples from the track.
---            \# typically GetAudioAccessorSamples() would be called within a loop, increasing pos each time.
---@param accessor AudioAccessor
---@param samplerate integer
---@param numchannels integer
---@param starttime_sec number
---@param numsamplesperchannel integer
---@param samplebuffer array
---@return integer 
function reaper.GetAudioAccessorSamples(accessor, samplerate, numchannels, starttime_sec, numsamplesperchannel, samplebuffer) end

---Get the start time of the audio that can be returned from this accessor. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples).
---@param accessor AudioAccessor
---@return number 
function reaper.GetAudioAccessorStartTime(accessor) end

---get information about the currently open audio device. 
---Attribute can be MODE, IDENT\_IN, IDENT\_OUT, BSIZE, SRATE, BPS. returns false if unknown attribute or device not open.
---@param attribute string
---@param desc string
---@return boolean retval, string desc
function reaper.GetAudioDeviceInfo(attribute, desc) end

---gets the dock ID desired by ident_str, if any
---@param ident_str string
---@return integer 
function reaper.GetConfigWantsDock(ident_str) end

---returns current project if in load/save (usually only used from project_config_extension_t)
---@return ReaProject 
function reaper.GetCurrentProjectInLoadSave() end

---return the current cursor context.
---@return integer 
function reaper.GetCursorContext() end

---0 if track panels, 1 if items, 2 if envelopes, otherwise unknown (unlikely when want_last_valid is true)
---@param want_last_valid boolean
---@return integer 
function reaper.GetCursorContext2(want_last_valid) end

---edit cursor position
---@return number 
function reaper.GetCursorPosition() end

---Get the edit cursor position in a given project
---@param proj ReaProject
---@return number 
function reaper.GetCursorPositionEx(proj) end

---see [GetDisplayedMediaItemColor2](#GetDisplayedMediaItemColor2).
---@param item MediaItem
---@return integer 
function reaper.GetDisplayedMediaItemColor(item) end

---Returns the custom take, item, or track color that is used (according to the user preference) to color the media item. The returned color is OS dependent|0x01000000 (i.e. ColorToNative(r,g,b)|0x01000000), so a return of zero means "no color", not black.
---@param item MediaItem
---@param take MediaItem_Take
---@return integer 
function reaper.GetDisplayedMediaItemColor2(item, take) end

---Gets an envelope numerical-value attribute:
---    I_TCPY : int *, Y offset of envelope relative to parent track (may be separate lane or overlap with track contents)
---    I_TCPH : int *, visible height of envelope
---    I_TCPY_USED : int *, Y offset of envelope relative to parent track, exclusive of padding
---    I_TCPH_USED : int *, visible height of envelope, exclusive of padding
---    P_TRACK : MediaTrack *, parent track pointer (if any)
---    P_ITEM : MediaItem *, parent item pointer (if any)
---    P_TAKE : MediaItem_Take *, parent take pointer (if any)
---@param tr TrackEnvelope
---@param parmname string
---@return number retval
function reaper.GetEnvelopeInfo_Value(tr, parmname) end

---@param env TrackEnvelope
---@param buf string
---@return boolean retval, string buf
function reaper.GetEnvelopeName(env, buf) end

---Get the attributes of an envelope point. See [GetEnvelopePointEx](#GetEnvelopePointEx)
---@param envelope TrackEnvelope
---@param ptidx integer
---@return boolean retval, optional number, optional number, optional number, optional number, optional boolean
function reaper.GetEnvelopePoint(envelope, ptidx) end

---Returns the envelope point at or immediately prior to the given time position. See [GetEnvelopePointByTimeEx](#GetEnvelopePointByTimeEx)
---@param envelope TrackEnvelope
---@param time number
---@return integer 
function reaper.GetEnvelopePointByTime(envelope, time) end

---Returns the envelope point at or immediately prior to the given time position.
---autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
---For automation items, pass autoitem\_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
---even if the automation item is trimmed so that not all points are visible.
---Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.See [GetEnvelopePointEx](#GetEnvelopePointEx), [SetEnvelopePointEx](#SetEnvelopePointEx), [InsertEnvelopePointEx](#InsertEnvelopePointEx), [DeleteEnvelopePointEx](#DeleteEnvelopePointEx).
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@param time number
---@return integer 
function reaper.GetEnvelopePointByTimeEx(envelope, autoitem_idx, time) end

---Get the attributes of an envelope point.
---autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
---For automation items, pass autoitem\_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
---even if the automation item is trimmed so that not all points are visible.
---Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.See [CountEnvelopePointsEx](#CountEnvelopePointsEx), [SetEnvelopePointEx](#SetEnvelopePointEx), [InsertEnvelopePointEx](#InsertEnvelopePointEx), [DeleteEnvelopePointEx](#DeleteEnvelopePointEx).
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@param ptidx integer
---@return boolean retval, optional number, optional number, optional number, optional number, optional boolean
function reaper.GetEnvelopePointEx(envelope, autoitem_idx, ptidx) end

---Returns the envelope scaling mode: 0=no scaling, 1=fader scaling. All API functions deal with raw envelope point values, to convert raw from/to scaled values see [ScaleFromEnvelopeMode](#ScaleFromEnvelopeMode), [ScaleToEnvelopeMode](#ScaleToEnvelopeMode).
---@param env TrackEnvelope
---@return integer 
function reaper.GetEnvelopeScalingMode(env) end

---Gets the RPPXML state of an envelope.
---@param env TrackEnvelope
---@param str string
---@param isundo boolean
---@return boolean retval, string str
function reaper.GetEnvelopeStateChunk(env, str, isundo) end

---returns path of REAPER.exe (not including EXE), i.e. C:\Program Files\REAPER
---@return string 
function reaper.GetExePath() end

---Get the extended state value for a specific section and key. See [SetExtState](#SetExtState), [DeleteExtState](#DeleteExtState), [HasExtState](#HasExtState).
---@param section string
---@param key string
---@return string 
function reaper.GetExtState(section, key) end

---Get focused FX. !!Deprecated, use [GetFocusedFX2](#GetFocusedFX) insteadSee [GetLastTouchedFX](#GetLastTouchedFX).
---@return integer retval, integer tracknumber, integer itemnumber, integer fxnumber
function reaper.GetFocusedFX() end

---Return value has 1 set if track FX, 2 if take/item FX, 4 set if FX is no longer focused but still open. tracknumber==0 means the master track, 1 means track 1, etc. itemnumber is zero-based (or -1 if not an item). For interpretation of fxnumber, see [GetLastTouchedFX](#GetLastTouchedFX).
---@return integer retval, number tracknumber, number itemnumber, number fxnumber
function reaper.GetFocusedFX2() end

---returns free disk space in megabytes, pathIdx 0 for normal, 1 for alternate.
---@param proj ReaProject
---@param pathidx integer
---@return integer 
function reaper.GetFreeDiskSpaceForRecordPath(proj, pathidx) end

---Returns the FX parameter envelope. If the envelope does not exist and create=true, the envelope will be created.
---@param track MediaTrack
---@param fxindex integer
---@param parameterindex integer
---@param create boolean
---@return TrackEnvelope 
function reaper.GetFXEnvelope(track, fxindex, parameterindex, create) end

---return -1=no override, 0=trim/read, 1=read, 2=touch, 3=write, 4=latch, 5=bypass
---@return integer 
function reaper.GetGlobalAutomationOverride() end

---returns pixels/second
---@return number 
function reaper.GetHZoomLevel() end

---Returns the name of a input-channel.
---@param channelIndex integer
---@return string 
function reaper.GetInputChannelName(channelIndex) end

---Gets the audio device input/output latency in samples
---@return number inputlatency, number outputLatency
function reaper.GetInputOutputLatency() end

---returns time of relevant edit, set which_item to the pcm_source (if applicable), flags (if specified) will be set to 1 for edge resizing, 2 for fade change, 4 for item move, 8 for item slip edit (edit cursor time or start of item)
---@return number position, PCM_source which_item, number flags
function reaper.GetItemEditingTime2() end

---Returns the first item at the screen coordinates specified. If allow_locked is false, locked items are ignored. If takeOutOptional specified, returns the take hit(in Lua, this function simply returns the take as additional return-value).Note: You can not get the item at screen-coordinates, where it is hidden by other windows.
---@param screen_x integer
---@param screen_y integer
---@param allow_locked boolean
---@param MediaItem_Take optional
---@return MediaItem_Take take
function reaper.GetItemFromPoint(screen_x, screen_y, allow_locked, MediaItem_Take) end

---Returns the project, in which a MediaItem is located.
---@param item MediaItem
---@return ReaProject 
function reaper.GetItemProjectContext(item) end

---Gets the RPPXML state of an item, returns true if successful. Undo flag is a performance/caching hint.
---@param item MediaItem
---@param str string
---@param isundo boolean
---@return boolean retval, string str
function reaper.GetItemStateChunk(item, str, isundo) end

---Get the last used color-theme-file.
---@return string 
function reaper.GetLastColorThemeFile() end

---Get the last project marker before time, and/or the project region that includes time. 
---markeridx and regionidx are returned not necessarily as the displayed marker/region index, but as the index that can be passed to EnumProjectMarkers. Either or both of markeridx and regionidx may be NULL. See [EnumProjectMarkers](#EnumProjectMarkers).
---@param proj ReaProject
---@param time number
---@return integer markeridx, integer regionidx
function reaper.GetLastMarkerAndCurRegion(proj, time) end

---Returns the last touched track, it's last touched parameter and tracknumber.The low word of tracknumber is the 1-based track index -- 0 means the master track, 1 means track 1, etc. See [GetFocusedFX2](#GetFocusedFX2).
---@return boolean retval, integer tracknumber, integer fxnumber, integer paramnumber
function reaper.GetLastTouchedFX() end

---Gets the MediaTrack, that has been last touched.
---@return MediaTrack 
function reaper.GetLastTouchedTrack() end

---Get the Reaper-window as an HWND-object
---@return HWND hwnd
function reaper.GetMainHwnd() end

---Deprecated: Get the mute/solo-state of the master-track. This is deprecated as you can just query the master track as well.
---@return integer mastermutesolo
function reaper.GetMasterMuteSoloFlags() end

---Get a MediaTrack-object of the MasterTrack.
---@param proj ReaProject
---@return MediaTrack track
function reaper.GetMasterTrack(proj) end

---Get the visibility of the master-track in mixer and track-control-panel. See [SetMasterTrackVisibility](#SetMasterTrackVisibility).
---@return integer master_visibility
function reaper.GetMasterTrackVisibility() end

---returns max dev for midi inputs
---@return integer 
function reaper.GetMaxMidiInputs() end

---returns max dev for midi outputs
---@return integer 
function reaper.GetMaxMidiOutputs() end

---get an item from a project by item count (zero-based)
---@param proj ReaProject
---@param itemidx integer
---@return MediaItem 
function reaper.GetMediaItem(proj, itemidx) end

---Get parent track of media item
---@param item MediaItem
---@return MediaTrack track
function reaper.GetMediaItem_Track(item) end

---gets the currently armed command and section name (returns 0 if nothing armed). section name is empty-string for main section.
---@return integer retval, string sec
function reaper.GetArmedCommand() end

---arms a command (or disarms if 0 passed) in section sectionname (empty string for main)
---@param cmd integer
---@param sectionname string
function reaper.ArmCommand(cmd, sectionname) end

---Get media item numerical-value attributes.
---@param item MediaItem
---@param parmname string
---@return number retval
function reaper.GetMediaItemInfo_Value(item, parmname) end

---Get the number of takes in a MediaItem-object.
---@param item MediaItem
---@return integer itemnumtakes
function reaper.GetMediaItemNumTakes(item) end

---Get a take from a MediaItem as a MediaItem_Take-object.
---@param item MediaItem
---@param tk integer
---@return MediaItem_Take 
function reaper.GetMediaItemTake(item, tk) end

---Get parent item of media item take.
---@param take MediaItem_Take
---@return MediaItem item
function reaper.GetMediaItemTake_Item(take) end

---Gets block of peak samples to buf. Note that the peak samples are interleaved, but in two or three blocks (maximums, then minimums, then extra). Return value has 20 bits of returned sample count, then 4 bits of output_mode (0xf00000), then a bit to signify whether extra_type was available (0x1000000). extra_type can be 115 ('s') for spectral information, which will return peak samples as integers with the low 15 bits frequency, next 14 bits tonality.
---@param take MediaItem_Take
---@param peakrate number
---@param starttime number
---@param numchannels integer
---@param numsamplesperchannel integer
---@param want_extra_type integer
---@param buf array
---@return integer peaks
function reaper.GetMediaItemTake_Peaks(take, peakrate, starttime, numchannels, numsamplesperchannel, want_extra_type, buf) end

---Get media source of media item take
---@param take MediaItem_Take
---@return PCM_source source
function reaper.GetMediaItemTake_Source(take) end

---Get parent track of media item take
---@param take MediaItem_Take
---@return MediaTrack track
function reaper.GetMediaItemTake_Track(take) end

---@param project ReaProject
---@param guidGUID string
---@return MediaItem_Take take
function reaper.GetMediaItemTakeByGUID(project, guidGUID) end

---Get media item take numerical-value attributes.
---D_STARTOFFS : double * : start offset in source media, in seconds
---D_VOL : double * : take volume, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc, negative if take polarity is flipped
---D_PAN : double * : take pan, -1..1
---D_PANLAW : double * : take pan law, -1=default, 0.5=-6dB, 1.0=+0dB, etc
---D_PLAYRATE : double * : take playback rate, 0.5=half speed, 1=normal, 2=double speed, etc
---D_PITCH : double * : take pitch adjustment in semitones, -12=one octave down, 0=normal, +12=one octave up, etc
---B_PPITCH : bool * : preserve pitch when changing playback rate
---I_CHANMODE : int * : channel mode, 0=normal, 1=reverse stereo, 2=downmix, 3=left, 4=right
---I_PITCHMODE : int * : pitch shifter mode, -1=projext default, otherwise high 2 bytes=shifter, low 2 bytes=parameter
---I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x100000 (i.e. ColorToNative(r,g,b)|0x100000). If you do not |0x100000, then it will not be used, but will store the color.
---IP_TAKENUMBER : int : take number (read-only, returns the take number directly)
---P_TRACK : pointer to MediaTrack (read-only)
---P_ITEM : pointer to MediaItem (read-only)
---P_SOURCE : PCM_source *. Note that if setting this, you should first retrieve the old source, set the new, THEN delete the old.
---@param take MediaItem_Take
---@param parmname string
---@return number retval
function reaper.GetMediaItemTakeInfo_Value(take, parmname) end

---Get the associated MediaTrack of a MediaItem.
---@param item MediaItem
---@return MediaTrack 
function reaper.GetMediaItemTrack(item) end

---Copies the media source filename to typebuf. Note that in-project MIDI media sources have no associated filename. See [GetMediaSourceParent](#GetMediaSourceParent).
---@param source PCM_source
---@param filenamebuf string
---@return string filenamebuf
function reaper.GetMediaSourceFileName(source, filenamebuf) end

---Returns the length of the source media. If the media source is beat-based, the length will be in quarter notes, otherwise it will be in seconds.
---@param source PCM_source
---@return number retval, boolean lengthIsQN
function reaper.GetMediaSourceLength(source) end

---Returns the number of channels in the source media.
---@param source PCM_source
---@return integer mediasourcenumchans
function reaper.GetMediaSourceNumChannels(source) end

---Returns the parent source, or NULL if src is the root source. This can be used to retrieve the parent properties of sections or reversed sources for example.
---@param src PCM_source
---@return PCM_source 
function reaper.GetMediaSourceParent(src) end

---Returns the sample rate. MIDI source media will return zero.
---@param source PCM_source
---@return integer mediasourcesamplerate
function reaper.GetMediaSourceSampleRate(source) end

---copies the media source type ("WAV", "MIDI", etc) to typebuf
---@param source PCM_source
---@param typebuf string
---@return string typebuf
function reaper.GetMediaSourceType(source, typebuf) end

---Get track numerical-value attributes.
---B_MUTE : bool * : muted
---B_PHASE : bool * : track phase inverted
---IP_TRACKNUMBER : int : track number 1-based, 0=not found, -1=master track (read-only, returns the int directly)
---I_SOLO : int * : soloed, 0=not soloed, 1=soloed, 2=soloed in place, 5=safe soloed, 6=safe soloed in place
---I_FXEN : int * : fx enabled, 0=bypassed, !0=fx active
---I_RECARM : int * : record armed, 0=not record armed, 1=record armed
---I_RECINPUT : int * : record input, &lt;0=no input. if 4096 set, input is MIDI and low 5 bits represent channel (0=all, 1-16=only chan), next 6 bits represent physical input (63=all, 62=VKB). If 4096 is not set, low 10 bits (0..1023) are input start channel (ReaRoute/Loopback start at 512). If 2048 is set, input is multichannel input (using track channel count), or if 1024 is set, input is stereo input, otherwise input is mono.
---I_RECMODE : int * : record mode, 0=input, 1=stereo out, 2=none, 3=stereo out w/latency compensation, 4=midi output, 5=mono out, 6=mono out w/ latency compensation, 7=midi overdub, 8=midi replace
---I_RECMON : int * : record monitoring, 0=off, 1=normal, 2=not when playing (tape style)
---I_RECMONITEMS : int * : monitor items while recording, 0=off, 1=on
---I_AUTOMODE : int * : track automation mode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch
---I_NCHAN : int * : number of track channels, 2-64, even numbers only
---I_SELECTED : int * : track selected, 0=unselected, 1=selected
---I_WNDH : int * : current TCP window height in pixels including envelopes (read-only)
---I_TCPH : int * : current TCP window height in pixels not including envelopes (read-only)
---I_TCPY : int * : current TCP window Y-position in pixels relative to top of arrange view (read-only)
---I_MCPX : int * : current MCP X-position in pixels relative to mixer container
---I_MCPY : int * : current MCP Y-position in pixels relative to mixer container
---I_MCPW : int * : current MCP width in pixels
---I_MCPH : int * : current MCP height in pixels
---I_FOLDERDEPTH : int * : folder depth change, 0=normal, 1=track is a folder parent, -1=track is the last in the innermost folder, -2=track is the last in the innermost and next-innermost folders, etc
---I_FOLDERCOMPACT : int * : folder compacted state (only valid on folders), 0=normal, 1=small, 2=tiny children
---I_MIDIHWOUT : int * : track midi hardware output index, &lt;0=disabled, low 5 bits are which channels (0=all, 1-16), next 5 bits are output device index (0-31)
---I_PERFFLAGS : int * : track performance flags, &1=no media buffering, &2=no anticipative FX
---I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x100000 (i.e. ColorToNative(r,g,b)|0x100000). If you do not |0x100000, then it will not be used, but will store the color.
---I_HEIGHTOVERRIDE : int * : custom height override for TCP window, 0 for none, otherwise size in pixels
---B_HEIGHTLOCK : bool * : track height lock (must set I_HEIGHTOVERRIDE before locking)
---D_VOL : double * : trim volume of track, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
---D_PAN : double * : trim pan of track, -1..1
---D_WIDTH : double * : width of track, -1..1
---D_DUALPANL : double * : dualpan position 1, -1..1, only if I_PANMODE==6
---D_DUALPANR : double * : dualpan position 2, -1..1, only if I_PANMODE==6
---I_PANMODE : int * : pan mode, 0=classic 3.x, 3=new balance, 5=stereo pan, 6=dual pan
---D_PANLAW : double * : pan law of track, &lt;0=project default, 1=+0dB, etc
---P_ENV:&lt;envchunkname : TrackEnvelope*, read only. Call with :&lt;VOLENV, :&lt;PANENV, etc appended.
---B_SHOWINMIXER : bool * : track control panel visible in mixer (do not use on master track)
---B_SHOWINTCP : bool * : track control panel visible in arrange view (do not use on master track)
---B_MAINSEND : bool * : track sends audio to parent
---C_MAINSEND_OFFS : char * : channel offset of track send to parent
---B_FREEMODE : bool * : track free item positioning enabled (call UpdateTimeline() after changing)
---C_BEATATTACHMODE : char * : track timebase, -1=project default, 0=time, 1=beats (position, length, rate), 2=beats (position only)
---F_MCP_FXSEND_SCALE : float * : scale of fx+send area in MCP (0=minimum allowed, 1=maximum allowed)
---F_MCP_FXPARM_SCALE : float * : scale of fx parameter area in MCP (0=minimum allowed, 1=maximum allowed)
---F_MCP_SENDRGN_SCALE : float * : scale of send area as proportion of the fx+send total area (0=minimum allowed, 1=maximum allowed)
---F_TCP_FXPARM_SCALE : float * : scale of TCP parameter area when TCP FX are embedded (0=min allowed, default, 1=max allowed)
---I_PLAY_OFFSET_FLAG : int * : track playback offset state, &1=bypassed, &2=offset value is measured in samples (otherwise measured in seconds)
---D_PLAY_OFFSET : double * : track playback offset, units depend on I_PLAY_OFFSET_FLAG
---P_PARTRACK : MediaTrack * : parent track (read-only)
---P_PROJECT : ReaProject * : parent project (read-only)
---@param tr MediaTrack
---@param parmname string
---@return number retval
function reaper.GetMediaTrackInfo_Value(tr, parmname) end

---returns true if device present
---@param dev integer
---@param nameout string
---@return boolean retval, string nameout
function reaper.GetMIDIInputName(dev, nameout) end

---returns true if device present
---@param dev integer
---@param nameout string
---@return boolean retval, string nameout
function reaper.GetMIDIOutputName(dev, nameout) end

---Get the leftmost track visible in the mixer
---@return MediaTrack leftmosttrack
function reaper.GetMixerScroll() end

---Get the current mouse modifier assignment for a specific modifier key assignment, in a specific context.
---action will be filled in with the command ID number for a built-in mouse modifier
---or built-in REAPER command ID, or the custom action ID string.
---See [SetMouseModifier](#SetMouseModifier) for more information.
---@param context string
---@param modifier_flag integer
---@param action string
---@return string action
function reaper.GetMouseModifier(context, modifier_flag, action) end

---get mouse position in screen coordinates
---@return integer x, integer y
function reaper.GetMousePosition() end

---Return number of normal audio hardware inputs available
---@return integer numAudioIns
function reaper.GetNumAudioInputs() end

---Return number of normal audio hardware outputs available
---@return integer numAudioOuts
function reaper.GetNumAudioOutputs() end

---returns max number of real midi hardware inputs
---@return integer numMidiIns
function reaper.GetNumMIDIInputs() end

---returns max number of real midi hardware outputs
---@return integer numMidiOuts
function reaper.GetNumMIDIOutputs() end

---Returns number of take markers.
---See [DeleteTakeMarker](#DeleteTakeMarker)), [GetTakeMarker](#GetTakeMarker) and [SetTakeMarker](#SetTakeMarker).
---@param take MediaItem_Take
---@return integer retval
function reaper.GetNumTakeMarkers(take) end

---Get the number of tracks. Excluding the master-track.
---@return integer numtracks
function reaper.GetNumTracks() end

---Returns the current operating-system. Good for determining, e.g. the correct filesystem-separators.
---@return string os
function reaper.GetOS() end

---Get the name of a specific output-channel.
---@param channelIndex integer
---@return string outputchanname
function reaper.GetOutputChannelName(channelIndex) end

---returns output latency in seconds
---@return number outputlatency
function reaper.GetOutputLatency() end

---Get the parent MediaTrack, if a MediaTrack is a track of a foldered track.
---@param track MediaTrack
---@return MediaTrack parenttrack
function reaper.GetParentTrack(track) end

---get the peak file name for a given file (can be either filename.reapeaks,or a hashed filename in another path)
---@param fn string
---@param buf string
---@return string buf
function reaper.GetPeakFileName(fn, buf) end

---get the peak file name for a given file (can be either filename.reapeaks,or a hashed filename in another path)
---@param fn string
---@param buf string
---@param forWrite boolean
---@return string buf
function reaper.GetPeakFileNameEx(fn, buf, forWrite) end

---Like GetPeakFileNameEx, but you can specify peaksfileextension such as ".reapeaks"
---@param fn string
---@param buf string
---@param forWrite boolean
---@param peaksfileextension string
---@return string buf
function reaper.GetPeakFileNameEx2(fn, buf, forWrite, peaksfileextension) end

---returns latency-compensated actual-what-you-hear position
---@return number playposition
function reaper.GetPlayPosition() end

---returns position of next audio block being processed
---@return number playposition
function reaper.GetPlayPosition2() end

---returns position of next audio block being processed from a specific project
---@param proj ReaProject
---@return number playposition
function reaper.GetPlayPosition2Ex(proj) end

---returns latency-compensated actual-what-you-hear position from a specific project
---@param proj ReaProject
---@return number playposition
function reaper.GetPlayPositionEx(proj) end

---returns, in which play-state the current project is
---@return integer playstate
function reaper.GetPlayState() end

---returns, in which play-state a certain project is
---@param proj ReaProject
---@return integer playstate
function reaper.GetPlayStateEx(proj) end

---returns length of project (maximum of end of media item, markers, end of regions, tempo map)
---@param proj ReaProject
---@return number length
function reaper.GetProjectLength(proj) end

---Get the name of the projectfile.
---@param proj ReaProject
---@param buf string
---@return string buf
function reaper.GetProjectName(proj, buf) end

---Get the path of the project. Will return the defaults project-path's recording-folder, when the project hasn't been saved yet; when the project has been saved, it will return the path to the recording-folder.If you need the filename of the path+projectfile itself, use [EnumProjects](#EnumProjects) instead.            
---@param buf string
---@return string buf
function reaper.GetProjectPath(buf) end

---Get the path of a specific project, usually the recordings-folder.
---@param proj ReaProject
---@param buf string
---@return string buf
function reaper.GetProjectPathEx(proj, buf) end

---returns an integer that changes when the project state changes, e.g. undoable-actions have been made.
---@param proj ReaProject
---@return integer 
function reaper.GetProjectStateChangeCount(proj) end

---Gets project time offset in seconds (project settings -> project start time). 
---@param proj ReaProject
---@param rndframe boolean
---@return number 
function reaper.GetProjectTimeOffset(proj, rndframe) end

---deprecated
---@return number bpm, number bpi
function reaper.GetProjectTimeSignature() end

---Gets basic time signature (beats per minute, numerator of time signature in bpi)
---this does not reflect tempo envelopes but is purely what is set in the project settings.
---@param proj ReaProject
---@return number bpm, number bpi
function reaper.GetProjectTimeSignature2(proj) end

---Get the value previously associated with this extname and key, the last time the project was saved or the value was changed. See [SetProjExtState](#SetProjExtState), [EnumProjExtState](#EnumProjExtState).
---@param proj ReaProject
---@param extname string
---@param key string
---@return integer retval, string val
function reaper.GetProjExtState(proj, extname, key) end

---returns path where ini files are stored, other things are in subdirectories.
---@return string 
function reaper.GetResourcePath() end

---get the currently selected envelope, returns NULL/nil if no envelope is selected
---@param proj ReaProject
---@return TrackEnvelope 
function reaper.GetSelectedEnvelope(proj) end

---get a selected item by selected item count (zero-based)
---See [CountSelectedMediaItems](#CountSelectedMediaItems).
---@param proj ReaProject
---@param selitem integer
---@return MediaItem 
function reaper.GetSelectedMediaItem(proj, selitem) end

---Get a selected track from a project by selected track count (zero-based). 
---This function ignores the master track, see [GetSelectedTrack2](#GetSelectedTrack2) and [CountSelectedTracks](#CountSelectedTracks).
---@param proj ReaProject
---@param seltrackidx integer
---@return MediaTrack 
function reaper.GetSelectedTrack(proj, seltrackidx) end

---Get a selected track from a project (proj=0 for active project) by selected track count (zero-based).
---@param proj ReaProject
---@param seltrackidx integer
---@param wantmaster boolean
---@return MediaTrack 
function reaper.GetSelectedTrack2(proj, seltrackidx, wantmaster) end

---get the currently selected track envelope, returns NULL/nil if no envelope is selected
---@param proj ReaProject
---@return TrackEnvelope 
function reaper.GetSelectedTrackEnvelope(proj) end

---Gets or sets the arrange view start/end time for screen coordinates. use screen_x_start=screen_x_end=0 to use the full arrange view's start/end timeIf you want to get the arrangeviewposition by pixels, set isSet=false and pass the pixel-position of the start and endposition to screen_x_start and screen_x_end.screen_x_start and screen_x_end will be ignored, when isSet=true
---@param proj ReaProject
---@param isSet boolean
---@param screen_x_start integer
---@param screen_x_end integer
---@param start_time number
---@param end_time number
---@return number start_time, number end_time
function reaper.GetSet_ArrangeView2(proj, isSet, screen_x_start, screen_x_end, start_time, end_time) end

---@param isSet boolean
---@param isLoop boolean
---@param start number
---@param end_ number
---@param allowautoseek boolean
---@return number start, number end_
function reaper.GetSet_LoopTimeRange(isSet, isLoop, start, end_, allowautoseek) end

---@param proj ReaProject
---@param isSet boolean
---@param isLoop boolean
---@param start number
---@param end_ number
---@param allowautoseek boolean
---@return number start, number end_
function reaper.GetSet_LoopTimeRange2(proj, isSet, isLoop, start, end_, allowautoseek) end

---Get or set automation item information. autoitem_idx=0 for the first automation item on an envelope, 1 for the second item, etc. desc can be any of the following:
---D_POOL_ID : double * : automation item pool ID (as an integer); edits are propagated to all other automation items that share a pool ID
---D_POSITION : double * : automation item timeline position in seconds
---D_LENGTH : double * : automation item length in seconds
---D_STARTOFFS : double * : automation item start offset in seconds
---D_PLAYRATE : double * : automation item playback rate
---D_BASELINE : double * : automation item baseline value in the range [0,1]
---D_AMPLITUDE : double * : automation item amplitude in the range [-1,1]
---D_LOOPSRC : double * : nonzero if the automation item contents are looped
---D_UISEL : double * : nonzero if the automation item is selected in the arrange view
---D_POOL_QNLEN : double * : automation item pooled source length in quarter notes (setting will affect all pooled instances)
---@param env TrackEnvelope
---@param autoitem_idx integer
---@param desc string
---@param value number
---@param is_set boolean
---@return number 
function reaper.GetSetAutomationItemInfo(env, autoitem_idx, desc, value, is_set) end

---Get or set automation item information. autoitem_idx=0 for the first automation item on an envelope, 1 for the second item, etc. returns true on success. desc can be any of the following:P_POOL_NAME : char *, name of the underlying automation item pool
---P_POOL_EXT:xyz : char *, extension-specific persistent data
---@param env TrackEnvelope
---@param autoitem_idx integer
---@param desc string
---@param valuestrNeedBig string
---@param is_set boolean
---@return boolean retval, string valuestrNeedBig
function reaper.GetSetAutomationItemInfo_String(env, autoitem_idx, desc, valuestrNeedBig, is_set) end

---Gets/sets an attribute string:
---P_EXT:xyz : char * : extension-specific persistent data
---@param env TrackEnvelope
---@param parmname string
---@param stringNeedBig string
---@param setNewValue boolean
---@return boolean retval, string stringNeedBig
function reaper.GetSetEnvelopeInfo_String(env, parmname, stringNeedBig, setNewValue) end

---deprecated -- see [SetEnvelopeStateChunk](#SetEnvelopeStateChunk), [GetEnvelopeStateChunk](#GetEnvelopeStateChunk)
---@param env TrackEnvelope
---@param str string
---@return boolean retval, string str
function reaper.GetSetEnvelopeState(env, str) end

---deprecated -- see [SetEnvelopeStateChunk](#SetEnvelopeStateChunk), [GetEnvelopeStateChunk](#GetEnvelopeStateChunk)
---@param env TrackEnvelope
---@param str string
---@param isundo boolean
---@return boolean retval, string str
function reaper.GetSetEnvelopeState2(env, str, isundo) end

---deprecated -- see [SetItemStateChunk](#SetItemStateChunk), [GetItemStateChunk](#GetItemStateChunk)
---@param item MediaItem
---@param str string
---@return boolean retval, string str
function reaper.GetSetItemState(item, str) end

---deprecated -- see [SetItemStateChunk](#SetItemStateChunk), [GetItemStateChunk](#GetItemStateChunk)
---@param item MediaItem
---@param str string
---@param isundo boolean
---@return boolean retval, string str
function reaper.GetSetItemState2(item, str, isundo) end

---Gets/sets an item attribute string:
---    P_NOTES : char * : item note text (do not write to returned pointer, use setNewValue to update)
---    P_EXT:xyz : char * : extension-specific persistent data
---    GUID : GUID * : 16-byte GUID, can query or update. If using a _String() function, GUID is a string {xyz-...}.
---@param item MediaItem
---@param parmname string
---@param stringNeedBig string
---@param setNewValue boolean
---@return boolean retval, string stringNeedBig
function reaper.GetSetMediaItemInfo_String(item, parmname, stringNeedBig, setNewValue) end

---Gets/sets a take attribute string:
---    P_NAME : char * : take name
---    P_EXT:xyz : char * : extension-specific persistent data
---    GUID : GUID * : 16-byte GUID, can query or update. If using a _String() function, GUID is a string {xyz-...}.
---@param tk MediaItem_Take
---@param parmname string
---@param stringNeedBig string
---@param setnewvalue boolean
---@return boolean retval, string stringNeedBig
function reaper.GetSetMediaItemTakeInfo_String(tk, parmname, stringNeedBig, setnewvalue) end

---Get or set track string attributes.
---P_NAME : char * : track name (on master returns NULL)
---P_ICON : const char * : track icon (full filename, or relative to resource_path/data/track_icons)
---P_MCP_LAYOUT : const char * : layout name
---P_TCP_LAYOUT : const char * : layout name
---P_EXT:xyz : char * : extension-specific persistent data
---GUID : GUID * : 16-byte GUID, can query or update. If using a _String() function, GUID is a string {xyz-...}.
---@param tr MediaTrack
---@param parmname string
---@param stringNeedBig string
---@param setnewvalue boolean
---@return boolean retval, string stringNeedBig
function reaper.GetSetMediaTrackInfo_String(tr, parmname, stringNeedBig, setnewvalue) end

---gets or sets project author, author_sz is ignored when setting
---@param proj ReaProject
---@param set boolean
---@param author string
---@return string author
function reaper.GetSetProjectAuthor(proj, set, author) end

---Get or set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half note triplet, etc. swingmode can be 1 for swing enabled, swingamt is -1..1. swingmode can be 3 for measure-grid. Returns grid configuration flags
---@param project ReaProject
---@param set boolean
---@return integer retval, optional number, optional number, optional number
function reaper.GetSetProjectGrid(project, set) end

---Get or set project information.
--- 
---RENDER_SETTINGS : &amp;(1|2)=0:master mix, &amp;1=stems+master mix, &amp;2=stems only, &amp;4=multichannel tracks to multichannel files, &amp;8=use render matrix, &amp;16=tracks with only mono media to mono files, &amp;32=selected media items, &amp;64=selected media items via master, &amp; 128=Selected tracks via master, &amp;256=Stretch markers/transient guide-checkbox(Only with WAV/AIFF and Source=Selected media items/Selected media items via master), &amp;512=Embed Metadata, if format supports is, &amp;1024=Take markers-checkbox(Only with WAV and Source=Selected media items/Selected media items via master)
---OGG, OPUS and FLAC support embedding of tempoinformation via metadata, settable using [GetSetProjectInfo\_String](#GetSetProjectInfo_String).
---RENDER_BOUNDSFLAG : 0=custom time bounds, 1=entire project, 2=time selection, 3=all project regions, 4=selected media items, 5=selected project regions
---RENDER_CHANNELS : number of channels in rendered file
---RENDER_SRATE : sample rate of rendered file (or 0 for project sample rate)
---RENDER_STARTPOS : render start time when RENDER_BOUNDSFLAG=0
---RENDER_ENDPOS : render end time when RENDER_BOUNDSFLAG=0
---RENDER_TAILFLAG : apply render tail setting when rendering: &amp;1=custom time bounds, &amp;2=entire project, &amp;4=time selection, &amp;8=all project regions, &amp;16=selected media items, &amp;32=selected project regions
---RENDER_TAILMS : tail length in ms to render (only used if RENDER_BOUNDSFLAG and RENDER_TAILFLAG are set)
---RENDER_ADDTOPROJ : &amp;1=add rendered files to project, &amp;2=Do not render files that are likely silent
---RENDER_DITHER : &amp;1=dither, &amp;2=noise shaping, &amp;4=dither stems, &amp;8=noise shaping on stems
---PROJECT_SRATE : samplerate (ignored unless PROJECT_SRATE_USE set)
---PROJECT_SRATE_USE : set to 1 if project samplerate is used
---@param project ReaProject
---@param desc string
---@param value number
---@param is_set boolean
---@return number value
function reaper.GetSetProjectInfo(project, desc, value, is_set) end

---Get or set project information.MARKER\_GUID:X : get the GUID (unique ID) of the marker or region with index X, where X is the index passed to EnumProjectMarkers, not necessarily the displayed number
---RECORD\_PATH: recording directory -- may be blank or a relative path, to get the effective path see [GetProjectPathEx](#GetProjectPathEx)
---RENDER\_FILE: render directory
---RENDER\_PATTERN: render file name (may contain wildcards)
---			RENDER\_TARGETS: semicolon separated list of files that would be written if the project is rendered using the most recent render settings
---RENDER\_FORMAT: base64-encoded sink configuration (see project files, etc). Callers can also pass a simple 4-byte string (non-base64-encoded), to use default settings for that sink type.
---RENDER\_FORMAT2: base64-encoded secondary sink configuration. Callers can also pass a simple 4-byte string (non-base64-encoded), e.g. "evaw" or "l3pm", to use default settings for that sink type, or "" to disable secondary render.
---see [render-code-documentation](render-codes-decoded-base64-strings.txt) for how the unencoded RENDER\_FORMAT-string is structured.To just use the 4-byte-string, you can use: 
---"evaw" for wave, "ffia" for aiff, " osi" for audio-cd, " pdd" for ddp, "calf" for flac, "l3pm" for mp3, "vggo" for ogg, "SggO" for Opus, "PMFF" for FFMpeg-video, "FVAX" for MP4Video/Audio on Mac, " FIG" for Gif, " FCL" for LCF, "kpvw" for wavepack            RENDER\_METADATA: get or set the metadata saved with the project (not metadata embedded in project media). Example, ID3 album name metadata: Uses common ID3-tagcodes like TALB(album), TPE1(Artist), etc. 
---			To get album tag, use "ID3:TALB", to set album tag, use "ID3:TALB|my album name".Examples in Lua:
---getting the album name from the metadata of the current project:     retval, albumname    = reaper.GetSetProjectInfo\_String(0, "RENDER\_METADATA", "ID3:TALB", false)
---    
---setting the album name in the metadata of the current project:     retval, albumame\_new = reaper.GetSetProjectInfo\_String(0, "RENDER\_METADATA", "ID3:TALB|New album name", true)			Supported tags-codes are: TIT2(Title), TPE1(Artist), TPE2(Albumartist), TALB(Album), TRCK(Track), TCON(Genre), TYER(Year), TDRC(Recording time: YYYY-MM-DD), TKEY(Key), TBPM(Tempo), TSRC(International Standard Recording Code), COMM(Comment), COMM\_LANG(Comment language), APIC\_TYPE(Image type), APIC\_DESC(Image description), APIC\_FILE(Image file)
---			APIC\_TYPE can have be of the following:
---0: Other
---1: 32x32 pixel file icon (PNG only)
---2: Other file icon
---3: Cover (front)
---4: Cover (back)
---5: Leaflet page
---6: Media
---7: Lead artist/Lead Performer/Solo
---8: Artist/Performer
---9: Conductor
---10: Band/Orchestra
---11: Composer
---12: Lyricist/Text writer
---13: Recording location
---14: During recording
---15: During performance
---16: Movie/video screen capture
---17: A bright colored fish
---18: Illustration
---19: Band/Artist logotype
---20: Publisher/Studiotype
---@param project ReaProject
---@param desc string
---@param valuestrNeedBig string
---@param is_set boolean
---@return boolean retval, string valuestrNeedBig
function reaper.GetSetProjectInfo_String(project, desc, valuestrNeedBig, is_set) end

---gets or sets project notes, notesNeedBig_sz is ignored when setting
---@param proj ReaProject
---@param set boolean
---@param notes string
---@return string notes
function reaper.GetSetProjectNotes(proj, set, notes) end

---Sets or gets repeat-state of the current project.
---@param val integer
---@return integer 
function reaper.GetSetRepeat(val) end

---Sets or gets repeat-state in a specific project.
---@param proj ReaProject
---@param val integer
---@return integer 
function reaper.GetSetRepeatEx(proj, val) end

---Gets or modifies the group membership for a track. Returns group state prior to call (each bit represents one of the 32 group numbers). if setmask has bits set, those bits in setvalue will be applied to group. Group can be one of:
---VOLUME_LEAD
---VOLUME_FOLLOW
---VOLUME_VCA_LEAD
---VOLUME_VCA_FOLLOW
---PAN_LEAD
---PAN_FOLLOW
---WIDTH_LEAD
---WIDTH_FOLLOW
---MUTE_LEAD
---MUTE_FOLLOW
---SOLO_LEAD
---SOLO_FOLLOW
---RECARM_LEAD
---RECARM_FOLLOW
---POLARITY_LEAD
---POLARITY_FOLLOW
---AUTOMODE_LEAD
---AUTOMODE_FOLLOW
---VOLUME_REVERSE
---PAN_REVERSE
---WIDTH_REVERSE
---NO_LEAD_WHEN_FOLLOW
---VOLUME_VCA_FOLLOW_ISPREFXNote: REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and _FOLLOW, which is deprecated but still supported (scripts that must support v6.11 and earlier can use the deprecated strings).
---@param tr MediaTrack
---@param groupname string
---@param setmask integer
---@param setvalue integer
---@return integer 
function reaper.GetSetTrackGroupMembership(tr, groupname, setmask, setvalue) end

---deprecated -- see [SetTrackStateChunk](#SetTrackStateChunk), [GetTrackStateChunk](#GetTrackStateChunk)
---@param track MediaTrack
---@param str string
---@return boolean retval, string str
function reaper.GetSetTrackState(track, str) end

---deprecated -- see [SetTrackStateChunk](#SetTrackStateChunk), [GetTrackStateChunk](#GetTrackStateChunk)
---@param track MediaTrack
---@param str string
---@param isundo boolean
---@return boolean retval, string str
function reaper.GetSetTrackState2(track, str, isundo) end

---@param src PCM_source
---@return ReaProject 
function reaper.GetSubProjectFromSource(src) end

---get a take from an item by take count (zero-based)
---@param item MediaItem
---@param takeidx integer
---@return MediaItem_Take 
function reaper.GetTake(item, takeidx) end

---@param take MediaItem_Take
---@param envidx integer
---@return TrackEnvelope 
function reaper.GetTakeEnvelope(take, envidx) end

---@param take MediaItem_Take
---@param envname string
---@return TrackEnvelope 
function reaper.GetTakeEnvelopeByName(take, envname) end

---Get information about a take marker. Returns the position in media item source time, or -1 if the take marker does not exist.
---			
---See [GetNumTakeMarkers](#GetNumTakeMarkers)), [DeleteTakeMarker](#DeleteTakeMarker) and [SetTakeMarker](#SetTakeMarker).
---@param take MediaItem_Take
---@param idx integer
---@return number position, string name, optional number
function reaper.GetTakeMarker(take, idx) end

---Retruns the filename of the mediafile in a take. returns NULL if the take is not valid
---@param take MediaItem_Take
---@return string 
function reaper.GetTakeName(take) end

---Returns number of stretch markers in take
---@param take MediaItem_Take
---@return integer 
function reaper.GetTakeNumStretchMarkers(take) end

---Gets information on a stretch marker, idx is 0..n. Returns false if stretch marker not valid. 
---posOut will be set to position in item, srcposOutOptional will be set to source media position. 
---Returns index. if input index is -1, next marker is found using position (or source position if position is -1). 
---If position/source position are used to find marker position, their values are not updated.
---@param take MediaItem_Take
---@param idx integer
---@return integer retval, number pos, optional number
function reaper.GetTakeStretchMarker(take, idx) end

---See [SetTakeStretchMarkerSlope](#SetTakeStretchMarkerSlope)
---@param take MediaItem_Take
---@param idx integer
---@return number 
function reaper.GetTakeStretchMarkerSlope(take, idx) end

---Get information about a specific FX parameter knob (see [CountTCPFXParms](#CountTCPFXParms)).
---@param project ReaProject
---@param track MediaTrack
---@param index integer
---@return boolean retval, number fxindex, number parmidx
function reaper.GetTCPFXParm(project, track, index) end

---finds the playrate and target length to insert this item stretched to a round power-of-2 number of bars, between 1/8 and 256
---@param source PCM_source
---@param srcscale number
---@param position number
---@param mult number
---@return boolean retval, number rate, number targetlen
function reaper.GetTempoMatchPlayRate(source, srcscale, position, mult) end

---Get information about a tempo/time signature marker. See [CountTempoTimeSigMarkers](#CountTempoTimeSigMarkers), [SetTempoTimeSigMarker](#SetTempoTimeSigMarker), [AddTempoTimeSigMarker](#AddTempoTimeSigMarker), [DeleteTempoTimeSigMarker](#DeleteTempoTimeSigMarker).
---@param proj ReaProject
---@param ptidx integer
---@return boolean retval, number timepos, number measurepos, number beatpos, number bpm, number timesig_num, number timesig_denom, boolean lineartempo
function reaper.GetTempoTimeSigMarker(proj, ptidx) end

---Returns the theme color specified, or -1 on failure. If the low bit of flags is set, the color as originally specified by the theme (before any transformations) is returned, otherwise the current (possibly transformed and modified) color is returned. See [SetThemeColor](#SetThemeColor) for a list of valid ini_key.
---@param ini_key string
---@param flags integer
---@return integer retval
function reaper.GetThemeColor(ini_key, flags) end

---Return toggle-state of an action. See [GetToggleCommandStateEx](#GetToggleCommandStateEx).
---See [NamedCommandLookup](#NamedCommandLookup)() for the correct command_id.
---@param command_id integer
---@return integer 
function reaper.GetToggleCommandState(command_id) end

---Return toggle-state of an action.
---For the main action context, the MIDI editor, or the media explorer, returns the toggle state of the action. For the MIDI editor, the action state for the most recently focused window will be returned.
---See [NamedCommandLookup](#NamedCommandLookup)() for the correct command_id.
---@param section_id integer
---@param command_id integer
---@return integer 
function reaper.GetToggleCommandStateEx(section_id, command_id) end

---gets a tooltip window,in case you want to ask it for font information. Can return NULL.
---@return HWND 
function reaper.GetTooltipWindow() end

---get a track from a project by track count (zero-based) (proj=0 for active project)
---@param proj ReaProject
---@param trackidx integer
---@return MediaTrack 
function reaper.GetTrack(proj, trackidx) end

---return the track mode, regardless of global override
---@param tr MediaTrack
---@return integer 
function reaper.GetTrackAutomationMode(tr) end

---Returns the track custom color as OS dependent color|0x100000 (i.e. ColorToNative(r,g,b)|0x100000). Black is returned as 0x01000000, no color setting is returned as 0.
---@param track MediaTrack
---@return integer 
function reaper.GetTrackColor(track) end

---Get the depth of a track within a folder structure
---@param track MediaTrack
---@return integer 
function reaper.GetTrackDepth(track) end

---@param track MediaTrack
---@param envidx integer
---@return TrackEnvelope 
function reaper.GetTrackEnvelope(track, envidx) end

---Gets a built-in track envelope by configuration chunk name, e.g. "&lt;VOLENV".
---@param tr MediaTrack
---@param cfgchunkname string
---@return TrackEnvelope 
function reaper.GetTrackEnvelopeByChunkName(tr, cfgchunkname) end

---@param track MediaTrack
---@param envname string
---@return TrackEnvelope 
function reaper.GetTrackEnvelopeByName(track, envname) end

---Returns the track from the screen coordinates specified. If the screen coordinates refer to a window associated to the track (such as FX), the track will be returned. infoOutOptional will be set to 1 if it is likely an envelope, 2 if it is likely a track FX.Note: You can not get the track at screen-coordinates, where it is hidden by other windows.
---@param screen_x integer
---@param screen_y integer
---@return MediaTrack retval, optional number
function reaper.GetTrackFromPoint(screen_x, screen_y) end

---@param tr MediaTrack
---@return string GUID
function reaper.GetTrackGUID(tr) end

---@param tr MediaTrack
---@param itemidx integer
---@return MediaItem 
function reaper.GetTrackMediaItem(tr, itemidx) end

---Get all MIDI lyrics on the track. Lyrics will be returned as one string with tabs between each word. flag&amp;1: double tabs at the end of each measure and triple tabs when skipping measures, flag&amp;2: each lyric is preceded by its beat position in the project (example with flag=2: "1.1.2\tLyric for measure 1 beat 2\t.1.1\tLyric for measure 2 beat 1   "). See [SetTrackMIDILyrics](#SetTrackMIDILyrics)
---@param track MediaTrack
---@param flag integer
---@param bufWant string
---@return boolean retval, string bufWant
function reaper.GetTrackMIDILyrics(track, flag, bufWant) end

---see [GetTrackMIDINoteNameEx](#GetTrackMIDINoteNameEx)
---@param track integer
---@param pitch integer
---@param chan integer
---@return string 
function reaper.GetTrackMIDINoteName(track, pitch, chan) end

---Get note/CC name. pitch 128 for CC0 name, 129 for CC1 name, etc. See [SetTrackMIDINoteNameEx](#SetTrackMIDINoteNameEx)
---@param proj ReaProject
---@param track MediaTrack
---@param pitch integer
---@param chan integer
---@return string 
function reaper.GetTrackMIDINoteNameEx(proj, track, pitch, chan) end

---@param proj ReaProject
---@param track MediaTrack
---@return number note_lo, number note_hi
function reaper.GetTrackMIDINoteRange(proj, track) end

---Returns "MASTER" for master track, "Track N" if track has no name.
---@param track MediaTrack
---@return boolean retval, string buf
function reaper.GetTrackName(track) end

---Get the number of MediaItems of a MediaTrack
---@param tr MediaTrack
---@return integer 
function reaper.GetTrackNumMediaItems(tr) end

---returns number of sends/receives/hardware outputsFor ReaRoute-users: the outputs are hardware outputs, but with 512 added to the destination channel index (512 is the first rearoute channel, 513 the second, etc).
---@param tr MediaTrack
---@param category integer
---@return integer 
function reaper.GetTrackNumSends(tr, category) end

---See [GetTrackSendName](#GetTrackSendName).
---@param track MediaTrack
---@param recv_index integer
---@param buf string
---@return boolean retval, string buf
function reaper.GetTrackReceiveName(track, recv_index, buf) end

---See [GetTrackSendUIMute](#GetTrackSendUIMute).
---@param track MediaTrack
---@param recv_index integer
---@return boolean retval, boolean mute
function reaper.GetTrackReceiveUIMute(track, recv_index) end

---See [GetTrackSendUIVolPan](#GetTrackSendUIVolPan).
---@param track MediaTrack
---@param recv_index integer
---@return boolean retval, number volume, number pan
function reaper.GetTrackReceiveUIVolPan(track, recv_index) end

---Get send/receive/hardware output numerical-value attributes.
---category is &lt;0 for receives, 0=sends, &gt;0 for hardware outputs
---parameter names:    B\_MUTE : bool \*
---    B\_PHASE : bool \*, true to flip phase
---    B\_MONO : bool \*
---    D\_VOL : double \*, 1.0 = +0dB etc
---    D\_PAN : double \*, -1..+1
---    D\_PANLAW : double \*,1.0=+0.0db, 0.5=-6dB, -1.0 = projdef etc
---    I\_SENDMODE : int \*, 0=post-fader, 1=pre-fx, 2=post-fx (deprecated), 3=post-fx
---    I\_AUTOMODE : int \* : automation mode (-1=use track automode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch)
---    I\_SRCCHAN : int \*, index,&amp;1024=mono, -1 for none
---    I\_DSTCHAN : int \*, index, &amp;1024=mono, otherwise stereo pair, hwout:&amp;512=rearoute
---    I\_MIDIFLAGS : int \*, low 5 bits=source channel 0=all, 1-16, next 5 bits=dest channel, 0=orig, 1-16=chanP_DESTTRACK : read only, returns MediaTrack *, destination track, only applies for sends/recvs
---    P\_SRCTRACK : read only, returns MediaTrack *, source track, only applies for sends/recvs
---    P\_ENV:&lt;envchunkname : read only, returns TrackEnvelope *. To get a specific TrackEnvelope, call with :&lt;VOLENV, :&lt;PANENV, etc appended.
---        
---For ReaRoute-users: the outputs are hardware outputs, but with 512 added to the destination channel index (512 is the first rearoute channel, 513 the second, etc).
---        
---See [CreateTrackSend](#CreateTrackSend), [RemoveTrackSend](#RemoveTrackSend), [GetTrackNumSends](#GetTrackNumSends).
---@param tr MediaTrack
---@param category integer
---@param sendidx integer
---@param parmname string
---@return number 
function reaper.GetTrackSendInfo_Value(tr, category, sendidx, parmname) end

---send\_idx&gt;=0 for hw outputs, &gt;=nb\_of\_hw\_outputs for sends. See [GetTrackReceiveName](#GetTrackReceiveName).
---@param track MediaTrack
---@param send_index integer
---@param buf string
---@return boolean retval, string buf
function reaper.GetTrackSendName(track, send_index, buf) end

---send\_idx&gt;=0 for hw outputs, &gt;=nb\_of\_hw\_outputs for sends. See [GetTrackReceiveUIMute](#GetTrackReceiveUIMute).
---@param track MediaTrack
---@param send_index integer
---@return boolean retval, boolean mute
function reaper.GetTrackSendUIMute(track, send_index) end

---send\_idx&gt;=0 for hw outputs, &gt;=nb\_of\_hw\_outputs for sends. See [GetTrackReceiveUIVolPan](#GetTrackReceiveUIVolPan).
---@param track MediaTrack
---@param send_index integer
---@return boolean retval, number volume, number pan
function reaper.GetTrackSendUIVolPan(track, send_index) end

---Gets track state, returns track name.
---flags will be set to:
---&amp;1=folder
---&amp;2=selected
---&amp;4=has fx enabled
---&amp;8=muted
---&amp;16=soloed
---&amp;32=SIP'd (with &amp;16)
---&amp;64=rec armed
---&amp;128=rec monitoring on
---&amp;256=rec monitoring auto
---&amp;512=hide from TCP
---&amp;1024=hide from MCP
---@param track MediaTrack
---@return string retval, number flags
function reaper.GetTrackState(track) end

---Gets the RPPXML state of a track, returns true if successful. Undo flag is a performance/caching hint.
---@param track MediaTrack
---@param str string
---@param isundo boolean
---@return boolean retval, string str
function reaper.GetTrackStateChunk(track, str, isundo) end

---@param track MediaTrack
---@return boolean retval, boolean mute
function reaper.GetTrackUIMute(track) end

---@param track MediaTrack
---@return boolean retval, number pan1, number pan2, number panmode
function reaper.GetTrackUIPan(track) end

---@param track MediaTrack
---@return boolean retval, number volume, number pan
function reaper.GetTrackUIVolPan(track) end

---retrieves the last timestamps of audio xrun (yellow-flash, if available), media xrun (red-flash), and the current time stamp (all milliseconds)
---@return optional number, audio_xrun retval, optional number, optional number
function reaper.GetUnderrunTime() end

---Opens a filerequester, where a user can select a file.
---The requester only returns the file, but doesn't open or write to it. That said, this function can be used for both use-cases, BUT: keep in mind, that it shows an "open"-button, even if you want to use it in code for saving a file. You also can't use it for "create new file"-usecases, as you can't choose nonexisting files.
---@param filenameNeed4096 string
---@param title string
---@param defext string
---@return boolean retval, string filenameNeed4096
function reaper.GetUserFileNameForRead(filenameNeed4096, title, defext) end

---Opens a window with input-fields to get values from the user.
---If a caption begins with \*, for example "\*password", the edit field will not display the input text.
---Maximum fields is 16. Values are returned as a comma/custom separator-separated string. 
---Returns false if the user canceled the dialog. You can supply special extra information via additional caption fields: extrawidth=XXX to increase text field width, separator=X to use a different separator for returned fields(separator=\n is recommended).Example:retval, retvals_csv = reaper.GetUserInputs("Title", 2, "Hello,World, separator=\n", "defaultvalue1\ndefaultvalue2")will return the values input by the user, separated by a newline.\n is recommended, as this allows the user entering everything, a one-lined-inputbox can handle.Important: the separator-field in the captions has no effect on how captions in parameter captions\_csv are separated from each other. They still need to be separated by commas!Note: the parameter retvals\_csv follows undisclosed csv rules. This is important when you want to set the default-captions for multiple input-field.
---For instance every entry for each input-field: - must contain an even number of quotes/single quotes
---- every ( or must be closed by with )otherwise the separator will be ignored and the default-retvals will show in the wrong fields.Example:a retval_csv of _I'm enlightened,I am too_with one singlequote in it (the one in I'm) will NOT be shown in two fields_I'm enlightened_
---_I am too_but rather in one field as _I'm enlightened,I am too_These can't be escaped due Reaper's API-limitation. Keep this in mind!
---@param title string
---@param num_inputs integer
---@param captions_csv string
---@param retvals_csv string
---@return boolean retval, string retvals_csv
function reaper.GetUserInputs(title, num_inputs, captions_csv, retvals_csv) end

---Go to marker. 
---Move Editcursor to a given marker. When playing, the playcursor moves to the marker as well.For Regions, use [GoToRegion](#GoToRegion).
---@param proj ReaProject
---@param marker_index integer
---@param use_timeline_order boolean
function reaper.GoToMarker(proj, marker_index, use_timeline_order) end

---Go to beginning of a region.
---Seek to region after current region finishes playing (smooth seek). 
---@param proj ReaProject
---@param region_index integer
---@param use_timeline_order boolean
function reaper.GoToRegion(proj, region_index, use_timeline_order) end

---Runs the system color chooser dialog. Returns 0 if the user cancels the dialog.
---@param hwnd HWND
---@return integer retval, number color
function reaper.GR_SelectColor(hwnd) end

---this is just like win32 GetSysColor() but can have overrides.
---@param t integer
---@return integer 
function reaper.GSC_mainwnd(t) end

---dest should be at least 64 chars long to be safe
---@param gGUID string
---@param destNeed64 string
---@return string destNeed64
function reaper.guidToString(gGUID, destNeed64) end

---Returns true if there exists an extended state value for a specific section and key. See [SetExtState](#SetExtState), [GetExtState](#GetExtState), [DeleteExtState](#DeleteExtState).
---@param section string
---@param key string
---@return boolean 
function reaper.HasExtState(section, key) end

---returns name of track plugin that is supplying MIDI programs,or NULL if there is none
---@param track integer
---@return string 
function reaper.HasTrackMIDIPrograms(track) end

---returns name of track plugin that is supplying MIDI programs,or NULL if there is none
---@param proj ReaProject
---@param track MediaTrack
---@return string 
function reaper.HasTrackMIDIProgramsEx(proj, track) end

---Displays an information in the help and information-display, underneath the TCP(might be missing, in certain themes).
---@param helpstring string
---@param is_temporary_help boolean
function reaper.Help_Set(helpstring, is_temporary_help) end

---@param in_ string
---@param out string
---@return string out
function reaper.image_resolve_fn(in_, out) end

---Insert a new automation item. pool\_id &lt; 0 collects existing envelope points into the automation item; if pool\_id is &gt;= 0 the automation item will be a new instance of that pool (which will be created as an empty instance if it does not exist). Returns the index of the item, suitable for passing to other automation item API functions. See [GetSetAutomationItemInfo](#GetSetAutomationItemInfo).
---@param env TrackEnvelope
---@param pool_id integer
---@param position number
---@param length number
---@return integer 
function reaper.InsertAutomationItem(env, pool_id, position, length) end

---Insert an envelope point. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done. See [InsertEnvelopePointEx](#InsertEnvelopePointEx).
---@param envelope TrackEnvelope
---@param time number
---@param value number
---@param shape integer
---@param tension number
---@param selected boolean
---@param boolean optional
---@return boolean 
function reaper.InsertEnvelopePoint(envelope, time, value, shape, tension, selected, boolean) end

---Insert an envelope point. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done.
---autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
---For automation items, pass autoitem\_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
---even if the automation item is trimmed so that not all points are visible.
---Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.See [CountEnvelopePointsEx](#CountEnvelopePointsEx), [GetEnvelopePointEx](#GetEnvelopePointEx), [SetEnvelopePointEx](#SetEnvelopePointEx), [DeleteEnvelopePointEx](#DeleteEnvelopePointEx).
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@param time number
---@param value number
---@param shape integer
---@param tension number
---@param selected boolean
---@param boolean optional
---@return boolean 
function reaper.InsertEnvelopePointEx(envelope, autoitem_idx, time, value, shape, tension, selected, boolean) end

---mode: 
---0=add to current track
---1=add new track
---3=add to selected items as takes
---&amp;4=stretch/loop to fit time sel
---&amp;8=try to match tempo 1x
---&amp;16=try to match tempo 0.5x
---&amp;32=try to match tempo 2x
---&amp;64=don't preserve pitch when matching tempo
---&amp;128=no loop/section if startpct/endpct set
---&amp;256=force loop regardless of global preference for looping imported items
---&amp;512=use high word as absolute track index if mode&amp;3==0
---&amp;1024=insert into reasamplomatic on a new track
---&amp;2048=insert into open reasamplomatic instance
---&amp;4096=move to BWF source preferred position
---@param file string
---@param mode integer
---@return integer 
function reaper.InsertMedia(file, mode) end

---see [InsertMedia](#InsertMedia)
---@param file string
---@param mode integer
---@param startpct number
---@param endpct number
---@param pitchshift number
---@return integer 
function reaper.InsertMediaSection(file, mode, startpct, endpct, pitchshift) end

---inserts a track at idx,of course this will be clamped to 0..[GetNumTracks](#GetNumTracks)().
---@param idx integer
---@param wantDefaults boolean
function reaper.InsertTrackAtIndex(idx, wantDefaults) end

---Tests a file extension (i.e. "wav" or "mid") to see if it's a media extension.
---If wantOthers is set, then "RPP", "TXT" and other project-type formats will also pass.
---@param ext string
---@param wantOthers boolean
---@return boolean 
function reaper.IsMediaExtension(ext, wantOthers) end

---Get, if a MediaItem is selected or not.
---@param item MediaItem
---@return boolean 
function reaper.IsMediaItemSelected(item) end

---Is the project dirty (needing save)? Always returns 0 if 'undo/prompt to save' is disabled in preferences.A project becomes dirty, as soon as it was changed since creation/last saving.
---@param proj ReaProject
---@return integer 
function reaper.IsProjectDirty(proj) end

---Get, if a MediaTrack is selected or not.
---@param track MediaTrack
---@return boolean 
function reaper.IsTrackSelected(track) end

---Gets visibility-state of a MediaTrack.
---@param track MediaTrack
---@param mixer boolean
---@return boolean 
function reaper.IsTrackVisible(track, mixer) end

---creates a joystick device
---@param guidGUID string
---@return joystick_device 
function reaper.joystick_create(guidGUID) end

---destroys a joystick device
---@param device joystick_device
function reaper.joystick_destroy(device) end

---enumerates installed devices, returns GUID as a string
---@param index integer
---@return string retval, optional string
function reaper.joystick_enum(index) end

---returns axis value (-1..1)
---@param dev joystick_device
---@param axis integer
---@return number 
function reaper.joystick_getaxis(dev, axis) end

---returns button pressed mask, 1=first button, 2=second...
---@param dev joystick_device
---@return integer 
function reaper.joystick_getbuttonmask(dev) end

---returns button count
---@param dev joystick_device
---@return integer retval, optional number, optional number
function reaper.joystick_getinfo(dev) end

---returns POV value (usually 0..655.35, or 655.35 on error)
---@param dev joystick_device
---@param pov integer
---@return number 
function reaper.joystick_getpov(dev, pov) end

---Updates joystick state from hardware, returns true if successful (joystick_get* will not be valid until joystick_update() is called successfully)
---@param dev joystick_device
---@return boolean 
function reaper.joystick_update(dev) end

---Returns false if the line is entirely offscreen.
---@param pX1 number
---@param pY1 number
---@param pX2 number
---@param pY2 number
---@param xLo integer
---@param yLo integer
---@param xHi integer
---@param yHi integer
---@return boolean retval, number pX1, number pY1, number pX2, number pY2
function reaper.LICE_ClipLine(pX1, pY1, pX2, pY2, xLo, yLo, xHi, yHi) end

---Returns a localized version of src_string, in section section. flags can have 1 set to only localize if sprintf-style formatting matches the original.
---@param src_string string
---@param section string
---@param flags integer
---@return string retval
function reaper.LocalizeString(src_string, section, flags) end

---Move the loop selection left or right in steps according to snap-settings(when snap is enabled).
---@param project ReaProject
---@param direction integer
---@return boolean 
function reaper.Loop_OnArrow(project, direction) end

---Performs an action belonging to the main action section. To perform non-native actions (ReaScripts, custom or extension plugins' actions) safely, see [NamedCommandLookup](#NamedCommandLookup)().
---See [Main\_OnCommandEx](#Main_OnCommandEx).
---@param command integer
---@param flag integer
function reaper.Main_OnCommand(command, flag) end

---Performs an action belonging to the main action section. To perform non-native actions (ReaScripts, custom or extension plugins' actions) safely, see [NamedCommandLookup](#NamedCommandLookup)().
---@param command integer
---@param flag integer
---@param proj ReaProject
function reaper.Main_OnCommandEx(command, flag, proj) end

---opens a project. will prompt the user to save unless name is prefixed with 'noprompt:'. 
---    example: "noprompt:projectfile.rpp"
---     
---If name is prefixed with 'template:', project file will be loaded as a template.
---    example: "template:projectfile.rpp"You can combine both: "template:noprompt:projectfile.rpp"If passed a .RTrackTemplate file, adds the template to the existing project.
---@param name string
function reaper.Main_openProject(name) end

---Save the project.
---Optional with a save-dialog.
---@param proj ReaProject
---@param forceSaveAsIn boolean
function reaper.Main_SaveProject(proj, forceSaveAsIn) end

---@param ignoremask integer
function reaper.Main_UpdateLoopInfo(ignoremask) end

---Marks project as dirty (needing save) if 'undo/prompt to save' is enabled in preferences.
---@param proj ReaProject
function reaper.MarkProjectDirty(proj) end

---If track is supplied, item is ignored
---@param track MediaTrack
---@param item MediaItem
function reaper.MarkTrackItemsDirty(track, item) end

---Get the playrate of the project.
---@param project ReaProject
---@return number 
function reaper.Master_GetPlayRate(project) end

---@param time_s number
---@param proj ReaProject
---@return number 
function reaper.Master_GetPlayRateAtTime(time_s, proj) end

---@return number 
function reaper.Master_GetTempo() end

---Convert play rate to/from a value between 0 and 1, representing the position on the project playrate slider.
---@param playrate number
---@param isnormalized boolean
---@return number 
function reaper.Master_NormalizePlayRate(playrate, isnormalized) end

---Convert the tempo to/from a value between 0 and 1, representing bpm in the range of 40-296 bpm.
---@param bpm number
---@param isnormalized boolean
---@return number 
function reaper.Master_NormalizeTempo(bpm, isnormalized) end

---Shows Messagebox with user-clickable buttons.           
---@param msg string
---@param title string
---@param type integer
---@return integer 
function reaper.MB(msg, title, type) end

---Returns 1 if the track holds the item, 2 if the track is a folder containing the track that holds the item, etc.
---@param item MediaItem
---@param track MediaTrack
---@return integer 
function reaper.MediaItemDescendsFromTrack(item, track) end

---Count the number of notes, CC events, and text/sysex events in a given MIDI item.
---@param take MediaItem_Take
---@return integer retval, number notecnt, number ccevtcnt, number textsyxevtcnt
function reaper.MIDI_CountEvts(take) end

---Delete a MIDI CC event.
---@param take MediaItem_Take
---@param ccidx integer
---@return boolean 
function reaper.MIDI_DeleteCC(take, ccidx) end

---Delete a MIDI event.
---@param take MediaItem_Take
---@param evtidx integer
---@return boolean 
function reaper.MIDI_DeleteEvt(take, evtidx) end

---Delete a MIDI note.
---@param take MediaItem_Take
---@param noteidx integer
---@return boolean 
function reaper.MIDI_DeleteNote(take, noteidx) end

---Delete a MIDI text or sysex event.
---@param take MediaItem_Take
---@param textsyxevtidx integer
---@return boolean 
function reaper.MIDI_DeleteTextSysexEvt(take, textsyxevtidx) end

---Disable sorting for all MIDI insert, delete, get and set functions, until MIDI_Sort is called.
---@param take MediaItem_Take
function reaper.MIDI_DisableSort(take) end

---Returns the index of the next selected MIDI CC event after ccidx (-1 if there are no more selected events).
---@param take MediaItem_Take
---@param ccidx integer
---@return integer 
function reaper.MIDI_EnumSelCC(take, ccidx) end

---Returns the index of the next selected MIDI event after evtidx (-1 if there are no more selected events).
---@param take MediaItem_Take
---@param evtidx integer
---@return integer 
function reaper.MIDI_EnumSelEvts(take, evtidx) end

---Returns the index of the next selected MIDI note after noteidx (-1 if there are no more selected events).
---@param take MediaItem_Take
---@param noteidx integer
---@return integer 
function reaper.MIDI_EnumSelNotes(take, noteidx) end

---Returns the index of the next selected MIDI text/sysex event after textsyxidx (-1 if there are no more selected events).
---@param take MediaItem_Take
---@param textsyxidx integer
---@return integer 
function reaper.MIDI_EnumSelTextSysexEvts(take, textsyxidx) end

---Get all MIDI data. MIDI buffer is returned as a list of { int offset, char flag, int msglen, unsigned char msg[] }.    offset: MIDI ticks from previous event
---    flag: &1=selected &2=muted
---    flag high 4 bits for CC shape: &16=linear, &32=slow start/end, &16|32=fast start, &64=fast end, &64|16=bezier
---    msg: the MIDI message.A meta-event of type 0xF followed by 'CCBZ ' and 5 more bytes represents bezier curve data for the previous MIDI event: 1 byte for the bezier type (usually 0) and 4 bytes for the bezier tension as a float.
---For tick intervals longer than a 32 bit word can represent, zero-length meta events may be placed between valid events.See [MIDI\_SetAllEvts](#MIDI_SetAllEvts).
---@param take MediaItem_Take
---@param buf string
---@return boolean retval, string buf
function reaper.MIDI_GetAllEvts(take, buf) end

---Get MIDI CC event properties.
---@param take MediaItem_Take
---@param ccidx integer
---@return boolean retval, boolean selected, boolean muted, number ppqpos, number chanmsg, number chan, number msg2, number msg3
function reaper.MIDI_GetCC(take, ccidx) end

---Get CC shape and bezier tension. See [MIDI\_GetCC](#MIDI_GetCC), [MIDI\_SetCCShape](#MIDI_SetCCShape)
---@param take MediaItem_Take
---@param ccidx integer
---@return boolean retval, number shape, number beztension
function reaper.MIDI_GetCCShape(take, ccidx) end

---Get MIDI event properties.
---@param take MediaItem_Take
---@param evtidx integer
---@param selected boolean
---@param muted boolean
---@param ppqpos number
---@param msg string
---@return boolean retval, boolean selected, boolean muted, number ppqpos, string msg
function reaper.MIDI_GetEvt(take, evtidx, selected, muted, ppqpos, msg) end

---Returns the most recent MIDI editor grid size for this MIDI take, in QN. Swing is between 0 and 1. Note length is 0 if it follows the grid size.
---@param take MediaItem_Take
---@return number retval, optional number, optional number
function reaper.MIDI_GetGrid(take) end

---Get a string that only changes when the MIDI data changes. If notesonly==true, then the string changes only when the MIDI notes change. See [MIDI\_GetTrackHash](#MIDI_GetTrackHash)
---@param take MediaItem_Take
---@param notesonly boolean
---@param hash string
---@return boolean retval, string hash
function reaper.MIDI_GetHash(take, notesonly, hash) end

---Get MIDI note properties.
---@param take MediaItem_Take
---@param noteidx integer
---@return boolean retval, boolean selected, boolean muted, number startppqpos, number endppqpos, number chan, number pitch, number vel
function reaper.MIDI_GetNote(take, noteidx) end

---Returns the MIDI tick (ppq) position corresponding to the end of the measure.
---@param take MediaItem_Take
---@param ppqpos number
---@return number 
function reaper.MIDI_GetPPQPos_EndOfMeasure(take, ppqpos) end

---Returns the MIDI tick (ppq) position corresponding to the start of the measure.
---@param take MediaItem_Take
---@param ppqpos number
---@return number 
function reaper.MIDI_GetPPQPos_StartOfMeasure(take, ppqpos) end

---Returns the MIDI tick (ppq) position corresponding to a specific project time in quarter notes.
---@param take MediaItem_Take
---@param projqn number
---@return number 
function reaper.MIDI_GetPPQPosFromProjQN(take, projqn) end

---Returns the MIDI tick (ppq) position corresponding to a specific project time in seconds.
---@param take MediaItem_Take
---@param projtime number
---@return number 
function reaper.MIDI_GetPPQPosFromProjTime(take, projtime) end

---Returns the project time in quarter notes corresponding to a specific MIDI tick (ppq) position.
---@param take MediaItem_Take
---@param ppqpos number
---@return number 
function reaper.MIDI_GetProjQNFromPPQPos(take, ppqpos) end

---Returns the project time in seconds corresponding to a specific MIDI tick (ppq) position.
---@param take MediaItem_Take
---@param ppqpos number
---@return number 
function reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos) end

---Get the active scale in the media source, if any. root 0=C, 1=C#, etc. scale &amp;0x1=root, &amp;0x2=minor 2nd, &amp;0x4=major 2nd, &amp;0x8=minor 3rd, &amp;0xF=fourth, etc.
---@param take MediaItem_Take
---@param root number
---@param scale number
---@param name string
---@return boolean retval, number root, number scale, string name
function reaper.MIDI_GetScale(take, root, scale, name) end

---Get MIDI meta-event properties. Allowable types are -1:sysex (msg should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation event. For all other meta-messages, type is returned as -2 and msg returned as all zeroes. See [MIDI\_GetEvt](#MIDI_GetEvt).
---@param take MediaItem_Take
---@param textsyxevtidx integer
---@param boolean optional
---@param boolean optional
---@param number optional
---@param number optional
---@param string optional
---@return boolean retval, optional boolean, optional boolean, optional number, optional number, optional string
function reaper.MIDI_GetTextSysexEvt(take, textsyxevtidx, boolean, boolean, number, number, string) end

---Get a string that only changes when the MIDI data changes. If notesonly==true, then the string changes only when the MIDI notes change. See [MIDI\_GetHash](#MIDI_GetHash)
---@param track MediaTrack
---@param notesonly boolean
---@param hash string
---@return boolean retval, string hash
function reaper.MIDI_GetTrackHash(track, notesonly, hash) end

---Insert a new MIDI CC event.
---@param take MediaItem_Take
---@param selected boolean
---@param muted boolean
---@param ppqpos number
---@param chanmsg integer
---@param chan integer
---@param msg2 integer
---@param msg3 integer
---@return boolean 
function reaper.MIDI_InsertCC(take, selected, muted, ppqpos, chanmsg, chan, msg2, msg3) end

---Insert a new MIDI event.
---@param take MediaItem_Take
---@param selected boolean
---@param muted boolean
---@param ppqpos number
---@param bytestr string
---@return boolean 
function reaper.MIDI_InsertEvt(take, selected, muted, ppqpos, bytestr) end

---Insert a new MIDI note. Set noSort if inserting multiple events, then call MIDI_Sort when done.
---@param take MediaItem_Take
---@param selected boolean
---@param muted boolean
---@param startppqpos number
---@param endppqpos number
---@param chan integer
---@param pitch integer
---@param vel integer
---@param boolean optional
---@return boolean 
function reaper.MIDI_InsertNote(take, selected, muted, startppqpos, endppqpos, chan, pitch, vel, boolean) end

---Insert a new MIDI text or sysex event. Allowable types are -1:sysex (msg should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation event.
---@param take MediaItem_Take
---@param selected boolean
---@param muted boolean
---@param ppqpos number
---@param type integer
---@param bytestr string
---@return boolean 
function reaper.MIDI_InsertTextSysexEvt(take, selected, muted, ppqpos, type, bytestr) end

---Reset all MIDI devices
function reaper.midi_reinit() end

---Select or deselect all MIDI content.
---@param take MediaItem_Take
---@param select boolean
function reaper.MIDI_SelectAll(take, select) end

---Set all MIDI data. MIDI buffer is passed in as a list of { int offset, char flag, int msglen, unsigned char msg[] }.    offset: MIDI ticks from previous event
---    flag: &1=selected &2=muted
---    flag high 4 bits for CC shape: &16=linear, &32=slow start/end, &16|32=fast start, &64=fast end, &64|16=bezier
---    msg: the MIDI message.
---    
---A meta-event of type 0xF followed by 'CCBZ ' and 5 more bytes represents bezier curve data for the previous MIDI event: 1 byte for the bezier type (usually 0) and 4 bytes for the bezier tension as a float.
---For tick intervals longer than a 32 bit word can represent, zero-length meta events may be placed between valid events.See [MIDI\_GetAllEvts](#MIDI_GetAllEvts).
---@param take MediaItem_Take
---@param buf string
---@return boolean 
function reaper.MIDI_SetAllEvts(take, buf) end

---Set MIDI CC event properties. Properties passed as NULL will not be set. set noSort if setting multiple events, then call MIDI_Sort when done.
---@param take MediaItem_Take
---@param ccidx integer
---@param boolean optional
---@param boolean optional
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param boolean optional
---@return boolean 
function reaper.MIDI_SetCC(take, ccidx, boolean, boolean, number, number, number, number, number, boolean) end

---Set CC shape and bezier tension. set noSort if setting multiple events, then call MIDI_Sort when done. See [MIDI\_SetCC](#MIDI_SetCC), [MIDI\_GetCCShape](#MIDI_GetCCShape)
---@param reaper boolean
---@param take MediaItem_Take
---@param ccidx integer
---@param shape integer
---@param beztension number
---@param boolean optional
function reaper.MIDI_SetCCShape(reaper, take, ccidx, shape, beztension, boolean) end

---Set MIDI event properties. Properties passed as NULL will not be set. set noSort if setting multiple events, then call MIDI_Sort when done.
---@param take MediaItem_Take
---@param evtidx integer
---@param boolean optional
---@param boolean optional
---@param number optional
---@param string optional
---@param boolean optional
---@return boolean 
function reaper.MIDI_SetEvt(take, evtidx, boolean, boolean, number, string, boolean) end

---Set the start/end positions of a media item that contains a MIDI take.
---@param item MediaItem
---@param startQN number
---@param endQN number
---@return boolean 
function reaper.MIDI_SetItemExtents(item, startQN, endQN) end

---Set MIDI note properties. Properties passed as NULL (or negative values) will not be set. Set noSort if setting multiple events, then call MIDI_Sort when done. Setting multiple note start positions at once is done more safely by deleting and re-inserting the notes.
---@param take MediaItem_Take
---@param noteidx integer
---@param boolean optional
---@param boolean optional
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param boolean optional
---@return boolean 
function reaper.MIDI_SetNote(take, noteidx, boolean, boolean, number, number, number, number, number, boolean) end

---Set MIDI text or sysex event properties. Properties passed as NULL will not be set. Allowable types are -1:sysex (msg should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation event. set noSort if setting multiple events, then call MIDI_Sort when done.
---@param take MediaItem_Take
---@param textsyxevtidx integer
---@param boolean optional
---@param boolean optional
---@param number optional
---@param number optional
---@param string optional
---@param boolean optional
---@return boolean 
function reaper.MIDI_SetTextSysexEvt(take, textsyxevtidx, boolean, boolean, number, number, string, boolean) end

---Sort MIDI events after multiple calls to MIDI_SetNote, MIDI_SetCC, etc.
---@param take MediaItem_Take
function reaper.MIDI_Sort(take) end

---get a pointer to the focused MIDI editor window
---see [MIDIEditor\_GetMode](#MIDIEditor_GetMode), [MIDIEditor\_OnCommand](#MIDIEditor_OnCommand)
---@return HWND 
function reaper.MIDIEditor_GetActive() end

---get the mode of a MIDI editor (0=piano roll, 1=event list, -1=invalid editor)
---see [MIDIEditor\_GetActive](#MIDIEditor_GetActive), [MIDIEditor\_OnCommand](#MIDIEditor_OnCommand)
---@param midieditor HWND
---@return integer 
function reaper.MIDIEditor_GetMode(midieditor) end

---Get settings from a MIDI editor. setting_desc can be:
---    snap\_enabled: returns 0 or 1
---    active\_note\_row: returns 0-127
---    last\_clicked\_cc\_lane: 
---        returns 0-127=CC, 
---                0x100|(0-31)=14-bit CC, 
---                0x200=velocity, 
---                0x201=pitch, 
---                0x202=program, 
---                0x203=channel pressure, 
---                0x204=bank/program select, 
---                0x205=text, 
---                0x206=sysex, 
---                0x207=off velocity, 
---                0x208=notation events, 
---                0x210=media item lane
---    default\_note\_vel: returns 0-127
---    default\_note\_chan: returns 0-15
---    default\_note\_len: returns default length in MIDI ticks
---    scale\_enabled: returns 0-1
---    scale\_root: returns 0-12 (0=C)
---    if setting\_desc is unsupported, the function returns -1.
---    See [MIDIEditor\_SetSetting\_int](#MIDIEditor_SetSetting_int), [MIDIEditor\_GetActive](#MIDIEditor_GetActive), [MIDIEditor\_GetSetting\_str](#MIDIEditor_GetSetting_str)
---@param midieditor HWND
---@param setting_desc string
---@return integer 
function reaper.MIDIEditor_GetSetting_int(midieditor, setting_desc) end

---Get settings from a MIDI editor. setting\_desc can be:
---last\_clicked\_cc\_lane: returns text description ("velocity", "pitch", etc)
---scale: returns the scale record, for example "102034050607" for a major scale
---if setting\_desc is unsupported, the function returns false.
---        
---See [MIDIEditor\_GetActive](#MIDIEditor_GetActive), [MIDIEditor\_GetSetting_int](#MIDIEditor_GetSetting_int)
---@param midieditor HWND
---@param setting_desc string
---@param buf string
---@return boolean retval, string buf
function reaper.MIDIEditor_GetSetting_str(midieditor, setting_desc, buf) end

---get the take that is currently being edited in this MIDI editor
---@param midieditor HWND
---@return MediaItem_Take 
function reaper.MIDIEditor_GetTake(midieditor) end

---Send an action command to the last focused MIDI editor. Returns false if there is no MIDI editor open, or if the view mode (piano roll or event list) does not match the input.
---see [MIDIEditor\_OnCommand](#MIDIEditor_OnCommand)
---@param command_id integer
---@param islistviewcommand boolean
---@return boolean 
function reaper.MIDIEditor_LastFocused_OnCommand(command_id, islistviewcommand) end

---Send an action command to a MIDI editor. Returns false if the supplied MIDI editor pointer is not valid (not an open MIDI editor).
---see [MIDIEditor\_GetActive](#MIDIEditor_GetActive), [MIDIEditor\_LastFocused\_OnCommand](#MIDIEditor_LastFocused_OnCommand)
---@param midieditor HWND
---@param command_id integer
---@return boolean 
function reaper.MIDIEditor_OnCommand(midieditor, command_id) end

---Set settings for a MIDI editor. setting\_desc can be:
---active\_note\_row: 0-127
---See [MIDIEditor\_GetSetting_int](#MIDIEditor_GetSetting_int)
---@param midieditor HWND
---@param setting_desc string
---@param setting integer
---@return boolean retval
function reaper.MIDIEditor_SetSetting_int(midieditor, setting_desc, setting) end

---Converts a double-number to its panstr-equivalent.
---        
---See [parsepanstr](#parsepanstr) for its counterpart. 
---@param strNeed64 string
---@param pan number
---@return string strNeed64
function reaper.mkpanstr(strNeed64, pan) end

---creates a vol-pan-string, which holds a readable representation of the vol and pan-values.The format is like "+6.02db center" or "+inf +80R", etcsee [mkpanstr](#mkpanstr) and [mkvolstr](#mkvolstr) for the individual pan/vol-string functions.
---@param strNeed64 string
---@param vol number
---@param pan number
---@return string strNeed64
function reaper.mkvolpanstr(strNeed64, vol, pan) end

---Converts a volume-value into a string-representation of it as dB.Note: Unlike panstr, there is no parsevolstr-string-function available!
---@param strNeed64 string
---@param vol number
---@return string strNeed64
function reaper.mkvolstr(strNeed64, vol) end

---Moves the Edit Cursor.
---@param adjamt number
---@param dosel boolean
function reaper.MoveEditCursor(adjamt, dosel) end

---Moves a MediaItem-object to a specific MediaTrack.Call [UpdateArrange](#UpdateArrange) to update the arrangeview after that.
---@param item MediaItem
---@param desttr MediaTrack
---@return boolean 
function reaper.MoveMediaItemToTrack(item, desttr) end

---Mutes all tracks
---@param mute boolean
function reaper.MuteAllTracks(mute) end

---With r.??? and sr.??? parameters, you can define coordinates of a rectangle. 
---The function will return the left/top/right/bottom coordinates of the viewport that that rectangle is on/closest to.            
---@param r number
---@param r number
---@param r number
---@param r number
---@param sr number
---@param sr number
---@param sr number
---@param sr number
---@param wantWorkArea boolean
---@return integer left, integer top, integer right, integer bottom
function reaper.my_getViewport(r, r, r, r, sr, sr, sr, sr, wantWorkArea) end

---Get the command ID number for named command that was registered by an extension such as "\_SWS\_ABOUT" or "\_113088d11ae641c193a2b7ede3041ad5" for a ReaScript or a custom action.see [Main\_OnCommand](#Main_OnCommand) for executing actions with command-ID-numbers.
---@param command_name string
---@return integer 
function reaper.NamedCommandLookup(command_name) end

---Toggles pause/play during play or pause/rec during recording in the current project.
---When stopped, it will start paused play.
function reaper.OnPauseButton() end

---Toggles pause/play during play or pause/rec during recording in a specific project.
---When stopped, it will start paused play.
---@param proj ReaProject
function reaper.OnPauseButtonEx(proj) end

---Starts playing at edit-cursor. Will stop recording, when executed during recording.
function reaper.OnPlayButton() end

---Starts playing at edit-cursor. Will stop recording, when executed during recording.
---@param proj ReaProject
function reaper.OnPlayButtonEx(proj) end

---Stops playing/recording.
function reaper.OnStopButton() end

---Stops playing/recording.
---@param proj ReaProject
function reaper.OnStopButtonEx(proj) end

---Open a different installed theme.
---@param fn string
---@return boolean retval
function reaper.OpenColorThemeFile(fn) end

---Opens mediafn in the Media Explorer.If you just want to change folder in MediaExplorer, give it a path instead of a file and set play to false.
---@param mediafn string
---@param play boolean
---@return HWND 
function reaper.OpenMediaExplorer(mediafn, play) end

---Send an OSC message directly to REAPER. The value argument may be NULL. The message will be matched against the default OSC patterns. Only supported if control surface support was enabled when installing REAPER.This is not broadcast outside of Reaper, so you can't control devices, plugins, etc with it!Messages sent via this function can be used for parameter-learn/modulation and as shortcuts for scripts.
---The parameter valueIn can be retrieved with the returnvalue val of the function reaper.get_action_context, so sending values to a script is possible that way.
---@param message string
---@param number optional
function reaper.OscLocalMessageToHost(message, number) end

---Parse hh:mm:ss.sss time string, return time in seconds (or 0.0 on error). See [parse\_timestr_pos](#parse_timestr_pos), [parse\_timestr_len](#parse_timestr_len).
---@param buf string
---@return number timestr
function reaper.parse_timestr(buf) end

---Converts a time-string in its time-in-seconds-representation
---        
---time formatting mode overrides: -1=proj default.
---0, time
---1, measures.beats + time
---2, measures.beats
---3, seconds
---4, samples
---5, h:m:s:f
---@param buf string
---@param offset number
---@param modeoverride integer
---@return number 
function reaper.parse_timestr_len(buf, offset, modeoverride) end

---Parse time string and convert it into seconds.
---@param buf string
---@param modeoverride integer
---@return number 
function reaper.parse_timestr_pos(buf, modeoverride) end

---Converts a string created by [mkpanstr](#mkpanstr) back to it's double-number.
---@param str string
---@return number retval
function reaper.parsepanstr(str) end

---enumerates the available PCM-sink-formats, which means, the output-formats available in Reaper
---@param idx integer
---@return integer retval, string descstr
function reaper.PCM_Sink_Enum(idx) end

---allows you to retrieve the file-extension of a certain PCM-sink/fileformat available.See [PCM\_Sink\_Enum](#PCM_Sink_Enum) to enumerate available PCM-sink/fileformats.
---@param data string
---@return string 
function reaper.PCM_Sink_GetExtension(data) end

---@param cfg string
---@param hwndParent HWND
---@return HWND 
function reaper.PCM_Sink_ShowConfig(cfg, hwndParent) end

---See [PCM\_Source\_CreateFromFileEx](#PCM_Source_CreateFromFileEx).
---@param filename string
---@return PCM_source 
function reaper.PCM_Source_CreateFromFile(filename) end

---Create a PCM_source from filename, and override pref of MIDI files being imported as in-project MIDI events.
---@param filename string
---@param forcenoMidiImp boolean
---@return PCM_source 
function reaper.PCM_Source_CreateFromFileEx(filename, forcenoMidiImp) end

---Create a PCM_source from a "type" (use this if you're going to load its state via LoadState/ProjectStateContext).
---Valid types include "WAVE", "MIDI", or whatever plug-ins define as well.
---@param sourcetype string
---@return PCM_source 
function reaper.PCM_Source_CreateFromType(sourcetype) end

---Deletes a PCM_source -- be sure that you remove any project reference before deleting a source
---@param src PCM_source
function reaper.PCM_Source_Destroy(src) end

---Gets block of peak samples to buf. Note that the peak samples are interleaved, but in two or three blocks (maximums, then minimums, then extra). 
---Return value has 20 bits of returned sample count, then 4 bits of output_mode (0xf00000), then a bit to signify whether extra_type was available (0x1000000). 
---extra_type can be 115 ('s') for spectral information, which will return peak samples as integers with the low 15 bits frequency, next 14 bits tonality.
---@param src PCM_source
---@param peakrate number
---@param starttime number
---@param numchannels integer
---@param numsamplesperchannel integer
---@param want_extra_type integer
---@param buf array
---@return integer 
function reaper.PCM_Source_GetPeaks(src, peakrate, starttime, numchannels, numsamplesperchannel, want_extra_type, buf) end

---If a section/reverse block, retrieves offset/len/reverse. return true if success
---@param src PCM_source
---@return boolean retval, number offs, number len, boolean rev
function reaper.PCM_Source_GetSectionInfo(src) end

---@param amt integer
function reaper.PluginWantsAlwaysRunFx(amt) end

---adds prevent_count to the UI refresh prevention state; always add then remove the same amount, or major disfunction will occur
---@param prevent_count integer
function reaper.PreventUIRefresh(prevent_count) end

---Opens the actionlist and allows you to get, which action the user selected.So the user can select numerous actions, and when they hit the select or select/close-button, you can get the actions selected.To start a new session, pass 1 as parameter session_mode.After that, repeatedly call the function with session_mode=0, which will return the selected actions.
---        - -1, the actionlist is closed
---        - 0, no action has been selected
---        - any other number, this action has been selected.
---In the latter case, call the function until it returns 0 again to get all selected actions.If you're finished, call the function with session_mode=-1
---When finished, call with session_mode=-1.
---@param session_mode integer
---@param init_id integer
---@param section_id integer
---@return integer retval
function reaper.PromptForAction(session_mode, init_id, section_id) end

---Causes REAPER to display the error message after the current ReaScript finishes. When Reaper's IDE is open, it will display it at the bottom of the IDE.
---@param errmsg string
function reaper.ReaScriptError(errmsg) end

---Creates a new directory. You can recursivly create directories, means: if the higher directories don't exist, the will also be automatically created.returns positive value on success, 0 on failure.
---@param path string
---@param ignored integer
---@return integer 
function reaper.RecursiveCreateDirectory(path, ignored) end

---garbage-collects extra open files and closes them. if flags has 1 set, this is done incrementally (call this from a regular timer, if desired). if flags has 2 set, files are aggressively closed (they may need to be re-opened very soon). returns number of files closed by this call.
---@param reaper integer
---@param flags integer
function reaper.reduce_open_files(reaper, flags) end

---Refreshes the toolbar-buttons, associated with a specific command_id/action
---See [RefreshToolbar2](#RefreshToolbar2).
---@param command_id integer
function reaper.RefreshToolbar(command_id) end

---Refreshes the toolbar-buttons, associated with a specific command_id/action within a certain section
---@param section_id integer
---@param command_id integer
function reaper.RefreshToolbar2(section_id, command_id) end

---Makes a filename "in" relative to the current project, if any.
---@param in_ string
---@param out string
---@return string out
function reaper.relative_fn(in_, out) end

---Remove a send/receive/hardware output. See [CreateTrackSend](#CreateTrackSend), [GetSetTrackSendInfo](#GetSetTrackSendInfo), [GetTrackSendInfo\_Value](#GetTrackSendInfo_Value), [SetTrackSendInfo\_Value](#SetTrackSendInfo_Value), [GetTrackNumSends](#GetTrackNumSends).For ReaRoute-users: the outputs are hardware outputs, but with 512 added to the destination channel index (512 is the first rearoute channel, 513 the second, etc).
---@param tr MediaTrack
---@param category integer
---@param sendidx integer
---@return boolean 
function reaper.RemoveTrackSend(tr, category, sendidx) end

---Not available while playing back.
---@param source_filename string
---@param target_filename string
---@param start_percent number
---@param end_percent number
---@param playrate number
---@return boolean 
function reaper.RenderFileSection(source_filename, target_filename, start_percent, end_percent, playrate) end

---Moves all selected tracks to immediately above track specified by index beforeTrackIdx, returns false if no tracks were selected. 
---makePrevFolder=0 for normal, 
---   1 = as child of track preceding track specified by beforeTrackIdx, 
---   2 = if track preceding track specified by beforeTrackIdx is last track in folder, extend folder
---@param beforeTrackIdx integer
---@param makePrevFolder integer
---@return boolean retval
function reaper.ReorderSelectedTracks(beforeTrackIdx, makePrevFolder) end

---@param mode integer
---@return string 
function reaper.Resample_EnumModes(mode) end

---See [resolve\_fn2](#resolve_fn2).
---@param in_ string
---@param out string
---@return string out
function reaper.resolve_fn(in_, out) end

---Resolves a filename "in" by using project settings etc. If no file found, out will be a copy of in.
---@param in_ string
---@param out string
---@param string optional
---@return string out
function reaper.resolve_fn2(in_, out, string) end

---Get the named command for the given command ID. The returned string will not start with '_' (e.g. it will return "SWS_ABOUT"), it will be NULL if command_id is a native action.
---@param command_id integer
---@return string 
function reaper.ReverseNamedCommandLookup(command_id) end

---See [GetEnvelopeScalingMode](#GetEnvelopeScalingMode).
---@param scaling_mode integer
---@param val number
---@return number 
function reaper.ScaleFromEnvelopeMode(scaling_mode, val) end

---See [GetEnvelopeScalingMode](#GetEnvelopeScalingMode).
---@param scaling_mode integer
---@param val number
---@return number 
function reaper.ScaleToEnvelopeMode(scaling_mode, val) end

---Selects or deselects all MediaItems in a project.
---@param proj ReaProject
---@param selected boolean
function reaper.SelectAllMediaItems(proj, selected) end

---Switch to another opened project/projecttab.
---@param proj ReaProject
function reaper.SelectProjectInstance(proj) end

---set this take active in this media item
---@param take MediaItem_Take
function reaper.SetActiveTake(take) end

---Sets all or selected tracks to mode.Includes the master-track.
---@param mode integer
---@param onlySel boolean
function reaper.SetAutomationMode(mode, onlySel) end

---set current BPM in project, set wantUndo=true to add undo point
---@param proj ReaProject
---@param bpm number
---@param wantUndo boolean
function reaper.SetCurrentBPM(proj, bpm, wantUndo) end

---Change the focus for the cursor.
---You must use this to change the focus for the cursor programmatically. mode=0 to focus track panels, 1 to focus the arrange window, 2 to focus the arrange window and select env (or envIn==NULL to clear the current track/take envelope selection)
---@param mode integer
---@param envIn TrackEnvelope
function reaper.SetCursorContext(mode, envIn) end

---Change the position of the edit-cursor in the current project.
---@param time number
---@param moveview boolean
---@param seekplay boolean
function reaper.SetEditCurPos(time, moveview, seekplay) end

---Change the position of the edit-cursor in a specific project.       
---@param proj ReaProject
---@param time number
---@param moveview boolean
---@param seekplay boolean
function reaper.SetEditCurPos2(proj, time, moveview, seekplay) end

---Set attributes of an envelope point. Values that are not supplied will be ignored. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done. See [SetEnvelopePointEx](#SetEnvelopePointEx).
---@param envelope TrackEnvelope
---@param ptidx integer
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param boolean optional
---@param boolean optional
---@return boolean 
function reaper.SetEnvelopePoint(envelope, ptidx, number, number, number, number, boolean, boolean) end

---Set attributes of an envelope point. Values that are not supplied will be ignored. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done.
---autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
---For automation items, pass autoitem\_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
---even if the automation item is trimmed so that not all points are visible.
---Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.
---See [CountEnvelopePointsEx](#CountEnvelopePointsEx), [GetEnvelopePointEx](#GetEnvelopePointEx), [InsertEnvelopePointEx](#InsertEnvelopePointEx), [DeleteEnvelopePointEx](#DeleteEnvelopePointEx).
---@param envelope TrackEnvelope
---@param autoitem_idx integer
---@param ptidx integer
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param boolean optional
---@param boolean optional
---@return boolean 
function reaper.SetEnvelopePointEx(envelope, autoitem_idx, ptidx, number, number, number, number, boolean, boolean) end

---Sets the RPPXML state of an envelope, returns true if successful. 
---@param env TrackEnvelope
---@param str string
---@param isundo boolean
---@return boolean 
function reaper.SetEnvelopeStateChunk(env, str, isundo) end

---Set the extended state value for a specific section and key. Persistant states are stored into the reaper-extstate.ini in the resources-folder.See [GetExtState](#GetExtState), [DeleteExtState](#DeleteExtState), [HasExtState](#HasExtState).
---@param section string
---@param key string
---@param value string
---@param persist boolean
function reaper.SetExtState(section, key, value, persist) end

---mode: see [GetGlobalAutomationOverride](GetGlobalAutomationOverride)
---@param mode integer
function reaper.SetGlobalAutomationOverride(mode) end

---Sets the RPPXML state of an item, returns true if successful. Undo flag is a performance/caching hint.
---@param item MediaItem
---@param str string
---@param isundo boolean
---@return boolean 
function reaper.SetItemStateChunk(item, str, isundo) end

---set &amp;1 to show the master track in the TCP, &amp;2 to show in the mixer. Returns the previous visibility state. See [GetMasterTrackVisibility](#GetMasterTrackVisibility).
---@param flag integer
---@return integer 
function reaper.SetMasterTrackVisibility(flag) end

---Set media item numerical-value attributes.
---B_MUTE : bool * : muted
---B_MUTE_ACTUAL : bool * : muted (ignores solo). setting this value will not affect C_MUTE_SOLO.
---C_MUTE_SOLO : char * : solo override (-1=soloed, 0=no override, 1=unsoloed). note that this API does not automatically unsolo other items when soloing (nor clear the unsolos when clearing the last soloed item), it must be done by the caller via action or via this API.
---B_LOOPSRC : bool * : loop source
---B_ALLTAKESPLAY : bool * : all takes play
---B_UISEL : bool * : selected in arrange view
---C_BEATATTACHMODE : char * : item timebase, -1=track or project default, 1=beats (position, length, rate), 2=beats (position only). for auto-stretch timebase: C_BEATATTACHMODE=1, C_AUTOSTRETCH=1
---C_AUTOSTRETCH: : char * : auto-stretch at project tempo changes, 1=enabled, requires C_BEATATTACHMODE=1
---C_LOCK : char * : locked, &1=locked
---D_VOL : double * : item volume, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
---D_POSITION : double * : item position in seconds
---D_LENGTH : double * : item length in seconds
---D_SNAPOFFSET : double * : item snap offset in seconds
---D_FADEINLEN : double * : item manual fadein length in seconds
---D_FADEOUTLEN : double * : item manual fadeout length in seconds
---D_FADEINDIR : double * : item fadein curvature, -1..1
---D_FADEOUTDIR : double * : item fadeout curvature, -1..1
---D_FADEINLEN_AUTO : double * : item auto-fadein length in seconds, -1=no auto-fadein
---D_FADEOUTLEN_AUTO : double * : item auto-fadeout length in seconds, -1=no auto-fadeout
---C_FADEINSHAPE : int * : fadein shape, 0..6, 0=linear
---C_FADEOUTSHAPE : int * : fadeout shape, 0..6, 0=linear
---I_GROUPID : int * : group ID, 0=no group
---I_LASTY : int * : Y-position of track in pixels (read-only)
---I_LASTH : int * : height in track in pixels (read-only)
---I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x100000 (i.e. ColorToNative(r,g,b)|0x100000). If you do not |0x100000, then it will not be used, but will store the color.
---I_CURTAKE : int * : active take number
---IP_ITEMNUMBER : int, item number on this track (read-only, returns the item number directly)
---F_FREEMODE_Y : float * : free item positioning Y-position, 0=top of track, 1=bottom of track (will never be 1)
---F_FREEMODE_H : float * : free item positioning height, 0=no height, 1=full height of track (will never be 0)
---@param item MediaItem
---@param parmname string
---@param newvalue number
---@return boolean 
function reaper.SetMediaItemInfo_Value(item, parmname, newvalue) end

---Redraws the screen only if refreshUI == true.
---See [UpdateArrange](#UpdateArrange)().
---@param item MediaItem
---@param length number
---@param refreshUI boolean
---@return boolean 
function reaper.SetMediaItemLength(item, length, refreshUI) end

---Redraws the screen only if refreshUI == true.
---See [UpdateArrange](#UpdateArrange)().
---@param item MediaItem
---@param position number
---@param refreshUI boolean
---@return boolean 
function reaper.SetMediaItemPosition(item, position, refreshUI) end

---@param item MediaItem
---@param selected boolean
function reaper.SetMediaItemSelected(item, selected) end

---Set media source of media item take. The old source will not be destroyed, it is the caller's responsibility to retrieve it and destroy it after. If source already exists in any project, it will be duplicated before being set. C/C++ code should not use this and instead use GetSetMediaItemTakeInfo() with P_SOURCE to manage ownership directly.
---@param take MediaItem_Take
---@param source PCM_source
---@return boolean 
function reaper.SetMediaItemTake_Source(take, source) end

---Set media item take numerical-value attributes.
---D_STARTOFFS : double * : start offset in source media, in seconds
---D_VOL : double * : take volume, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc, negative if take polarity is flipped
---D_PAN : double * : take pan, -1..1
---D_PANLAW : double * : take pan law, -1=default, 0.5=-6dB, 1.0=+0dB, etc
---D_PLAYRATE : double * : take playback rate, 0.5=half speed, 1=normal, 2=double speed, etc
---D_PITCH : double * : take pitch adjustment in semitones, -12=one octave down, 0=normal, +12=one octave up, etc
---B_PPITCH : bool * : preserve pitch when changing playback rate
---I_CHANMODE : int * : channel mode, 0=normal, 1=reverse stereo, 2=downmix, 3=left, 4=right
---I_PITCHMODE : int * : pitch shifter mode, -1=projext default, otherwise high 2 bytes=shifter, low 2 bytes=parameter
---I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x100000 (i.e. ColorToNative(r,g,b)|0x100000). If you do not |0x100000, then it will not be used, but will store the color.
---IP_TAKENUMBER : int : take number (read-only, returns the take number directly)
---@param take MediaItem_Take
---@param parmname string
---@param newvalue number
---@return boolean 
function reaper.SetMediaItemTakeInfo_Value(take, parmname, newvalue) end

---Set track numerical-value attributes.
---B_MUTE : bool * : muted
---B_PHASE : bool * : track phase inverted
---IP_TRACKNUMBER : int : track number 1-based, 0=not found, -1=master track (read-only, returns the int directly)
---I_SOLO : int * : soloed, 0=not soloed, 1=soloed, 2=soloed in place, 5=safe soloed, 6=safe soloed in place
---I_FXEN : int * : fx enabled, 0=bypassed, !0=fx active
---I_RECARM : int * : record armed, 0=not record armed, 1=record armed
---I_RECINPUT : int * : record input, &lt;0=no input. if 4096 set, input is MIDI and low 5 bits represent channel (0=all, 1-16=only chan), next 6 bits represent physical input (63=all, 62=VKB). If 4096 is not set, low 10 bits (0..1023) are input start channel (ReaRoute/Loopback start at 512). If 2048 is set, input is multichannel input (using track channel count), or if 1024 is set, input is stereo input, otherwise input is mono.
---I_RECMODE : int * : record mode, 0=input, 1=stereo out, 2=none, 3=stereo out w/latency compensation, 4=midi output, 5=mono out, 6=mono out w/ latency compensation, 7=midi overdub, 8=midi replace
---I_RECMON : int * : record monitoring, 0=off, 1=normal, 2=not when playing (tape style)
---I_RECMONITEMS : int * : monitor items while recording, 0=off, 1=on
---I_AUTOMODE : int * : track automation mode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch
---I_NCHAN : int * : number of track channels, 2-64, even numbers only
---I_SELECTED : int * : track selected, 0=unselected, 1=selected
---I_WNDH : int * : current TCP window height in pixels including envelopes (read-only)
---I_TCPH : int * : current TCP window height in pixels not including envelopes (read-only)
---I_TCPY : int * : current TCP window Y-position in pixels relative to top of arrange view (read-only)
---I_MCPX : int * : current MCP X-position in pixels relative to mixer container
---I_MCPY : int * : current MCP Y-position in pixels relative to mixer container
---I_MCPW : int * : current MCP width in pixels
---I_MCPH : int * : current MCP height in pixels
---I_FOLDERDEPTH : int * : folder depth change, 0=normal, 1=track is a folder parent, -1=track is the last in the innermost folder, -2=track is the last in the innermost and next-innermost folders, etc
---I_FOLDERCOMPACT : int * : folder compacted state (only valid on folders), 0=normal, 1=small, 2=tiny children
---I_MIDIHWOUT : int * : track midi hardware output index, &lt;0=disabled, low 5 bits are which channels (0=all, 1-16), next 5 bits are output device index (0-31)
---I_PERFFLAGS : int * : track performance flags, &1=no media buffering, &2=no anticipative FX
---I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x100000 (i.e. ColorToNative(r,g,b)|0x100000). If you do not |0x100000, then it will not be used, but will store the color
---I_HEIGHTOVERRIDE : int * : custom height override for TCP window, 0 for none, otherwise size in pixels
---B_HEIGHTLOCK : bool * : track height lock (must set I_HEIGHTOVERRIDE before locking)
---D_VOL : double * : trim volume of track, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
---D_PAN : double * : trim pan of track, -1..1
---D_WIDTH : double * : width of track, -1..1
---D_DUALPANL : double * : dualpan position 1, -1..1, only if I_PANMODE==6
---D_DUALPANR : double * : dualpan position 2, -1..1, only if I_PANMODE==6
---I_PANMODE : int * : pan mode, 0=classic 3.x, 3=new balance, 5=stereo pan, 6=dual pan
---D_PANLAW : double * : pan law of track, &lt;0=project default, 1=+0dB, etc
---P_ENV:&lt;envchunkname : TrackEnvelope*, read only. Call with :&lt;VOLENV, :&lt;PANENV, etc appended.
---B_SHOWINMIXER : bool * : track control panel visible in mixer (do not use on master track)
---B_SHOWINTCP : bool * : track control panel visible in arrange view (do not use on master track)
---B_MAINSEND : bool * : track sends audio to parent
---C_MAINSEND_OFFS : char * : channel offset of track send to parent
---B_FREEMODE : bool * : track free item positioning enabled (call UpdateTimeline() after changing)
---C_BEATATTACHMODE : char * : track timebase, -1=project default, 0=time, 1=beats (position, length, rate), 2=beats (position only)
---F_MCP_FXSEND_SCALE : float * : scale of fx+send area in MCP (0=minimum allowed, 1=maximum allowed)
---F_MCP_FXPARM_SCALE : float * : scale of fx parameter area in MCP (0=minimum allowed, 1=maximum allowed)
---F_MCP_SENDRGN_SCALE : float * : scale of send area as proportion of the fx+send total area (0=minimum allowed, 1=maximum allowed)
---F_TCP_FXPARM_SCALE : float * : scale of TCP parameter area when TCP FX are embedded (0=min allowed, default, 1=max allowed)
---I_PLAY_OFFSET_FLAG : int * : track playback offset state, &1=bypassed, &2=offset value is measured in samples (otherwise measured in seconds)
---D_PLAY_OFFSET : double * : track playback offset, units depend on I_PLAY_OFFSET_FLAG
---@param tr MediaTrack
---@param parmname string
---@param newvalue number
---@return boolean 
function reaper.SetMediaTrackInfo_Value(tr, parmname, newvalue) end

---Set the MIDI editor grid division. 0.25=quarter note, 1.0/3.0=half note tripet, etc.
---@param project ReaProject
---@param division number
function reaper.SetMIDIEditorGrid(project, division) end

---Scroll the mixer so that leftmosttrack is the leftmost visible track. Returns the leftmost track after scrolling, which may be different from the passed-in track if there are not enough tracks to its right.
---@param leftmosttrack MediaTrack
---@return MediaTrack 
function reaper.SetMixerScroll(leftmosttrack) end

---Set the mouse modifier assignment for a specific modifier key assignment, in a specific context.
---Context is a string like "MM_CTX_ITEM". Find these strings by modifying an assignment in 
---Preferences/Editing/Mouse Modifiers, then looking in reaper-mouse.ini.
---Modifier flag is a number from 0 to 15: add 1 for shift, 2 for control, 4 for alt, 8 for win.
---(macOS: add 1 for shift, 2 for command, 4 for opt, 8 for control.)
---For left-click and double-click contexts, the action can be any built-in command ID number
---or any custom action ID string. Find built-in command IDs in the REAPER actions window
---(enable "show action IDs" in the context menu), and find custom action ID strings in reaper-kb.ini.
---For built-in mouse modifier behaviors, find action IDs (which will be low numbers)
---by modifying an assignment in Preferences/Editing/Mouse Modifiers, then looking in reaper-mouse.ini.
---Assigning an action of -1 will reset that mouse modifier behavior to factory default.
---See [GetMouseModifier](#GetMouseModifier).
---@param context string
---@param modifier_flag integer
---@param action string
function reaper.SetMouseModifier(context, modifier_flag, action) end

---Set exactly one track selected, deselect all others.
---			
---			This sets the track as Last-Touched-Track as well.
---@param track MediaTrack
function reaper.SetOnlyTrackSelected(track) end

---Set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half note triplet, etc.
---@param project ReaProject
---@param division number
function reaper.SetProjectGrid(project, division) end

---Sets/alters an existing project-marker
---@param markrgnindexnumber integer
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param name string
---@return boolean 
function reaper.SetProjectMarker(markrgnindexnumber, isrgn, pos, rgnend, name) end

---Sets/alters an existing project-marker in a given project.
---@param proj ReaProject
---@param markrgnindexnumber integer
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param name string
---@return boolean 
function reaper.SetProjectMarker2(proj, markrgnindexnumber, isrgn, pos, rgnend, name) end

---Sets/alters an existing project-marker in a given project. Differs from SetProjectMarker2 and SetProjectMarker, that you can set color as well.
---Color should be 0 to not change, or ColorToNative(r,g,b)|0x1000000
---@param proj ReaProject
---@param markrgnindexnumber integer
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param name string
---@param color integer
---@return boolean 
function reaper.SetProjectMarker3(proj, markrgnindexnumber, isrgn, pos, rgnend, name, color) end

---Sets/alters an existing project-marker in a given project.
---color should be 0 to not change, or ColorToNative(r,g,b)|0x1000000, flags&amp;1 to clear name
---@param proj ReaProject
---@param markrgnindexnumber integer
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param name string
---@param color integer
---@param flags integer
---@return boolean 
function reaper.SetProjectMarker4(proj, markrgnindexnumber, isrgn, pos, rgnend, name, color, flags) end

---See [SetProjectMarkerByIndex2](#SetProjectMarkerByIndex2).
---@param proj ReaProject
---@param markrgnidx integer
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param IDnumber integer
---@param name string
---@param color integer
---@return boolean 
function reaper.SetProjectMarkerByIndex(proj, markrgnidx, isrgn, pos, rgnend, IDnumber, name, color) end

---Differs from SetProjectMarker4 in that markrgnidx is 0 for the first marker/region, 1 for the next, etc (see [EnumProjectMarkers3](#EnumProjectMarkers3)), rather than representing the displayed marker/region ID number (see [SetProjectMarker3](#SetProjectMarker3)). Function will fail if attempting to set a duplicate ID number for a region (duplicate ID numbers for markers are OK). , flags&amp;1 to clear name.
---@param proj ReaProject
---@param markrgnidx integer
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param IDnumber integer
---@param name string
---@param color integer
---@param flags integer
---@return boolean 
function reaper.SetProjectMarkerByIndex2(proj, markrgnidx, isrgn, pos, rgnend, IDnumber, name, color, flags) end

---Save a key/value pair for a specific extension, to be restored the next time this specific project is loaded. Typically extname will be the name of a reascript or extension section. If key is NULL or "", all extended data for that extname will be deleted. If val is NULL or "", the data previously associated with that key will be deleted. Returns the size of the state for this extname. See [GetProjExtState](#GetProjExtState), [EnumProjExtState](#EnumProjExtState).
---@param proj ReaProject
---@param extname string
---@param key string
---@param value string
---@return integer 
function reaper.SetProjExtState(proj, extname, key, value) end

---Add (addorremove &gt; 0) or remove (addorremove &gt; 0) a track from this region when using the region render matrix.
---@param proj ReaProject
---@param regionindex integer
---@param track MediaTrack
---@param addorremove integer
function reaper.SetRegionRenderMatrix(proj, regionindex, track, addorremove) end

---Inserts or updates a take marker. If idx&lt;0, a take marker will be added, otherwise an existing take marker will be updated. Returns the index of the new or updated take marker (which may change if srcPos is updated).
---			
---			When inserting a new takemarker, parameter srcposIn must be given!
---			
---See [GetNumTakeMarkers](#GetNumTakeMarkers)), [GetTakeMarker](#GetTakeMarker) and [DeleteTakeMarker](#DeleteTakeMarker).
---@param take MediaItem_Take
---@param idx integer
---@param nameIn string
---@param number optional
---@param number optional
---@return integer index
function reaper.SetTakeMarker(take, idx, nameIn, number, number) end

---Adds or updates a stretch marker. If idx&gt;0, stretch marker will be added. If idx&gt;=0, stretch marker will be updated. When adding, if srcposInOptional is omitted, source position will be auto-calculated. When updating a stretch marker, if srcposInOptional is omitted, srcpos will not be modified. Position/srcposition values will be constrained to nearby stretch markers. Returns index of stretch marker, or -1 if did not insert (or marker already existed at time).
---@param take MediaItem_Take
---@param idx integer
---@param pos number
---@param number optional
---@return integer 
function reaper.SetTakeStretchMarker(take, idx, pos, number) end

---See [GetTakeStretchMarkerSlope](#GetTakeStretchMarkerSlope)
---@param take MediaItem_Take
---@param idx integer
---@param slope number
---@return boolean 
function reaper.SetTakeStretchMarkerSlope(take, idx, slope) end

---Set parameters of a tempo/time signature marker. Provide either timepos (with measurepos=-1, beatpos=-1), or measurepos and beatpos (with timepos=-1). If timesig\_num and timesig\_denom are zero, the previous time signature will be used. ptidx=-1 will insert a new tempo/time signature marker. See [CountTempoTimeSigMarkers](#CountTempoTimeSigMarkers), [GetTempoTimeSigMarker](#GetTempoTimeSigMarker), [AddTempoTimeSigMarker](#AddTempoTimeSigMarker), [DeleteTempoTimeSigMarker](#DeleteTempoTimeSigMarker).
---@param proj ReaProject
---@param ptidx integer
---@param timepos number
---@param measurepos integer
---@param beatpos number
---@param bpm number
---@param timesig_num integer
---@param timesig_denom integer
---@param lineartempo boolean
---@return boolean 
function reaper.SetTempoTimeSigMarker(proj, ptidx, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo) end

---Temporarily updates the theme color to the color specified (or the theme default color if -1 is specified). Returns -1 on failure, otherwise returns the color (or transformed-color). Note that the UI is not updated by this, the caller should call [UpdateArrange()](#UpdateArrange) etc as necessary. If the low bit of flags is set, any color transformations are bypassed. To read a value see [GetThemeColor](#GetThemeColor). * col_main_bg2 : Main window/transport background 
--- * col_main_text2 : Main window/transport text 
--- * col_main_textshadow : Main window text shadow (ignored if too close to text color) 
--- * col_main_3dhl : Main window 3D highlight 
--- * col_main_3dsh : Main window 3D shadow 
--- * col_main_resize2 : Main window pane resize mouseover 
--- * col_main_text : Window text 
--- * col_main_bg : Window background 
--- * col_main_editbk : Window edit background 
--- * col_transport_editbk : Transport edit background 
--- * col_toolbar_text : Toolbar button text 
--- * col_toolbar_text_on : Toolbar button enabled text 
--- * col_toolbar_frame : Toolbar frame when floating or docked 
--- * toolbararmed_color : Toolbar button armed color 
--- * toolbararmed_drawmode : Toolbar button armed fill mode 
--- * io_text : I/O window text 
--- * io_3dhl : I/O window 3D highlight 
--- * io_3dsh : I/O window 3D shadow 
--- * genlist_bg : Window list background 
--- * genlist_fg : Window list text 
--- * genlist_grid : Window list grid lines 
--- * genlist_selbg : Window list selected row 
--- * genlist_selfg : Window list selected text 
--- * genlist_seliabg : Window list selected row (inactive) 
--- * genlist_seliafg : Window list selected text (inactive) 
--- * genlist_hilite : Window list highlighted text
--- * genlist_hilite_sel : Window list highlighted selected text
--- * col_buttonbg : Button background 
--- * col_tcp_text : Track panel text 
--- * col_tcp_textsel : Track panel (selected) text 
--- * col_seltrack : Selected track control panel background 
--- * col_seltrack2 : Unselected track control panel background (enabled with a checkbox above) 
--- * tcplocked_color : Locked track control panel overlay color 
--- * tcplocked_drawmode : Locked track control panel fill mode 
--- * col_tracklistbg : Empty track list area 
--- * col_mixerbg : Empty mixer list area 
--- * col_arrangebg : Empty arrange view area 
--- * arrange_vgrid : Empty arrange view area vertical grid shading 
--- * col_fadearm : Fader background when automation recording 
--- * col_fadearm2 : Fader background when automation playing 
--- * col_fadearm3 : Fader background when in inactive touch/latch 
--- * col_tl_fg : Timeline foreground 
--- * col_tl_fg2 : Timeline foreground (secondary markings) 
--- * col_tl_bg : Timeline background 
--- * col_tl_bgsel : Time selection color 
--- * timesel_drawmode : Time selection fill mode 
--- * col_tl_bgsel2 : Timeline background (in loop points) 
--- * col_trans_bg : Transport status background 
--- * col_trans_fg : Transport status text 
--- * playrate_edited : Project play rate control when not 1.0 
--- * col_mi_label : Media item label 
--- * col_mi_label_sel : Media item label (selected) 
--- * col_mi_label_float : Floating media item label 
--- * col_mi_label_float_sel : Floating media item label (selected) 
--- * col_mi_bg : Media item background (odd tracks) 
--- * col_mi_bg2 : Media item background (even tracks) 
--- * col_tr1_itembgsel : Media item background selected (odd tracks) 
--- * col_tr2_itembgsel : Media item background selected (even tracks) 
--- * itembg_drawmode : Media item background fill mode 
--- * col_tr1_peaks : Media item peaks (odd tracks) 
--- * col_tr2_peaks : Media item peaks (even tracks) 
--- * col_tr1_ps2 : Media item peaks when selected (odd tracks) 
--- * col_tr2_ps2 : Media item peaks when selected (even tracks) 
--- * col_peaksedge : Media item peaks edge highlight (odd tracks) 
--- * col_peaksedge2 : Media item peaks edge highlight (even tracks) 
--- * col_peaksedgesel : Media item peaks edge highlight when selected (odd tracks) 
--- * col_peaksedgesel2 : Media item peaks edge highlight when selected (even tracks) 
--- * cc_chase_drawmode : Media item MIDI CC peaks fill mode 
--- * col_peaksfade : Media item peaks when active in crossfade editor (fade-out) 
--- * col_peaksfade2 : Media item peaks when active in crossfade editor (fade-in) 
--- * col_mi_fades : Media item fade/volume controls 
--- * fadezone_color : Media item fade quiet zone fill color 
--- * fadezone_drawmode : Media item fade quiet zone fill mode 
--- * fadearea_color : Media item fade full area fill color 
--- * fadearea_drawmode : Media item fade full area fill mode 
--- * col_mi_fade2 : Media item edges of controls 
--- * col_mi_fade2_drawmode : Media item edges of controls blend mode 
--- * item_grouphl : Media item edge when selected via grouping 
--- * col_offlinetext : Media item "offline" text 
--- * col_stretchmarker : Media item stretch marker line 
--- * col_stretchmarker_h0 : Media item stretch marker handle (1x) 
--- * col_stretchmarker_h1 : Media item stretch marker handle (&gt;1x) 
--- * col_stretchmarker_h2 : Media item stretch marker handle (&lt;1x) 
--- * col_stretchmarker_b : Media item stretch marker handle edge 
--- * col_stretchmarkerm : Media item stretch marker blend mode 
--- * col_stretchmarker_text : Media item stretch marker text 
--- * col_stretchmarker_tm : Media item transient guide handle 
--- * take_marker : Media item take marker 
--- * selitem_tag : Selected media item bar color 
--- * activetake_tag : Active media item take bar color 
--- * col_tr1_bg : Track background (odd tracks) 
--- * col_tr2_bg : Track background (even tracks) 
--- * col_tr1_divline : Track divider line (odd tracks) 
--- * col_tr2_divline : Track divider line (even tracks) 
--- * col_envlane1_divline : Envelope lane divider line (odd tracks) 
--- * col_envlane2_divline : Envelope lane divider line (even tracks) 
--- * marquee_fill : Marquee fill 
--- * marquee_drawmode : Marquee fill mode 
--- * marquee_outline : Marquee outline 
--- * marqueezoom_fill : Marquee zoom fill 
--- * marqueezoom_drawmode : Marquee zoom fill mode 
--- * marqueezoom_outline : Marquee zoom outline 
--- * col_cursor : Edit cursor 
--- * col_cursor2 : Edit cursor (alternate) 
--- * playcursor_color : Play cursor 
--- * playcursor_drawmode : Play cursor fill mode 
--- * col_gridlines2 : Grid lines (start of measure) 
--- * col_gridlines2dm : Grid lines (start of measure) 
--- * col_gridlines3 : Grid lines (start of beats) 
--- * col_gridlines3dm : Grid lines (start of beats) 
--- * col_gridlines : Grid lines (in between beats) 
--- * col_gridlines1dm : Grid lines (in between beats) 
--- * guideline_color : Editing guide line color 
--- * guideline_drawmode : Editing guide fill mode 
--- * region : Regions 
--- * region_lane_bg : Region lane background 
--- * region_lane_text : Region lane text 
--- * marker : Markers 
--- * marker_lane_bg : Marker lane background 
--- * marker_lane_text : Marker lane text 
--- * col_tsigmark : Time signature change marker 
--- * ts_lane_bg : Time signature lane background 
--- * ts_lane_text : Time signature lane text 
--- * timesig_sel_bg : Time signature marker selected background 
--- * col_routinghl1 : Routing matrix row highlight 
--- * col_routinghl2 : Routing matrix column highlight 
--- * col_vudoint : Theme has interlaced VU meters
--- * col_vuclip : VU meter clip indicator 
--- * col_vutop : VU meter top 
--- * col_vumid : VU meter middle 
--- * col_vubot : VU meter bottom 
--- * col_vuintcol : VU meter interlace/edge color 
--- * col_vumidi : VU meter midi activity 
--- * col_vuind1 : VU (indicator) - no signal 
--- * col_vuind2 : VU (indicator) - low signal 
--- * col_vuind3 : VU (indicator) - med signal 
--- * col_vuind4 : VU (indicator) - hot signal 
--- * mcp_sends_normal : Sends text: normal 
--- * mcp_sends_muted : Sends text: muted 
--- * mcp_send_midihw : Sends text: MIDI hardware 
--- * mcp_sends_levels : Sends level 
--- * mcp_fx_normal : FX insert text: normal 
--- * mcp_fx_bypassed : FX insert text: bypassed 
--- * mcp_fx_offlined : FX insert text: offline 
--- * mcp_fxparm_normal : FX parameter text: normal 
--- * mcp_fxparm_bypassed : FX parameter text: bypassed 
--- * mcp_fxparm_offlined : FX parameter text: offline 
--- * tcp_list_scrollbar : List scrollbar (track panel) 
--- * tcp_list_scrollbar_mode : List scrollbar (track panel) 
--- * tcp_list_scrollbar_mouseover : List scrollbar mouseover (track panel) 
--- * tcp_list_scrollbar_mouseover_mode : List scrollbar mouseover (track panel) 
--- * mcp_list_scrollbar : List scrollbar (mixer panel) 
--- * mcp_list_scrollbar_mode : List scrollbar (mixer panel) 
--- * mcp_list_scrollbar_mouseover : List scrollbar mouseover (mixer panel) 
--- * mcp_list_scrollbar_mouseover_mode : List scrollbar mouseover (mixer panel)  
--- * midi_rulerbg : MIDI editor ruler background 
--- * midi_rulerfg : MIDI editor ruler text 
--- * midi_grid2 : MIDI editor grid line (start of measure) 
--- * midi_griddm2 : MIDI editor grid line (start of measure) 
--- * midi_grid3 : MIDI editor grid line (start of beats) 
--- * midi_griddm3 : MIDI editor grid line (start of beats) 
--- * midi_grid1 : MIDI editor grid line (between beats) 
--- * midi_griddm1 : MIDI editor grid line (between beats) 
--- * midi_trackbg1 : MIDI editor background color (naturals) 
--- * midi_trackbg2 : MIDI editor background color (sharps/flats) 
--- * midi_trackbg_outer1 : MIDI editor background color, out of bounds (naturals) 
--- * midi_trackbg_outer2 : MIDI editor background color, out of bounds (sharps/flats) 
--- * midi_selpitch1 : MIDI editor background color, selected pitch (naturals) 
--- * midi_selpitch2 : MIDI editor background color, selected pitch (sharps/flats) 
--- * midi_selbg : MIDI editor time selection color 
--- * midi_selbg_drawmode : MIDI editor time selection fill mode 
--- * midi_gridhc : MIDI editor CC horizontal center line 
--- * midi_gridhcdm : MIDI editor CC horizontal center line 
--- * midi_gridh : MIDI editor CC horizontal line 
--- * midi_gridhdm : MIDI editor CC horizontal line 
--- * midi_ccbut : MIDI editor CC lane add/remove buttons 
--- * midi_ccbut_text : MIDI editor CC lane button text 
--- * midi_ccbut_arrow : MIDI editor CC lane button arrow 
--- * midioct : MIDI editor octave line color 
--- * midi_inline_trackbg1 : MIDI inline background color (naturals) 
--- * midi_inline_trackbg2 : MIDI inline background color (sharps/flats) 
--- * midioct_inline : MIDI inline octave line color 
--- * midi_endpt : MIDI editor end marker 
--- * midi_notebg : MIDI editor note, unselected (midi_note_colormap overrides) 
--- * midi_notefg : MIDI editor note, selected (midi_note_colormap overrides) 
--- * midi_notemute : MIDI editor note, muted, unselected (midi_note_colormap overrides) 
--- * midi_notemute_sel : MIDI editor note, muted, selected (midi_note_colormap overrides) 
--- * midi_itemctl : MIDI editor note controls 
--- * midi_ofsn : MIDI editor note (offscreen) 
--- * midi_ofsnsel : MIDI editor note (offscreen, selected) 
--- * midi_editcurs : MIDI editor cursor 
--- * midi_pkey1 : MIDI piano key color (naturals background, sharps/flats text) 
--- * midi_pkey2 : MIDI piano key color (sharps/flats background, naturals text) 
--- * midi_pkey3 : MIDI piano key color (selected) 
--- * midi_noteon_flash : MIDI piano key note-on flash 
--- * midi_leftbg : MIDI piano pane background 
--- * midifont_col_light_unsel : MIDI editor note text and control color, unselected (light) 
--- * midifont_col_dark_unsel : MIDI editor note text and control color, unselected (dark) 
--- * midifont_mode_unsel : MIDI editor note text and control mode, unselected
--- * midifont_col_light : MIDI editor note text and control color (light) 
--- * midifont_col_dark : MIDI editor note text and control color (dark) 
--- * midifont_mode : MIDI editor note text and control mode 
--- * score_bg : MIDI notation editor background 
--- * score_fg : MIDI notation editor staff/notation/text 
--- * score_sel : MIDI notation editor selected staff/notation/text 
--- * score_timesel : MIDI notation editor time selection 
--- * score_loop : MIDI notation editor loop points, selected pitch 
--- * midieditorlist_bg : MIDI list editor background 
--- * midieditorlist_fg : MIDI list editor text 
--- * midieditorlist_grid : MIDI list editor grid lines 
--- * midieditorlist_selbg : MIDI list editor selected row 
--- * midieditorlist_selfg : MIDI list editor selected text 
--- * midieditorlist_seliabg : MIDI list editor selected row (inactive) 
--- * midieditorlist_seliafg : MIDI list editor selected text (inactive) 
--- * midieditorlist_bg2 : MIDI list editor background (secondary) 
--- * midieditorlist_fg2 : MIDI list editor text (secondary) 
--- * midieditorlist_selbg2 : MIDI list editor selected row (secondary) 
--- * midieditorlist_selfg2 : MIDI list editor selected text (secondary) 
--- * col_explorer_sel : Media explorer selection 
--- * col_explorer_seldm : Media explorer selection mode 
--- * col_explorer_seledge : Media explorer selection edge 
--- * docker_shadow : Tab control shadow 
--- * docker_selface : Tab control selected tab 
--- * docker_unselface : Tab control unselected tab 
--- * docker_text : Tab control text 
--- * docker_text_sel : Tab control text selected tab 
--- * docker_bg : Tab control background 
--- * windowtab_bg : Tab control background in windows 
--- * auto_item_unsel : Envelope: Unselected automation item 
--- * col_env1 : Envelope: Volume (pre-FX) 
--- * col_env2 : Envelope: Volume 
--- * env_trim_vol : Envelope: Trim Volume 
--- * col_env3 : Envelope: Pan (pre-FX) 
--- * col_env4 : Envelope: Pan 
--- * env_track_mute : Envelope: Mute 
--- * col_env5 : Envelope: Master playrate 
--- * col_env6 : Envelope: Master tempo 
--- * col_env7 : Envelope: Send volume 
--- * col_env8 : Envelope: Send pan 
--- * col_env9 : Envelope: Send volume 2 
--- * col_env10 : Envelope: Send pan 2 
--- * env_sends_mute : Envelope: Send mute 
--- * col_env11 : Envelope: Audio hardware output volume 
--- * col_env12 : Envelope: Audio hardware output pan 
--- * col_env13 : Envelope: FX parameter 1 
--- * col_env14 : Envelope: FX parameter 2 
--- * col_env15 : Envelope: FX parameter 3 
--- * col_env16 : Envelope: FX parameter 4 
--- * env_item_vol : Envelope: Item take volume 
--- * env_item_pan : Envelope: Item take pan 
--- * env_item_mute : Envelope: Item take mute 
--- * env_item_pitch : Envelope: Item take pitch 
--- * wiring_grid2 : Wiring: Background 
--- * wiring_grid : Wiring: Background grid lines 
--- * wiring_border : Wiring: Box border 
--- * wiring_tbg : Wiring: Box background 
--- * wiring_ticon : Wiring: Box foreground 
--- * wiring_recbg : Wiring: Record section background 
--- * wiring_recitem : Wiring: Record section foreground 
--- * wiring_media : Wiring: Media 
--- * wiring_recv : Wiring: Receives 
--- * wiring_send : Wiring: Sends 
--- * wiring_fader : Wiring: Fader 
--- * wiring_parent : Wiring: Master/Parent 
--- * wiring_parentwire_border : Wiring: Master/Parent wire border 
--- * wiring_parentwire_master : Wiring: Master/Parent to master wire 
--- * wiring_parentwire_folder : Wiring: Master/Parent to parent folder wire 
--- * wiring_pin_normal : Wiring: Pins normal 
--- * wiring_pin_connected : Wiring: Pins connected 
--- * wiring_pin_disconnected : Wiring: Pins disconnected 
--- * wiring_horz_col : Wiring: Horizontal pin connections 
--- * wiring_sendwire : Wiring: Send hanging wire 
--- * wiring_hwoutwire : Wiring: Hardware output wire 
--- * wiring_recinputwire : Wiring: Record input wire 
--- * wiring_hwout : Wiring: System hardware outputs 
--- * wiring_recinput : Wiring: System record inputs 
--- * group_0 : Group #1 
--- * group_1 : Group #2 
--- * group_2 : Group #3 
--- * group_3 : Group #4 
--- * group_4 : Group #5 
--- * group_5 : Group #6 
--- * group_6 : Group #7 
--- * group_7 : Group #8 
--- * group_8 : Group #9 
--- * group_9 : Group #10 
--- * group_10 : Group #11 
--- * group_11 : Group #12 
--- * group_12 : Group #13 
--- * group_13 : Group #14 
--- * group_14 : Group #15 
--- * group_15 : Group #16 
--- * group_16 : Group #17 
--- * group_17 : Group #18 
--- * group_18 : Group #19 
--- * group_19 : Group #20 
--- * group_20 : Group #21 
--- * group_21 : Group #22 
--- * group_22 : Group #23 
--- * group_23 : Group #24 
--- * group_24 : Group #25 
--- * group_25 : Group #26 
--- * group_26 : Group #27 
--- * group_27 : Group #28 
--- * group_28 : Group #29 
--- * group_29 : Group #30 
--- * group_30 : Group #31 
--- * group_31 : Group #32 
--- * group_32 : Group #33 
--- * group_33 : Group #34 
--- * group_34 : Group #35 
--- * group_35 : Group #36 
--- * group_36 : Group #37 
--- * group_37 : Group #38 
--- * group_38 : Group #39 
--- * group_39 : Group #40 
--- * group_40 : Group #41 
--- * group_41 : Group #42 
--- * group_42 : Group #43 
--- * group_43 : Group #44 
--- * group_44 : Group #45 
--- * group_45 : Group #46 
--- * group_46 : Group #47 
--- * group_47 : Group #48 
--- * group_48 : Group #49 
--- * group_49 : Group #50 
--- * group_50 : Group #51 
--- * group_51 : Group #52 
--- * group_52 : Group #53 
--- * group_53 : Group #54 
--- * group_54 : Group #55 
--- * group_55 : Group #56 
--- * group_56 : Group #57 
--- * group_57 : Group #58 
--- * group_58 : Group #59 
--- * group_59 : Group #60 
--- * group_60 : Group #61 
--- * group_61 : Group #62 
--- * group_62 : Group #63 
--- * group_63 : Group #64 
---@param ini_key string
---@param color integer
---@param flags integer
---@return integer retval
function reaper.SetThemeColor(ini_key, color, flags) end

---Updates the toggle state of an action, returns true if succeeded. Only ReaScripts can have their toggle states changed programmatically. See [RefreshToolbar2](#RefreshToolbar2).
---@param section_id integer
---@param command_id integer
---@param state integer
---@return boolean 
function reaper.SetToggleCommandState(section_id, command_id, state) end

---Set automation-mode for a specific MediaTrack.
---@param tr MediaTrack
---@param mode integer
function reaper.SetTrackAutomationMode(tr, mode) end

---Set the custom track color, color is OS dependent (i.e. [ColorToNative(r,g,b)](#ColorToNative).
---@param track MediaTrack
---@param color integer
function reaper.SetTrackColor(track, color) end

---Set all MIDI lyrics on the track. Lyrics will be stuffed into any MIDI items found in range. Flag is unused at present. str is passed in as beat position, tab, text, tab (example with flag=2: "1.1.2\tLyric for measure 1 beat 2\t.1.1\tLyric for measure 2 beat 1    "). See [GetTrackMIDILyrics](#GetTrackMIDILyrics)
---@param track MediaTrack
---@param flag integer
---@param str string
---@return boolean 
function reaper.SetTrackMIDILyrics(track, flag, str) end

---channel &gt; 0 assigns these note names to all channels.
---@param track integer
---@param pitch integer
---@param chan integer
---@param name string
---@return boolean 
function reaper.SetTrackMIDINoteName(track, pitch, chan, name) end

---channel &gt; 0 assigns note name to all channels. pitch 128 assigns name for CC0, pitch 129 for CC1, etc.
---@param proj ReaProject
---@param track MediaTrack
---@param pitch integer
---@param chan integer
---@param name string
---@return boolean 
function reaper.SetTrackMIDINoteNameEx(proj, track, pitch, chan, name) end

---Set a MediaTrack selected/deselected. Will retain already existing selection, so you can set multiple tracks selected that way.
---			
---			Will not affect Last-Touched-Track.
---@param track MediaTrack
---@param selected boolean
function reaper.SetTrackSelected(track, selected) end

---Set send/receive/hardware output numerical-value attributes, return true on success.
---category is &lt;0 for receives, 0=sends, &gt;0 for hardware outputs
---parameter names:    B\_MUTE : bool \*
---    B\_PHASE : bool \*, true to flip phase
---    B\_MONO : bool \*
---    D\_VOL : double \*, 1.0 = +0dB etc
---    D\_PAN : double \*, -1..+1
---    D\_PANLAW : double \*,1.0=+0.0db, 0.5=-6dB, -1.0 = projdef etc
---    I\_SENDMODE : int \*, 0=post-fader, 1=pre-fx, 2=post-fx (deprecated), 3=post-fx
---    I\_AUTOMODE : int \* : automation mode (-1=use track automode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch)
---    I\_SRCCHAN : int \*, index,&amp;1024=mono, -1 for none
---    I\_DSTCHAN : int \*, index, &amp;1024=mono, otherwise stereo pair, hwout:&amp;512=rearoute
---    I\_MIDIFLAGS : int \*, low 5 bits=source channel 0=all, 1-16, next 5 bits=dest channel, 0=orig, 1-16=chanSee [CreateTrackSend](#CreateTrackSend), [RemoveTrackSend](#RemoveTrackSend), [GetTrackNumSends](#GetTrackNumSends).
---For ReaRoute-users: the outputs are hardware outputs, but with 512 added to the destination channel index (512 is the first rearoute channel, 513 the second, etc).See [CreateTrackSend](#CreateTrackSend), [RemoveTrackSend](#RemoveTrackSend), [GetTrackNumSends](#GetTrackNumSends).
---@param tr MediaTrack
---@param category integer
---@param sendidx integer
---@param parmname string
---@param newvalue number
---@return boolean 
function reaper.SetTrackSendInfo_Value(tr, category, sendidx, parmname, newvalue) end

---send_idx&lt;0 for receives, &gt;=0 for hw ouputs, &gt;=nb_of_hw_ouputs for sends. isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal tweak.
---@param track MediaTrack
---@param send_idx integer
---@param pan number
---@param isend integer
---@return boolean 
function reaper.SetTrackSendUIPan(track, send_idx, pan, isend) end

---send_idx&lt;0 for receives, &gt;=0 for hw ouputs, &gt;=nb_of_hw_ouputs for sends. isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal tweak.
---@param track MediaTrack
---@param send_idx integer
---@param vol number
---@param isend integer
---@return boolean 
function reaper.SetTrackSendUIVol(track, send_idx, vol, isend) end

---Sets the RPPXML state of a track, returns true if successful. Undo flag is a performance/caching hint.
---@param track MediaTrack
---@param str string
---@param isundo boolean
---@return boolean 
function reaper.SetTrackStateChunk(track, str, isundo) end

---shows a Reaper-context menu.
---You can decide, which menu to show and to which track/item/envelope/envelope-point/automation-item you want this context-menu to be applied to.
---e.g. you can decide, whether settings in the context-menu "track_panel" shall be applied to track 1, track 2, etcYou can also apply this to the selected track/mediaitem/envelope.
---The parameters name and ctx influence each other, means: name="item" and ctx=reaper.GetMediaItem(0,1) apply the mediaitem-contextmenu to the Mediaitem-object, given to parameter ctx.
---The choice of the parameter name also influences, whether ctxOptional and ctx2Optional can be set or not and what they mean.Blocks further execution of a script, until the context-menu is closed.
---@param name string
---@param x integer
---@param y integer
---@param HWND optional
---@param ctx identifier
---@param ctx2 integer
---@param ctx3 integer
function reaper.ShowPopupMenu(name, x, y, HWND, ctx, ctx2, ctx3) end

---@param caller KbdSectionInfo
---@param HWND optional
function reaper.ShowActionList(caller, HWND) end

---Show a message to the user (also useful for debugging). Send "\n" for newline, "" to clear the console. See [ClearConsole](#ClearConsole)
---@param msg string
function reaper.ShowConsoleMsg(msg) end

---Shows Messagebox with user-clickable buttons.           
---@param msg string
---@param title string
---@param type integer
---@return integer 
function reaper.ShowMessageBox(msg, title, type) end

---Convert slider-value to it's dB-value-equivalent.
---@param y number
---@return number 
function reaper.SLIDER2DB(y) end

---@param project ReaProject
---@param time_pos number
---@return number 
function reaper.SnapToGrid(project, time_pos) end

---Set solo-state for all tracks.
---@param solo integer
function reaper.SoloAllTracks(solo) end

---gets the splash window, in case you want to display a message over it. Returns NULL when the sphah window is not displayed.
---@return HWND 
function reaper.Splash_GetWnd() end

---The original item becomes the left-hand split, the function returns the right-hand split (or NULL if the split failed)
---@param item MediaItem
---@param position number
---@return MediaItem 
function reaper.SplitMediaItem(item, position) end

---@param str string
---@param gGUID string
---@return string gGUID
function reaper.stringToGuid(str, gGUID) end

---Stuffs a 3 byte MIDI message into either the Virtual MIDI Keyboard queue, or the MIDI-as-control input queue, or sends to a MIDI hardware output. mode=0 for VKB, 1 for control (actions map etc), 2 for VKB-on-current-channel; 16 for external MIDI device 0, 17 for external MIDI device 1, etc; see [GetNumMIDIOutputs](#GetNumMIDIOutputs), [GetMIDIOutputName](#GetMIDIOutputName).if mode is set to 1, you can send messages as control-message for Parameter LEarn/Modulation and as shortcut for scripts.
---The parameter msg3 can be retrieved with the returnvalue val of the function reaper.get\_action\_context, so sending values to a script is possible that way.For more detailed information about the possible midi-messages you can send via StuffMIDIMessage, see: [StuffMIDIMessage-docs](../misc/misc_docs/Reaper-StuffMidiMessage-docs.txt)
---@param mode integer
---@param msg1 integer
---@param msg2 integer
---@param msg3 integer
function reaper.StuffMIDIMessage(mode, msg1, msg2, msg3) end

---Adds or queries the position of a named FX in a take. See [TrackFX\_AddByName()](#TrackFX_AddByName) for information on fxname and instantiate. 
---@param take MediaItem_Take
---@param fxname string
---@param instantiate integer
---@return integer 
function reaper.TakeFX_AddByName(take, fxname, instantiate) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@return boolean 
function reaper.TakeFX_EndParamEdit(take, fx, param) end

---Note: only works with FX that support Cockos VST extensions.
---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@param val number
---@param buf string
---@return boolean retval, string buf
function reaper.TakeFX_FormatParamValue(take, fx, param, val, buf) end

---Note: only works with FX that support Cockos VST extensions.
---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@param value number
---@param buf string
---@return boolean retval, string buf
function reaper.TakeFX_FormatParamValueNormalized(take, fx, param, value, buf) end

---returns index of effect visible in chain, or -1 for chain hidden, or -2 for chain visible but no effect selected
---@param take MediaItem_Take
---@return integer 
function reaper.TakeFX_GetChainVisible(take) end

---@param take MediaItem_Take
---@return integer 
function reaper.TakeFX_GetCount(take) end

---See [TakeFX\_SetEnabled](#TakeFX_SetEnabled)
---@param take MediaItem_Take
---@param fx integer
---@return boolean 
function reaper.TakeFX_GetEnabled(take, fx) end

---Returns the FX parameter envelope. If the envelope does not exist and create=true, the envelope will be created.
---@param take MediaItem_Take
---@param fxindex integer
---@param parameterindex integer
---@param create boolean
---@return TrackEnvelope 
function reaper.TakeFX_GetEnvelope(take, fxindex, parameterindex, create) end

---returns HWND of floating window for effect index, if any
---@param take MediaItem_Take
---@param index integer
---@return HWND 
function reaper.TakeFX_GetFloatingWindow(take, index) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@param buf string
---@return boolean retval, string buf
function reaper.TakeFX_GetFormattedParamValue(take, fx, param, buf) end

---@param take MediaItem_Take
---@param fx integer
---@return string GUID
function reaper.TakeFX_GetFXGUID(take, fx) end

---@param take MediaItem_Take
---@param fx integer
---@param buf string
---@return boolean retval, string buf
function reaper.TakeFX_GetFXName(take, fx, buf) end

---sets the number of input/output pins for FX if available, returns plug-in type or -1 on error
---@param take MediaItem_Take
---@param fx integer
---@return integer retval, optional number, optional number
function reaper.TakeFX_GetIOSize(take, fx) end

---gets plug-in specific named configuration value (returns true on success)
---@param take MediaItem_Take
---@param fx integer
---@param parmname string
---@return boolean retval, string buf
function reaper.TakeFX_GetNamedConfigParm(take, fx, parmname) end

---@param take MediaItem_Take
---@param fx integer
---@return integer 
function reaper.TakeFX_GetNumParams(take, fx) end

---Returns true if this FX UI is open in the FX chain window or a floating window. See [TakeFX\_SetOpen](#TakeFX_SetOpen)
---@param take MediaItem_Take
---@param fx integer
---@return boolean 
function reaper.TakeFX_GetOpen(take, fx) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@return number retval, number minval, number maxval
function reaper.TakeFX_GetParam(take, fx, param) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@return boolean retval, number step, number smallstep, number largestep, boolean istoggle
function reaper.TakeFX_GetParameterStepSizes(take, fx, param) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@return number retval, number minval, number maxval, number midval
function reaper.TakeFX_GetParamEx(take, fx, param) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@param buf string
---@return boolean retval, string buf
function reaper.TakeFX_GetParamName(take, fx, param, buf) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@return number 
function reaper.TakeFX_GetParamNormalized(take, fx, param) end

---gets the effective channel mapping bitmask for a particular pin. high32OutOptional will be set to the high 32 bits
---@param tr MediaItem_Take
---@param fx integer
---@param is integer
---@param pin integer
---@return integer retval, optional number
function reaper.TakeFX_GetPinMappings(tr, fx, is, pin) end

---Get the name of the preset currently showing in the REAPER dropdown, or the full path to a factory preset file for VST3 plug-ins (.vstpreset). Returns false if the current FX parameters do not exactly match the preset (in other words, if the user loaded the preset but moved the knobs afterward). See [TakeFX\_SetPreset](#TakeFX_SetPreset).
---@param take MediaItem_Take
---@param fx integer
---@param presetname string
---@return boolean retval, string presetname
function reaper.TakeFX_GetPreset(take, fx, presetname) end

---Returns current preset index, or -1 if error. numberOfPresetsOut will be set to total number of presets available. See [TakeFX\_SetPresetByIndex](#TakeFX_SetPresetByIndex)
---@param take MediaItem_Take
---@param fx integer
---@return integer retval, number numberOfPresets
function reaper.TakeFX_GetPresetIndex(take, fx) end

---@param take MediaItem_Take
---@param fx integer
---@param fn string
---@return string fn
function reaper.TakeFX_GetUserPresetFilename(take, fx, fn) end

---presetmove==1 activates the next preset, presetmove==-1 activates the previous preset, etc.
---@param take MediaItem_Take
---@param fx integer
---@param presetmove integer
---@return boolean 
function reaper.TakeFX_NavigatePresets(take, fx, presetmove) end

---See [TakeFX\_GetEnabled](#TakeFX_GetEnabled)
---@param take MediaItem_Take
---@param fx integer
---@param enabled boolean
function reaper.TakeFX_SetEnabled(take, fx, enabled) end

---gets plug-in specific named configuration value (returns true on success)
---@param take MediaItem_Take
---@param fx integer
---@param parmname string
---@param value string
---@return boolean 
function reaper.TakeFX_SetNamedConfigParm(take, fx, parmname, value) end

---Open this FX UI. See [TakeFX\_GetOpen](#TakeFX_GetOpen)
---@param take MediaItem_Take
---@param fx integer
---@param open boolean
function reaper.TakeFX_SetOpen(take, fx, open) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@param val number
---@return boolean 
function reaper.TakeFX_SetParam(take, fx, param, val) end

---@param take MediaItem_Take
---@param fx integer
---@param param integer
---@param value number
---@return boolean 
function reaper.TakeFX_SetParamNormalized(take, fx, param, value) end

---sets the channel mapping bitmask for a particular pin. returns false if unsupported (not all types of plug-ins support this capability)
---@param tr MediaItem_Take
---@param fx integer
---@param is integer
---@param pin integer
---@param low32bits integer
---@param hi32bits integer
---@return boolean 
function reaper.TakeFX_SetPinMappings(tr, fx, is, pin, low32bits, hi32bits) end

---Activate a preset with the name shown in the REAPER dropdown. Full paths to .vstpreset files are also supported for VST3 plug-ins. See [TakeFX\_GetPreset](#TakeFX_GetPreset).
---@param take MediaItem_Take
---@param fx integer
---@param presetname string
---@return boolean 
function reaper.TakeFX_SetPreset(take, fx, presetname) end

---Sets the preset idx, or the factory preset (idx==-2), or the default user preset (idx==-1). Returns true on success. See [TakeFX\_GetPresetIndex](#TakeFX_GetPresetIndex).
---@param take MediaItem_Take
---@param fx integer
---@param idx integer
---@return boolean 
function reaper.TakeFX_SetPresetByIndex(take, fx, idx) end

---showflag=0 for hidechain, =1 for show chain(index valid), =2 for hide floating window(index valid), =3 for show floating window (index valid)
---@param take MediaItem_Take
---@param index integer
---@param showFlag integer
function reaper.TakeFX_Show(take, index, showFlag) end

---Returns true if the active take contains MIDI.
---@param take MediaItem_Take
---@return boolean 
function reaper.TakeIsMIDI(take) end

---Gets theme layout information.     section can be 'global' for global layout override, 'seclist' to enumerate a list of layout sections, otherwise a layout section such as 'mcp', 'tcp', 'trans', etc. 
---    idx can be 
---        -1 to query the current value, 
---        -2 to get the description of the section (if not global), 
---        -3 will return the current context DPI-scaling (256=normal, 512=retina, etc), or 0..x. 
---        
--- returns false if failed.
---@param section string
---@param idx integer
---@return boolean retval, string name
function reaper.ThemeLayout_GetLayout(section, idx) end

---returns theme layout parameter. return value is cfg-name, or nil/empty if out of range.
---@param wp integer
---@return string retval, optional string, optional number, optional number, optional number, optional number
function reaper.ThemeLayout_GetParameter(wp) end

---Refreshes all layouts
function reaper.ThemeLayout_RefreshAll() end

---Sets theme layout override for a particular section section can be 'global' or 'mcp' etc. If setting global layout, prefix a ! to the layout string to clear any per-layout overrides. Returns false if failed.
---@param section string
---@param layout string
---@return boolean retval
function reaper.ThemeLayout_SetLayout(section, layout) end

---sets theme layout parameter to value. persist=true in order to have change loaded on next theme load. note that the caller should update layouts via ??? to make changes visible.
---@param wp integer
---@param value integer
---@param persist boolean
---@return boolean retval
function reaper.ThemeLayout_SetParameter(wp, value, persist) end

---Gets a precise system timestamp in seconds.For EEL-programming, see [eel\_time\_precise](#eel_time_precise).
---@return number 
function reaper.time_precise() end

---convert a beat position (or optionally a beats+measures if measures is non-NULL) to time.
---@param proj ReaProject
---@param tpos number
---@param number optional
---@return number 
function reaper.TimeMap2_beatsToTime(proj, tpos, number) end

---get the effective BPM at the time (seconds) position (i.e. 2x in /8 signatures)
---@param proj ReaProject
---@param time number
---@return number 
function reaper.TimeMap2_GetDividedBpmAtTime(proj, time) end

---when does the next time map (tempo or time sig) change occur
---@param proj ReaProject
---@param time number
---@return number 
function reaper.TimeMap2_GetNextChangeTime(proj, time) end

---converts project QN position to time.
---@param proj ReaProject
---@param qn number
---@return number 
function reaper.TimeMap2_QNToTime(proj, qn) end

---convert a time into beats.
---if measures is non-NULL, measures will be set to the measure count, return value will be beats since measure.
---if cml is non-NULL, will be set to current measure length in beats (i.e. time signature numerator)
---if fullbeats is non-NULL, and measures is non-NULL, fullbeats will get the full beat count (same value returned if measures is NULL).
---if cdenom is non-NULL, will be set to the current time signature denominator.
---@param proj ReaProject
---@param tpos number
---@return number retval, optional number, optional number, optional number, optional number
function reaper.TimeMap2_timeToBeats(proj, tpos) end

---converts project time position to QN position.
---@param proj ReaProject
---@param tpos number
---@return number 
function reaper.TimeMap2_timeToQN(proj, tpos) end

---Gets project framerate, and optionally whether it is drop-frame timecode
---@param proj ReaProject
---@return number retval, optional boolean
function reaper.TimeMap_curFrameRate(proj) end

---get the effective BPM at the time (seconds) position (i.e. 2x in /8 signatures)
---@param time number
---@return number 
function reaper.TimeMap_GetDividedBpmAtTime(time) end

---Get the QN position and time signature information for the start of a measure. Return the time in seconds of the measure start.
---@param proj ReaProject
---@param measure integer
---@return number retval, number qn_start, number qn_end, number timesig_num, number timesig_denom, number tempo
function reaper.TimeMap_GetMeasureInfo(proj, measure) end

---Fills in a string representing the active metronome pattern. For example, in a 7/8 measure divided 3+4, the pattern might be "1221222". The length of the string is the time signature numerator, and the function returns the time signature denominator.
---@param proj ReaProject
---@param time number
---@param pattern string
---@return integer retval, string pattern
function reaper.TimeMap_GetMetronomePattern(proj, time, pattern) end

---get the effective time signature and tempo
---@param proj ReaProject
---@param time number
---@return number timesig_num, number timesig_denom, number tempo
function reaper.TimeMap_GetTimeSigAtTime(proj, time) end

---Find which measure the given QN position falls in.
---@param proj ReaProject
---@param qn number
---@return integer retval, optional number, optional number
function reaper.TimeMap_QNToMeasures(proj, qn) end

---converts project QN position to time.
---@param qn number
---@return number 
function reaper.TimeMap_QNToTime(qn) end

---Converts project quarter note count (QN) to time. QN is counted from the start of the project, regardless of any partial measures. See [TimeMap2\_QNToTime](#TimeMap2_QNToTime)
---@param proj ReaProject
---@param qn number
---@return number 
function reaper.TimeMap_QNToTime_abs(proj, qn) end

---converts project QN position to time.
---@param tpos number
---@return number 
function reaper.TimeMap_timeToQN(tpos) end

---Converts project time position to quarter note count (QN). QN is counted from the start of the project, regardless of any partial measures. See [TimeMap2\_timeToQN](#TimeMap2_timeToQN)
---@param proj ReaProject
---@param tpos number
---@return number 
function reaper.TimeMap_timeToQN_abs(proj, tpos) end

---send_idx&lt;0 for receives, &gt;=0 for hw ouputs, &gt;=nb_of_hw_ouputs for sends.
---@param track MediaTrack
---@param send_idx integer
---@return boolean 
function reaper.ToggleTrackSendUIMute(track, send_idx) end

---@param track MediaTrack
---@param channel integer
---@param clear boolean
---@return number 
function reaper.Track_GetPeakHoldDB(track, channel, clear) end

---@param track MediaTrack
---@param channel integer
---@return number 
function reaper.Track_GetPeakInfo(track, channel) end

---Displays tooltip at location, or removes if empty string.Only one tooltip can be shown, means, a new tooltip removes the previous one.
---@param fmt string
---@param xpos integer
---@param ypos integer
---@param topmost boolean
function reaper.TrackCtl_SetToolTip(fmt, xpos, ypos, topmost) end

---Adds or queries the position of a named FX from the track FX chain (recFX=false) or record input FX/monitoring FX (recFX=true, monitoring FX are on master track). Specify a negative value for instantiate to always create a new effect, 
---0 to only query the first instance of an effect, or a positive value to add an instance if one is not found.             Returns -1 on failure or the new position in chain on success.
---@param track MediaTrack
---@param fxname string
---@param recFX boolean
---@param instantiate integer
---@return integer retval
function reaper.TrackFX_AddByName(track, fxname, recFX, instantiate) end

---Copies (or moves) FX from src_track to dest_track. Can be used with src_track=dest_track to reorder, FX indices have 0x1000000 set to reference input FX. 
---@param src_track MediaTrack
---@param src_fx integer
---@param dest_track MediaTrack
---@param dest_fx integer
---@param is_move boolean
function reaper.TrackFX_CopyToTrack(src_track, src_fx, dest_track, dest_fx, is_move) end

---Copies (or moves) FX from src_track to dest_take. src_fx can have 0x1000000 set to reference input FX. 
---@param src_track MediaTrack
---@param src_fx integer
---@param dest_take MediaItem_Take
---@param dest_fx integer
---@param is_move boolean
function reaper.TrackFX_CopyToTake(src_track, src_fx, dest_take, dest_fx, is_move) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@return boolean 
function reaper.TrackFX_EndParamEdit(track, fx, param) end

---returns a formatted version of the currently set parameter-value.Note: only works with FX that support Cockos VST extensions.returns false in case of an error
---@param track MediaTrack
---@param fx integer
---@param param integer
---@param val number
---@param buf string
---@return boolean retval, string buf
function reaper.TrackFX_FormatParamValue(track, fx, param, val, buf) end

---returns a formatted version of the currently set parameter-value and normalizes it.
---        
---Note: only works with FX that support Cockos VST extensions.returns false in case of an error
---@param track MediaTrack
---@param fx integer
---@param param integer
---@param value number
---@param buf string
---@return boolean retval, string buf
function reaper.TrackFX_FormatParamValueNormalized(track, fx, param, value, buf) end

---Get the index of the first track FX insert that matches fxname. If the FX is not in the chain and instantiate is true, it will be inserted. See [TrackFX\_GetInstrument](#TrackFX_GetInstrument), [TrackFX\_GetEQ](#TrackFX_GetEQ). Deprecated in favor of TrackFX_AddByName.returns -1 in case of an error
---@param track MediaTrack
---@param fxname string
---@param instantiate boolean
---@return integer retval
function reaper.TrackFX_GetByName(track, fxname, instantiate) end

---returns index of effect visible in chain, or -1 for chain hidden, or -2 for chain visible but no effect selected
---@param track MediaTrack
---@return integer 
function reaper.TrackFX_GetChainVisible(track) end

---returns the number of trackfx in the FXChain of track
---@param track MediaTrack
---@return integer 
function reaper.TrackFX_GetCount(track) end

---returns, if a certain FX in track is enabledSee [TrackFX\_SetEnabled](#TrackFX_SetEnabled)returns false in case of an error
---@param track MediaTrack
---@param fx integer
---@return boolean 
function reaper.TrackFX_GetEnabled(track, fx) end

---Get the index of ReaEQ in the track FX chain. If ReaEQ is not in the chain and instantiate is true, it will be inserted. See [TrackFX\_GetInstrument](#TrackFX_GetInstrument), [TrackFX\_GetByName](#TrackFX_GetByName).returns -1 if no ReaEQ is available.
---@param track MediaTrack
---@param instantiate boolean
---@return integer 
function reaper.TrackFX_GetEQ(track, instantiate) end

---Returns true if the EQ band is enabled.
---Returns false if the band is disabled, or if track/fxidx is not ReaEQ.
---Bandtype: 0=lhipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass.
---Bandidx: 0=first band matching bandtype, 1=2nd band matching bandtype, etc.See [TrackFX\_GetEQ](#TrackFX_GetEQ), [TrackFX\_GetEQParam](#TrackFX_GetEQParam), [TrackFX\_SetEQParam](#TrackFX_SetEQParam), [TrackFX\_SetEQBandEnabled](#TrackFX_SetEQBandEnabled).
---@param track MediaTrack
---@param fxidx integer
---@param bandtype integer
---@param bandidx integer
---@return boolean 
function reaper.TrackFX_GetEQBandEnabled(track, fxidx, bandtype, bandidx) end

---Returns false if track/fxidx is not ReaEQ.
---Bandtype: -1=master gain, 0=lhipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass.
---Bandidx (ignored for master gain): 0=first band matching bandtype, 1=2nd band matching bandtype, etc.
---Paramtype (ignored for master gain): 0=freq, 1=gain, 2=Q.
---See [TrackFX\_GetEQ](#TrackFX_GetEQ), [TrackFX\_SetEQParam](#TrackFX_SetEQParam), [TrackFX\_GetEQBandEnabled](#TrackFX_GetEQBandEnabled), [TrackFX\_SetEQBandEnabled](#TrackFX_SetEQBandEnabled).
---@param track MediaTrack
---@param fxidx integer
---@param paramidx integer
---@return boolean retval, number bandtype, number bandidx, number paramtype, number normval
function reaper.TrackFX_GetEQParam(track, fxidx, paramidx) end

---returns HWND of floating window for effect index, if any
---@param track MediaTrack
---@param index integer
---@return HWND 
function reaper.TrackFX_GetFloatingWindow(track, index) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@param buf string
---@return boolean retval, string buf
function reaper.TrackFX_GetFormattedParamValue(track, fx, param, buf) end

---@param track MediaTrack
---@param fx integer
---@return string GUID
function reaper.TrackFX_GetFXGUID(track, fx) end

---@param track MediaTrack
---@param fx integer
---@param buf string
---@return boolean retval, string buf
function reaper.TrackFX_GetFXName(track, fx, buf) end

---Get the index of the first track FX insert that is a virtual instrument, or -1 if none. See [TrackFX\_GetEQ](#TrackFX_GetEQ), [TrackFX\_GetByName](#TrackFX_GetByName).
---@param track MediaTrack
---@return integer 
function reaper.TrackFX_GetInstrument(track) end

---sets the number of input/output pins for FX if available, returns plug-in type or -1 on error
---@param track MediaTrack
---@param fx integer
---@return integer retval, optional number, optional number
function reaper.TrackFX_GetIOSize(track, fx) end

---gets plug-in specific named configuration value (returns true on success). Special values: 'pdc' returns PDC latency. 'in_pin_0' returns name of first input pin (if available), 'out_pin_0' returns name of first output pin (if available), etc.
---@param track MediaTrack
---@param fx integer
---@param parmname string
---@return boolean retval, string buf
function reaper.TrackFX_GetNamedConfigParm(track, fx, parmname) end

---@param track MediaTrack
---@param fx integer
---@return integer 
function reaper.TrackFX_GetNumParams(track, fx) end

---Returns true if this FX UI is open in the FX chain window or a floating window. See [TrackFX\_SetOpen](#TrackFX_SetOpen)
---@param track MediaTrack
---@param fx integer
---@return boolean 
function reaper.TrackFX_GetOpen(track, fx) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@return number retval, number minval, number maxval
function reaper.TrackFX_GetParam(track, fx, param) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@return boolean retval, number step, number smallstep, number largestep, boolean istoggle
function reaper.TrackFX_GetParameterStepSizes(track, fx, param) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@return number retval, number minval, number maxval, number midval
function reaper.TrackFX_GetParamEx(track, fx, param) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@param buf string
---@return boolean retval, string buf
function reaper.TrackFX_GetParamName(track, fx, param, buf) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@return number 
function reaper.TrackFX_GetParamNormalized(track, fx, param) end

---gets the effective channel mapping bitmask for a particular pin. high32OutOptional will be set to the high 32 bits
---@param tr MediaTrack
---@param fx integer
---@param is integer
---@param pin integer
---@return integer retval, optional number
function reaper.TrackFX_GetPinMappings(tr, fx, is, pin) end

---Get the name of the preset currently showing in the REAPER dropdown, or the full path to a factory preset file for VST3 plug-ins (.vstpreset). Returns false if the current FX parameters do not exactly match the preset (in other words, if the user loaded the preset but moved the knobs afterward). See [TrackFX\_SetPreset](#TrackFX_SetPreset).
---@param track MediaTrack
---@param fx integer
---@param presetname string
---@return boolean retval, string presetname
function reaper.TrackFX_GetPreset(track, fx, presetname) end

---Returns current preset index, or -1 if error. numberOfPresetsOut will be set to total number of presets available. See [TrackFX\_SetPresetByIndex](#TrackFX_SetPresetByIndex)
---@param track MediaTrack
---@param fx integer
---@return integer retval, number numberOfPresets
function reaper.TrackFX_GetPresetIndex(track, fx) end

---returns index of effect visible in record input chain, or -1 for chain hidden, or -2 for chain visible but no effect selected
---@param track MediaTrack
---@return integer 
function reaper.TrackFX_GetRecChainVisible(track) end

---returns count of record input FX. To access record input FX, use a FX indices [0x1000000..0x1000000+n). On the master track, this accesses monitoring FX rather than record input FX.
---@param track MediaTrack
---@return integer 
function reaper.TrackFX_GetRecCount(track) end

---@param track MediaTrack
---@param fx integer
---@param fn string
---@return string fn
function reaper.TrackFX_GetUserPresetFilename(track, fx, fn) end

---presetmove==1 activates the next preset, presetmove==-1 activates the previous preset, etc.
---@param track MediaTrack
---@param fx integer
---@param presetmove integer
---@return boolean 
function reaper.TrackFX_NavigatePresets(track, fx, presetmove) end

---See [TrackFX\_GetEnabled](#TrackFX_GetEnabled)
---@param track MediaTrack
---@param fx integer
---@param enabled boolean
function reaper.TrackFX_SetEnabled(track, fx, enabled) end

---Enable or disable a ReaEQ band.
---Returns false if track/fxidx is not ReaEQ.
---Bandtype: 0=lhipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass.
---Bandidx: 0=first band matching bandtype, 1=2nd band matching bandtype, etc.
---See [TrackFX\_GetEQ](#TrackFX_GetEQ), [TrackFX\_GetEQParam](#TrackFX_GetEQParam), [TrackFX\_SetEQParam](#TrackFX_SetEQParam), [TrackFX\_GetEQBandEnabled](#TrackFX_GetEQBandEnabled).
---@param track MediaTrack
---@param fxidx integer
---@param bandtype integer
---@param bandidx integer
---@param enable boolean
---@return boolean 
function reaper.TrackFX_SetEQBandEnabled(track, fxidx, bandtype, bandidx, enable) end

---Returns false if track/fxidx is not ReaEQ. Targets a band matching bandtype.
---Bandtype: -1=master gain, 0=lhipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass.
---Bandidx (ignored for master gain): 0=target first band matching bandtype, 1=target 2nd band matching bandtype, etc.
---Paramtype (ignored for master gain): 0=freq, 1=gain, 2=Q.
---See [TrackFX\_GetEQ](#TrackFX_GetEQ), [TrackFX\_GetEQParam](#TrackFX_GetEQParam), [TrackFX\_GetEQBandEnabled](#TrackFX_GetEQBandEnabled), [TrackFX\_SetEQBandEnabled](#TrackFX_SetEQBandEnabled).
---@param track MediaTrack
---@param fxidx integer
---@param bandtype integer
---@param bandidx integer
---@param paramtype integer
---@param val number
---@param isnorm boolean
---@return boolean 
function reaper.TrackFX_SetEQParam(track, fxidx, bandtype, bandidx, paramtype, val, isnorm) end

---sets plug-in specific named configuration value (returns true on success)
---@param track MediaTrack
---@param fx integer
---@param parmname string
---@param value string
---@return boolean 
function reaper.TrackFX_SetNamedConfigParm(track, fx, parmname, value) end

---See [TrackFX\_GetOffline](#TrackFX_GetOffline)
---@param track MediaTrack
---@param fx integer
---@param offline boolean
function reaper.TrackFX_SetOffline(track, fx, offline) end

---See [TakeFX\_GetOffline](#TakeFX_GetOffline)
---@param take MediaItem_Take
---@param fx integer
---@param offline boolean
function reaper.TakeFX_SetOffline(take, fx, offline) end

---See [TakeFX\_SetOffline](#TakeFX_SetOffline)
---@param take MediaItem_Take
---@param fx integer
---@return boolean retval
function reaper.TakeFX_GetOffline(take, fx) end

---Remove a FX from take chain (returns true on success)
---@param take MediaItem_Take
---@param fx integer
---@return boolean retval
function reaper.TakeFX_Delete(take, fx) end

---Copies (or moves) FX from src_take to dest_take. Can be used with src_track=dest_track to reorder. 
---@param src_take MediaItem_Take
---@param src_fx integer
---@param dest_take MediaItem_Take
---@param dest_fx integer
---@param is_move boolean
function reaper.TakeFX_CopyToTake(src_take, src_fx, dest_take, dest_fx, is_move) end

---Copies (or moves) FX from src_take to dest_track. dest_fx can have 0x1000000 set to reference input FX.
---@param src_take MediaItem_Take
---@param src_fx integer
---@param dest_track MediaTrack
---@param dest_fx integer
---@param is_move boolean
function reaper.TakeFX_CopyToTrack(src_take, src_fx, dest_track, dest_fx, is_move) end

---See [TrackFX\_SetOffline](#TrackFX_SetOffline)
---@param track MediaTrack
---@param fx integer
---@return boolean retval
function reaper.TrackFX_GetOffline(track, fx) end

---Copies (or moves) FX from src_take to dest_take. Can be used with src_track=dest_track to reorder. 
---@param src_take MediaItem_Take
---@param src_fx integer
---@param dest_take MediaItem_Take
---@param dest_fx integer
---@param is_move boolean
function reaper.TakeFX_CopyToTake(src_take, src_fx, dest_take, dest_fx, is_move) end

---Copies (or moves) FX from src_take to dest_track. dest_fx can have 0x1000000 set to reference input FX. 
---@param src_take MediaItem_Take
---@param src_fx integer
---@param dest_track MediaTrack
---@param dest_fx integer
---@param is_move boolean
function reaper.TakeFX_CopyToTrack(src_take, src_fx, dest_track, dest_fx, is_move) end

---Remove a FX from track chain (returns true on success).
---@param track MediaTrack
---@param fx integer
---@return boolean retval
function reaper.TrackFX_Delete(track, fx) end

---Open this FX UI. See [TrackFX\_GetOpen](#TrackFX_GetOpen)
---@param track MediaTrack
---@param fx integer
---@param open boolean
function reaper.TrackFX_SetOpen(track, fx, open) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@param val number
---@return boolean 
function reaper.TrackFX_SetParam(track, fx, param, val) end

---@param track MediaTrack
---@param fx integer
---@param param integer
---@param value number
---@return boolean 
function reaper.TrackFX_SetParamNormalized(track, fx, param, value) end

---sets the channel mapping bitmask for a particular pin. returns false if unsupported (not all types of plug-ins support this capability)
---@param tr MediaTrack
---@param fx integer
---@param is integer
---@param pin integer
---@param low32bits integer
---@param hi32bits integer
---@return boolean 
function reaper.TrackFX_SetPinMappings(tr, fx, is, pin, low32bits, hi32bits) end

---Activate a preset with the name shown in the REAPER dropdown. Full paths to .vstpreset files are also supported for VST3 plug-ins. See [TrackFX\_GetPreset](#TrackFX_GetPreset).
---@param track MediaTrack
---@param fx integer
---@param presetname string
---@return boolean 
function reaper.TrackFX_SetPreset(track, fx, presetname) end

---Sets the preset idx, or the factory preset (idx==-2), or the default user preset (idx==-1). Returns true on success. See [TrackFX\_GetPresetIndex](#TrackFX_GetPresetIndex).
---@param track MediaTrack
---@param fx integer
---@param idx integer
---@return boolean 
function reaper.TrackFX_SetPresetByIndex(track, fx, idx) end

---Shows a track-FX-window.
---@param track MediaTrack
---@param index integer
---@param showFlag integer
function reaper.TrackFX_Show(track, index, showFlag) end

---Updates the TCP and optionally the MCP. Helpful, when setting a new trackheight using I\_HEIGHTOVERRIDE in [SetMediaTrackInfo\_Value](#SetMediaTrackInfo_Value).
---@param isMinor boolean
function reaper.TrackList_AdjustWindows(isMinor) end

function reaper.TrackList_UpdateAllExternalSurfaces() end

---call to start a new block
function reaper.Undo_BeginBlock() end

---call to start a new undo block. Code after that and before [Undo\_EndBlock](#Undo_EndBlock) can be undone.
---@param proj ReaProject
function reaper.Undo_BeginBlock2(proj) end

---returns string of next action,if able,NULL if not
---@param proj ReaProject
---@return string 
function reaper.Undo_CanRedo2(proj) end

---returns string of last action,if able,NULL if not
---@param proj ReaProject
---@return string 
function reaper.Undo_CanUndo2(proj) end

---nonzero if success
---@param proj ReaProject
---@return integer 
function reaper.Undo_DoRedo2(proj) end

---nonzero if success
---@param proj ReaProject
---@return integer 
function reaper.Undo_DoUndo2(proj) end

---call to end the block,with extra flags if any,and a description
---@param descchange string
---@param extraflags integer
function reaper.Undo_EndBlock(descchange, extraflags) end

---call to end the block,with extra flags if any,and a description
---@param proj ReaProject
---@param descchange string
---@param extraflags integer
function reaper.Undo_EndBlock2(proj, descchange, extraflags) end

---limited state change to items
---@param descchange string
function reaper.Undo_OnStateChange(descchange) end

---limited state change to items
---@param proj ReaProject
---@param descchange string
function reaper.Undo_OnStateChange2(proj, descchange) end

---@param proj ReaProject
---@param name string
---@param item MediaItem
function reaper.Undo_OnStateChange_Item(proj, name, item) end

---trackparm=-1 by default,or if updating one fx chain,you can specify track index
---@param descchange string
---@param whichStates integer
---@param trackparm integer
function reaper.Undo_OnStateChangeEx(descchange, whichStates, trackparm) end

---trackparm=-1 by default,or if updating one fx chain,you can specify track index
---@param proj ReaProject
---@param descchange string
---@param whichStates integer
---@param trackparm integer
function reaper.Undo_OnStateChangeEx2(proj, descchange, whichStates, trackparm) end

---Redraw the arrange view
function reaper.UpdateArrange() end

---@param item MediaItem
function reaper.UpdateItemInProject(item) end

---Redraw the arrange view and ruler
function reaper.UpdateTimeline() end

---Return true if the pointer is a valid object of the right type in proj (proj is ignored if pointer is itself a project). Supported types are: ReaProject\*, MediaTrack\*, MediaItem\*, MediaItem\_Take\*, TrackEnvelope\* and PCM\_source\*.see [ValidatePtr2](#ValidatePtr2)
---@param pointer identifier
---@param ctypename string
---@return boolean 
function reaper.ValidatePtr(pointer, ctypename) end

---Return true if the pointer is a valid object of the right type in proj (proj is ignored if pointer is itself a project). Supported types are: ReaProject*, MediaTrack*, MediaItem*, MediaItem_Take*, TrackEnvelope* and PCM_source*.
---@param proj ReaProject
---@param pointer identifier
---@param ctypename string
---@return boolean 
function reaper.ValidatePtr2(proj, pointer, ctypename) end

---Opens the prefs to a page, use pageByName if page is 0.
---@param page integer
---@param pageByName string
function reaper.ViewPrefs(page, pageByName) end

---Gets or modifies the group membership for a track. Returns group state prior to call (each bit represents one of the high 32 group numbers). if setmask has bits set, those bits in setvalue will be applied to group. Group can be one of:
---VOLUME_LEAD
---VOLUME_FOLLOW
---VOLUME_VCA_LEAD
---VOLUME_VCA_FOLLOW
---PAN_LEAD
---PAN_FOLLOW
---WIDTH_LEAD
---WIDTH_FOLLOW
---MUTE_LEAD
---MUTE_FOLLOW
---SOLO_LEAD
---SOLO_FOLLOW
---RECARM_LEAD
---RECARM_FOLLOW
---POLARITY_LEAD
---POLARITY_FOLLOW
---AUTOMODE_LEAD
---AUTOMODE_FOLLOW
---VOLUME_REVERSE
---PAN_REVERSE
---WIDTH_REVERSE
---NO_LEAD_WHEN_FOLLOW
---VOLUME_VCA_FOLLOW_ISPREFXNote: REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and _FOLLOW, which is deprecated but still supported (scripts that must support v6.11 and earlier can use the deprecated strings).
---@param tr MediaTrack
---@param groupname string
---@param setmask integer
---@param setvalue integer
---@return integer groupstate
function reaper.GetSetTrackGroupMembershipHigh(tr, groupname, setmask, setvalue) end

---Gets/sets a send attribute string:
---    P_EXT:xyz : char * : extension-specific persistent data
---    
---For ReaRoute-users: the outputs are hardware outputs, but with 512 added to the destination channel index (512 is the first rearoute channel, 513 the second, etc).
---@param tr MediaTrack
---@param category integer
---@param sendidx integer
---@param parmname string
---@param stringNeedBig string
---@param setNewValue boolean
---@return boolean retval, string stringNeedBig
function reaper.GetSetTrackSendInfo_String(tr, category, sendidx, parmname, stringNeedBig, setNewValue) end

---\[BR\] Create a BR\_Envelope-object from a track-envelope pointer or take-envelope pointer. 
---To apply changes to a BR\_Envelope-object, always call [BR\_EnvFree](#BR_EnvFree) to release the object and commit changes if needed.
---A BR_Envelope is not a TrackEnvelope-object and therefore can't be used as TrackEnvelope-object!
---            
---For manipulation see [BR\_EnvCountPoints](#BR_EnvCountPoints), [BR\_EnvDeletePoint](#BR_EnvDeletePoint), [BR\_EnvFind](#BR_EnvFind), [BR\_EnvFindNext](#BR_EnvFindNext), [BR\_EnvFindPrevious](#BR_EnvFindPrevious), [BR\_EnvGetParentTake](#BR_EnvGetParentTake), [BR\_EnvGetParentTrack](#BR_EnvGetParentTrack), [BR\_EnvGetPoint](#BR_EnvGetPoint), [BR\_EnvGetProperties](#BR_EnvGetProperties), [BR\_EnvSetPoint](#BR_EnvSetPoint), [BR\_EnvSetProperties](#BR_EnvSetProperties), [BR\_EnvValueAtPos](#BR_EnvValueAtPos).
---@param envelope TrackEnvelope
---@param takeEnvelopesUseProjectTime boolean
---@return BR_Envelope 
function reaper.BR_EnvAlloc(envelope, takeEnvelopesUseProjectTime) end

---\[BR\] Count envelope points in the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc).
---@param envelope BR_Envelope
---@return integer 
function reaper.BR_EnvCountPoints(envelope) end

---\[BR\] Delete envelope point by index (zero-based) in the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc).
---@param envelope BR_Envelope
---@param id integer
---@return boolean 
function reaper.BR_EnvDeletePoint(envelope, id) end

---\[BR\] Find envelope point at time position in the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc). Pass delta &gt; 0 to search surrounding range - in that case the closest point to position within delta will be searched for. Returns envelope point id (zero-based) on success or -1 on failure.
---@param envelope BR_Envelope
---@param position number
---@param delta number
---@return integer 
function reaper.BR_EnvFind(envelope, position, delta) end

---\[BR\] Find next envelope point after time position in the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc). Returns envelope point id (zero-based) on success or -1 on failure.
---@param envelope BR_Envelope
---@param position number
---@return integer 
function reaper.BR_EnvFindNext(envelope, position) end

---\[BR\] Find previous envelope point before time position in the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc). Returns envelope point id (zero-based) on success or -1 on failure.
---@param envelope BR_Envelope
---@param position number
---@return integer 
function reaper.BR_EnvFindPrevious(envelope, position) end

---\[BR\] Free envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc) and commit changes if needed. Returns true if changes were committed successfully. Note that when envelope object wasn't modified nothing will get committed even if commit = true - in that case function returns false.
---@param envelope BR_Envelope
---@param commit boolean
---@return boolean 
function reaper.BR_EnvFree(envelope, commit) end

---\[BR\] If envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc) is take envelope, returns parent media item take, otherwise NULL.
---@param envelope BR_Envelope
---@return MediaItem_Take 
function reaper.BR_EnvGetParentTake(envelope) end

---\[BR\] Get parent track of envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc). If take envelope, returns NULL.
---@param envelope BR_Envelope
---@return MediaItem 
function reaper.BR_EnvGetParentTrack(envelope) end

---\[BR\] Get envelope point by id (zero-based) from the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc). Returns true on success.
---@param envelope BR_Envelope
---@param id integer
---@return boolean retval, number position, number value, number shape, boolean selected, number bezier
function reaper.BR_EnvGetPoint(envelope, id) end

---\[BR\] Get envelope properties for the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc).active: true if envelope is active
---visible: true if envelope is visible
---armed: true if envelope is armed
---inLane: true if envelope has it's own envelope lane
---laneHeight: envelope lane override height. 0 for none, otherwise size in pixels
---defaultShape: default point shape: 0-&gt;Linear, 1-&gt;Square, 2-&gt;Slow start/end, 3-&gt;Fast start, 4-&gt;Fast end, 5-&gt;Bezier
---minValue: minimum envelope value
---maxValue: maximum envelope value
---type: envelope type: 0-&gt;Volume, 1-&gt;Volume (Pre-FX), 2-&gt;Pan, 3-&gt;Pan (Pre-FX), 4-&gt;Width, 5-&gt;Width (Pre-FX), 6-&gt;Mute, 7-&gt;Pitch, 8-&gt;Playrate, 9-&gt;Tempo map, 10-&gt;Parameter
---faderScaling: true if envelope uses fader scaling
---			automationItemsOptions: -1-&gt;project default, &amp;1=0-&gt;don't attach to underl. env., &amp;1-&gt;attach to underl. env. on right side, &amp;2-&gt;attach to underl. env. on both sides, &amp;4: bypass underl. env.
---@param envelope BR_Envelope
---@return boolean active, boolean visible, boolean armed, boolean inLane, number laneHeight, number defaultShape, number minValue, number maxValue, number centerValue, number type, boolean faderScaling, optional number
function reaper.BR_EnvGetProperties(envelope) end

---\[BR\] Set envelope point by id (zero-based) in the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc). To create point instead, pass id = -1. Note that if new point is inserted or existing point's time position is changed, points won't automatically get sorted. To do that, see [BR\_EnvSortPoints](#BR_EnvSortPoints).
---Returns true on success.
---@param envelope BR_Envelope
---@param id integer
---@param position number
---@param value number
---@param shape integer
---@param selected boolean
---@param bezier number
---@return boolean 
function reaper.BR_EnvSetPoint(envelope, id, position, value, shape, selected, bezier) end

---\[BR\] Set envelope properties for the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc). For parameter description see [BR\_EnvGetProperties](#BR_EnvGetProperties).
---			Setting automationItemsOptions requires REAPER 5.979+.
---@param envelope BR_Envelope
---@param active boolean
---@param visible boolean
---@param armed boolean
---@param inLane boolean
---@param laneHeight integer
---@param defaultShape integer
---@param faderScaling boolean
---@param number optional
function reaper.BR_EnvSetProperties(envelope, active, visible, armed, inLane, laneHeight, defaultShape, faderScaling, number) end

---\[BR\] Sort envelope points by position. The only reason to call this is if sorted points are explicitly needed after editing them with [BR\_EnvSetPoint](#BR_EnvSetPoint). Note that you do not have to call this before doing [BR\_EnvFree](#BR_EnvFree) since it does handle unsorted points too.
---@param envelope BR_Envelope
function reaper.BR_EnvSortPoints(envelope) end

---\[BR\] Get envelope value at time position for the envelope object allocated with [BR\_EnvAlloc](#BR_EnvAlloc).
---@param envelope BR_Envelope
---@param position number
---@return number 
function reaper.BR_EnvValueAtPos(envelope, position) end

---\[BR\] Deprecated, see [GetSet\_ArrangeView2](#GetSet_ArrangeView2) (REAPER v5.12pre4+) -- Get start and end time position of arrange view. To set arrange view instead, see [BR\_SetArrangeView](#BR_SetArrangeView).
---@param proj ReaProject
---@return number startTime, number endTime
function reaper.BR_GetArrangeView(proj) end

---\[BR\] Get closest grid division to position. Note that this functions is different from [SnapToGrid](#SnapToGrid) in two regards. SnapToGrid() needs snap enabled to work and this one works always. Secondly, grid divisions are different from grid lines because some grid lines may be hidden due to zoom level - this function ignores grid line visibility and always searches for the closest grid division at given position. For more grid division functions, see [BR\_GetNextGridDivision](#BR_GetNextGridDivision) and [BR\_GetPrevGridDivision](#BR_GetPrevGridDivision).
---@param position number
---@return number 
function reaper.BR_GetClosestGridDivision(position) end

---\[BR\] Get current theme information. themePathOut is set to full theme path and themeNameOut is set to theme name excluding any path info and extension
---@return string themePath, string themeName
function reaper.BR_GetCurrentTheme() end

---\[BR\] Get media item from GUID string. Note that the GUID must be enclosed in braces {}. To get item's GUID as a string, see [BR\_GetMediaItemGUID](#BR_GetMediaItemGUID).
---@param proj ReaProject
---@param guidStringIn string
---@return MediaItem 
function reaper.BR_GetMediaItemByGUID(proj, guidStringIn) end

---\[BR\] Get media item GUID as a string (guidStringOut_sz should be at least 64). To get media item back from GUID string, see [BR\_GetMediaItemByGUID](#BR_GetMediaItemByGUID).
---@param item MediaItem
---@return string guidString
function reaper.BR_GetMediaItemGUID(item) end

---\[BR\] Get currently loaded image resource and its flags for a given item. Returns false if there is no image resource set. To set image resource, see [BR\_SetMediaItemImageResource](#BR_SetMediaItemImageResource).
---@param item MediaItem
---@return boolean retval, string image, number imageFlags
function reaper.BR_GetMediaItemImageResource(item) end

---\[BR\] Get media item take GUID as a string (guidStringOut_sz should be at least 64). To get take from GUID string, see [SNM\_GetMediaItemTakeByGUID](#SNM_GetMediaItemTakeByGUID).
---@param take MediaItem_Take
---@return string guidString
function reaper.BR_GetMediaItemTakeGUID(take) end

---\[BR\] Get take media source properties as they appear in Item properties. Returns false if take can't have them (MIDI items etc.).
---To set source properties, see [BR\_SetMediaSourceProperties](#BR_SetMediaSourceProperties).
---@param take MediaItem_Take
---@return boolean retval, boolean section, number start, number length, number fade, boolean reverse
function reaper.BR_GetMediaSourceProperties(take) end

---\[BR\] Get media track from GUID string. Note that the GUID must be enclosed in braces {}. To get track's GUID as a string, see [BR\_GetMediaTrackGUID](#BR_GetMediaTrackGUID).
---@param proj ReaProject
---@param guidStringIn string
---@return MediaTrack 
function reaper.BR_GetMediaTrackByGUID(proj, guidStringIn) end

---[BR] Get media track freeze count (if track isn't frozen at all, returns 0).
---@param track MediaTrack
---@return integer 
function reaper.BR_GetMediaTrackFreezeCount(track) end

---\[BR\] Get media track GUID as a string (guidStringOut_sz should be at least 64). To get media track back from GUID string, see [BR\_GetMediaTrackByGUID](#BR_GetMediaTrackByGUID).
---@param track MediaTrack
---@return string guidString
function reaper.BR_GetMediaTrackGUID(track) end

---\[BR\] Deprecated, see [GetSetMediaTrackInfo](#GetSetMediaTrackInfo) (REAPER v5.02+). Get media track layouts for MCP and TCP. Empty string ("") means that layout is set to the default layout. To set media track layouts, see [BR\_SetMediaTrackLayouts](#BR_SetMediaTrackLayouts).
---@param track MediaTrack
---@return string mcpLayoutName, string tcpLayoutName
function reaper.BR_GetMediaTrackLayouts(track) end

---\[BR\] Get track envelope for send/receive/hardware output.category is &lt;0 for receives, 0=sends, &gt;0 for hardware outputs
---sendidx is zero-based (see [GetTrackNumSends](#GetTrackNumSends) to count track sends/receives/hardware outputs)
---envelopeType determines which envelope is returned (0=volume, 1=pan, 2=mute)Note: To get or set other send attributes, see [BR\_GetSetTrackSendInfo](#BR_GetSetTrackSendInfo) and [BR\_GetMediaTrackSendInfo\_Track](#BR_GetMediaTrackSendInfo_Track).
---@param track MediaTrack
---@param category integer
---@param sendidx integer
---@param envelopeType integer
---@return TrackEnvelope 
function reaper.BR_GetMediaTrackSendInfo_Envelope(track, category, sendidx, envelopeType) end

---\[BR\] Get source or destination media track for send/receive.category is &lt;0 for receives, 0=sends
---sendidx is zero-based (see [GetTrackNumSends](#GetTrackNumSends) to count track sends/receives)
---trackType determines which track is returned (0=source track, 1=destination track)Note: To get or set other send attributes, see [BR\_GetSetTrackSendInfo](#BR_GetSetTrackSendInfo) and [BR\_GetMediaTrackSendInfo_Envelope](#BR_GetMediaTrackSendInfo_Envelope).
---@param track MediaTrack
---@param category integer
---@param sendidx integer
---@param trackType integer
---@return MediaTrack 
function reaper.BR_GetMediaTrackSendInfo_Track(track, category, sendidx, trackType) end

---[BR] Get MIDI take source length in PPQ. In case the take isn't MIDI, return value will be -1.
---@param take MediaItem_Take
---@return number 
function reaper.BR_GetMidiSourceLenPPQ(take) end

---[BR] Get MIDI take pool GUID as a string (guidStringOut_sz should be at least 64). Returns true if take is pooled.
---@param take MediaItem_Take
---@return boolean retval, string guidString
function reaper.BR_GetMidiTakePoolGUID(take) end

---[BR] Get "ignore project tempo" information for MIDI take. Returns true if take can ignore project tempo (no matter if it's actually ignored), otherwise false.
---@param take MediaItem_Take
---@return boolean retval, boolean ignoreProjTempo, number bpm, number num, number den
function reaper.BR_GetMidiTakeTempoInfo(take) end

---\[BR\] Get mouse cursor context. Each parameter returns information in a form of string as specified in the table below.To get more info on stuff that was found under mouse cursor see [BR\_GetMouseCursorContext\_Envelope](#BR_GetMouseCursorContext_Envelope), [BR\_GetMouseCursorContext\_Item](#BR_GetMouseCursorContext_Item), [BR\_GetMouseCursorContext\_MIDI](#BR_GetMouseCursorContext_MIDI), [BR\_GetMouseCursorContext\_Position](#BR_GetMouseCursorContext_Position), [BR\_GetMouseCursorContext\_Take](#BR_GetMouseCursorContext_Take), [BR\_GetMouseCursorContext\_Track](#BR_GetMouseCursorContext_Track)
---<table border='2'>
---<tr><th style='width:100px'>Window</th><th style='width:100px'>Segment</th><th style='width:300px'>Details</th></tr>
---<tr><th rowspan='1' align = 'center'>unknown</th><td>""</td><td>""</td></tr>
---<tr><th rowspan='4' align = 'center'>ruler</th><td>region\_lane </td><td>""</td></tr>
---<tr><td>marker\_lane </td><td>""</td></tr>
---<tr><td>tempo\_lane </td><td>""</td></tr>
---<tr><td>timeline</td><td>""</td></tr>
---<tr><th rowspan='1' align = 'center'>transport</th><td>""</td><td>""</td></tr>
---<tr><th rowspan='3' align = 'center'>tcp </th><td>track</td><td>""</td></tr>
---<tr><td>envelope</td><td>""</td></tr>
---<tr><td>empty</td><td>""</td></tr>
---<tr><th rowspan='2' align = 'center'>mcp </th><td>track</td><td>""</td></tr>
---<tr><td>empty</td><td>""</td></tr>
---<tr><th rowspan='3' align = 'center'>arrange</th><td>track</td><td>empty,item, item\_stretch\_marker,env\_point, env\_segment </td></tr>
---<tr><td>envelope</td><td>empty, env\_point, env\_segment</td></tr>
---<tr><td>empty</td><td>""</td></tr>
---<tr><th rowspan='5' align = 'center'>midi\_editor </th><td>unknown</td><td>""</td></tr>
---<tr><td>ruler</td><td>""</td></tr>
---<tr><td>piano</td><td>""</td></tr>
---<tr><td>notes</td><td>""</td></tr>
---<tr><td>cc\_lane</td><td>cc\_selector, cc\_lane</td></tr>
---</table>
---@return string window, string segment, string details
function reaper.BR_GetMouseCursorContext() end

---\[BR\] Returns envelope that was captured with the last call to [BR\_GetMouseCursorContext](#BR_GetMouseCursorContext). In case the envelope belongs to take, takeEnvelope will be true.
---@return TrackEnvelope retval, boolean takeEnvelope
function reaper.BR_GetMouseCursorContext_Envelope() end

---\[BR\] Returns item under mouse cursor that was captured with the last call to [BR\_GetMouseCursorContext](#BR_GetMouseCursorContext). Note that the function will return item even if mouse cursor is over some other track lane element like stretch marker or envelope. This enables for easier identification of items when you want to ignore elements within the item.
---@return MediaItem 
function reaper.BR_GetMouseCursorContext_Item() end

---\[BR\] Returns midi editor under mouse cursor that was captured with the last call to [BR\_GetMouseCursorContext](#BR_GetMouseCursorContext).inlineEditor: if mouse was captured in inline MIDI editor, this will be true (consequentially, returned MIDI editor will be NULL)
---noteRow: note row or piano key under mouse cursor (0-127)
---ccLane: CC lane under mouse cursor (CC0-127=CC, 0x100|(0-31)=14-bit CC, 0x200=velocity, 0x201=pitch, 0x202=program, 0x203=channel pressure, 0x204=bank/program select, 0x205=text, 0x206=sysex, 0x207=off velocity, 0x208=notation events)
---ccLaneVal: value in CC lane under mouse cursor (0-127 or 0-16383)
---ccLaneId: lane position, counting from the top (0 based)Note: due to API limitations, if mouse is over inline MIDI editor with some note rows hidden, noteRow will be -1
---@return identifier retval, boolean inlineEditor, number noteRow, number ccLane, number ccLaneVal, number ccLaneId
function reaper.BR_GetMouseCursorContext_MIDI() end

---\[BR\] Returns project time position in arrange/ruler/midi editor that was captured with the last call to [BR\_GetMouseCursorContext](#BR_GetMouseCursorContext).
---@return number 
function reaper.BR_GetMouseCursorContext_Position() end

---\[BR\] Returns id of a stretch marker under mouse cursor that was captured with the last call to [BR\_GetMouseCursorContext](#BR_GetMouseCursorContext).
---@return integer 
function reaper.BR_GetMouseCursorContext_StretchMarker() end

---\[BR\] Returns take under mouse cursor that was captured with the last call to [BR\_GetMouseCursorContext](#BR_GetMouseCursorContext).
---@return MediaItem_Take 
function reaper.BR_GetMouseCursorContext_Take() end

---\[BR\] Returns track under mouse cursor that was captured with the last call to [BR\_GetMouseCursorContext](#BR_GetMouseCursorContext).
---@return MediaTrack 
function reaper.BR_GetMouseCursorContext_Track() end

---\[BR\] Get next grid division after the time position. For more grid divisions function, see [BR\_GetClosestGridDivision](#BR_GetClosestGridDivision) and [BR\_GetPrevGridDivision](#BR_GetPrevGridDivision).
---@param position number
---@return number 
function reaper.BR_GetNextGridDivision(position) end

---\[BR\] Get previous grid division before the time position. For more grid division functions, see [BR\_GetClosestGridDivision](#BR_GetClosestGridDivision) and [BR\_GetNextGridDivision](#BR_GetNextGridDivision).
---@param position number
---@return number 
function reaper.BR_GetPrevGridDivision(position) end

---\[BR\] Get or set send attributes.category is &lt;0 for receives, 0=sends, &gt;0 for hardware outputs
---sendidx is zero-based (see [GetTrackNumSends](#GetTrackNumSends) to count track sends/receives/hardware outputs)
---To set attribute, pass setNewValue as trueList of possible parameters:    B\_MUTE : send mute state (1.0 if muted, otherwise 0.0)
---    B\_PHASE : send phase state (1.0 if phase is inverted, otherwise 0.0)
---    B\_MONO : send mono state (1.0 if send is set to mono, otherwise 0.0)
---    D\_VOL : send volume (1.0=+0dB etc...)
---    D\_PAN : send pan (-1.0=100%L, 0=center, 1.0=100%R)
---    D\_PANLAW : send pan law (1.0=+0.0db, 0.5=-6dB, -1.0=project default etc...)
---    I\_SENDMODE : send mode (0=post-fader, 1=pre-fx, 2=post-fx(deprecated), 3=post-fx)
---    I\_SRCCHAN : audio source starting channel index or -1 if audio send is disabled (&amp;1024=mono...note that in that case, when reading index, you should do (index XOR 1024) to get starting channel index)
---    I\_DSTCHAN : audio destination starting channel index (&amp;1024=mono (and in case of hardware output &amp;512=rearoute)...note that in that case, when reading index, you should do (index XOR (1024 OR 512)) to get starting channel index)
---    I\_MIDI\_SRCCHAN : source MIDI channel, -1 if MIDI send is disabled (0=all, 1-16)
---    I\_MIDI\_DSTCHAN : destination MIDI channel, -1 if MIDI send is disabled (0=original, 1-16)
---    I\_MIDI\_SRCBUS : source MIDI bus, -1 if MIDI send is disabled (0=all, otherwise bus index)
---    I\_MIDI\_DSTBUS : receive MIDI bus, -1 if MIDI send is disabled (0=all, otherwise bus index)
---    I\_MIDI\_LINK\_VOLPAN : link volume/pan controls to MIDINote: To get or set other send attributes, see [BR\_GetMediaTrackSendInfo\_Envelope](#BR_GetMediaTrackSendInfo_Envelope) and [BR\_GetMediaTrackSendInfo\_Track](#BR_GetMediaTrackSendInfo_Track).
---@param track MediaTrack
---@param category integer
---@param sendidx integer
---@param parmname string
---@param setNewValue boolean
---@param newValue number
---@return number 
function reaper.BR_GetSetTrackSendInfo(track, category, sendidx, parmname, setNewValue, newValue) end

---[BR] Returns FX count for supplied take
---@param take MediaItem_Take
---@return integer 
function reaper.BR_GetTakeFXCount(take) end

---[SWS] Check if take has MIDI inline editor open and returns true or false.
---@param take MediaItem_Take
---@return boolean 
function reaper.BR_IsMidiOpenInInlineEditor(take) end

---[BR] Check if take is MIDI take, in case MIDI take is in-project MIDI source data, inProjectMidiOut will be true, otherwise false.
---@param take MediaItem_Take
---@return boolean retval, boolean inProjectMidi
function reaper.BR_IsTakeMidi(take) end

---[BR] Get media item under mouse cursor. Position is mouse cursor position in arrange.
---@return MediaItem retval, number position
function reaper.BR_ItemAtMouseCursor() end

---[BR] Remove CC lane in midi editor. Top visible CC lane is laneId 0. Returns true on success
---@param midiEditor identifier
---@param laneId integer
---@return boolean 
function reaper.BR_MIDI_CCLaneRemove(midiEditor, laneId) end

---[BR] Replace CC lane in midi editor. Top visible CC lane is laneId 0. Returns true on success.
---Valid CC lanes: CC0-127=CC, 0x100|(0-31)=14-bit CC, 0x200=velocity, 0x201=pitch, 0x202=program, 0x203=channel pressure, 0x204=bank/program select, 0x205=text, 0x206=sysex, 0x207
---@param midiEditor identifier
---@param laneId integer
---@param newCC integer
---@return boolean 
function reaper.BR_MIDI_CCLaneReplace(midiEditor, laneId, newCC) end

---[BR] Get position at mouse cursor. To check ruler along with arrange, pass checkRuler=true. Returns -1 if cursor is not over arrange/ruler.
---@param checkRuler boolean
---@return number 
function reaper.BR_PositionAtMouseCursor(checkRuler) end

---\[BR\] Deprecated, see [GetSet\_ArrangeView2](#GetSet_ArrangeView2) (REAPER v5.12pre4+) -- Set start and end time position of arrange view. To get arrange view instead, see [BR\_GetArrangeView](#BR_GetArrangeView).
---@param proj ReaProject
---@param startTime number
---@param endTime number
function reaper.BR_SetArrangeView(proj, startTime, endTime) end

---[BR] Set item start and end edges' position - returns true in case of any changes
---@param item MediaItem
---@param startTime number
---@param endTime number
---@return boolean 
function reaper.BR_SetItemEdges(item, startTime, endTime) end

---\[BR\] Set image resource and its flags for a given item. To clear current image resource, pass imageIn as "".
---			imageFlags: &amp;1=0: don't display image, &amp;1: center / tile, &amp;3: stretch, &amp;5: full height (REAPER 5.974+).
---			To get image resource, see [BR\_GetMediaItemImageResource](#BR_GetMediaItemImageResource).
---@param item MediaItem
---@param imageIn string
---@param imageFlags integer
function reaper.BR_SetMediaItemImageResource(item, imageIn, imageFlags) end

---\[BR\] Set take media source properties. Returns false if take can't have them (MIDI items etc.). Section parameters have to be valid only when passing section=true.
---To get source properties, see [BR\_GetMediaSourceProperties](#BR_GetMediaSourceProperties).
---@param take MediaItem_Take
---@param section boolean
---@param start number
---@param length number
---@param fade number
---@param reverse boolean
---@return boolean 
function reaper.BR_SetMediaSourceProperties(take, section, start, length, fade, reverse) end

---\[BR\] Deprecated, see [GetSetMediaTrackInfo](#GetSetMediaTrackInfo) (REAPER v5.02+). Set media track layouts for MCP and TCP. To set default layout, pass empty string ("") as layout name. In case layouts were successfully set, returns true (if layouts are already set to supplied layout names, it will return false since no changes were made).
---To get media track layouts, see [BR\_GetMediaTrackLayouts](#BR_GetMediaTrackLayouts).
---@param track MediaTrack
---@param mcpLayoutNameIn string
---@param tcpLayoutNameIn string
---@return boolean 
function reaper.BR_SetMediaTrackLayouts(track, mcpLayoutNameIn, tcpLayoutNameIn) end

---[BR] Set "ignore project tempo" information for MIDI take. Returns true in case the take was successfully updated.
---@param take MediaItem_Take
---@param ignoreProjTempo boolean
---@param bpm number
---@param num integer
---@param den integer
---@return boolean 
function reaper.BR_SetMidiTakeTempoInfo(take, ignoreProjTempo, bpm, num, den) end

---\[BR\] Set new take source from file. To import MIDI file as in-project source data pass inProjectData=true. Returns false if failed.
---Any take source properties from the previous source will be lost - to preserve them, see [BR\_SetTakeSourceFromFile2](#BR_SetTakeSourceFromFile2).
---Note: To set source from existing take, see [SNM\_GetSetSourceState2](#SNM_GetSetSourceState2).
---@param take MediaItem_Take
---@param filenameIn string
---@param inProjectData boolean
---@return boolean 
function reaper.BR_SetTakeSourceFromFile(take, filenameIn, inProjectData) end

---\[BR\] Differs from [BR\_SetTakeSourceFromFile](#BR_SetTakeSourceFromFile) only that it can also preserve existing take media source properties.
---@param take MediaItem_Take
---@param filenameIn string
---@param inProjectData boolean
---@param keepSourceProperties boolean
---@return boolean 
function reaper.BR_SetTakeSourceFromFile2(take, filenameIn, inProjectData, keepSourceProperties) end

---[BR] Get take under mouse cursor. Position is mouse cursor position in arrange.
---@return MediaItem_Take retval, number position
function reaper.BR_TakeAtMouseCursor() end

---[BR] Get track under mouse cursor.
---Context signifies where the track was found: 0 = TCP, 1 = MCP, 2 = Arrange.
---Position will hold mouse cursor position in arrange if applicable.
---@return MediaTrack retval, number context, number position
function reaper.BR_TrackAtMouseCursor() end

---[BR] Get the exact name (like effect.dll, effect.vst3, etc...) of an FX.
---@param track MediaTrack
---@param fx integer
---@return boolean retval, string name
function reaper.BR_TrackFX_GetFXModuleName(track, fx) end

---\[BR\] Equivalent to win32 API GetPrivateProfileString(). For example, you can use this to get values from REAPER.iniIf you have multiple sections in that file with the same name, only the first one will be used, the rest will be ignored by Reaper.
---If you have multiple keys with the same name within a section, only the first one will be used, the rest will be ignored by Reaper.
---You can get the paths using [GetExePath](#GetExePath) for the Reaper-application-folder, [GetResourcePath](#GetResourcePath) for the ressources-folder or get\_ini\_file for the path+filename of the Reaper.ini-file.
---@param sectionName string
---@param keyName string
---@param defaultString string
---@param filePath string
---@return integer retval, string string
function reaper.BR_Win32_GetPrivateProfileString(sectionName, keyName, defaultString, filePath) end

---[BR] Equivalent to win32 API ShellExecute() with HWND set to main window
---@param operation string
---@param file string
---@param parameters string
---@param directory string
---@param showFlags integer
---@return integer 
function reaper.BR_Win32_ShellExecute(operation, file, parameters, directory, showFlags) end

---\[BR\] Equivalent to win32 API WritePrivateProfileString(). For example, you can use this to write to REAPER.iniIf you have multiple sections in that file with the same name, only the first one will be used, the rest will be ignored by Reaper.
---If you have multiple keys with the same name within a section, only the first one will be used, the rest will be ignored by Reaper.
---You can get the paths using [GetExePath](#GetExePath) for the Reaper-application-folder, [GetResourcePath](#GetResourcePath) for the ressources-folder or [get\_ini\_file](#get_ini_file) for the path+filename of the Reaper.ini-file.
---@param sectionName string
---@param keyName string
---@param value string
---@param filePath string
---@return boolean 
function reaper.BR_Win32_WritePrivateProfileString(sectionName, keyName, value, filePath) end

---Read the contents of the system clipboard.
---@return string text
function reaper.CF_GetClipboard() end

---\[DEPRECATED: Use [CF\_GetClipboard](#CF_GetClipboard)\] Read the contents of the system clipboard. See [SNM\_CreateFastString](#SNM_CreateFastString) and [SNM\_DeleteFastString](#SNM_DeleteFastString).
---@param output WDL_FastString
---@return string 
function reaper.CF_GetClipboardBig(output) end

---Write the given string into the system clipboard.
---@param str string
function reaper.CF_SetClipboard(str) end

---[FNG]Add MIDI note to MIDI take
---@param midiTake RprMidiTake
---@return RprMidiNote 
function reaper.FNG_AddMidiNote(midiTake) end

---[FNG]Allocate a RprMidiTake from a take pointer. Returns a NULL pointer if the take is not an in-project MIDI take
---@param take MediaItem_Take
---@return RprMidiTake 
function reaper.FNG_AllocMidiTake(take) end

---[FNG]Count of how many MIDI notes are in the MIDI take
---@param midiTake RprMidiTake
---@return integer 
function reaper.FNG_CountMidiNotes(midiTake) end

---[FNG]Commit changes to MIDI take and free allocated memory
---@param midiTake RprMidiTake
function reaper.FNG_FreeMidiTake(midiTake) end

---[FNG]Get a MIDI note from a MIDI take at specified index
---@param midiTake RprMidiTake
---@param index integer
---@return RprMidiNote 
function reaper.FNG_GetMidiNote(midiTake, index) end

---[FNG]Get MIDI note property
---@param midiNote RprMidiNote
---@param property string
---@return integer 
function reaper.FNG_GetMidiNoteIntProperty(midiNote, property) end

---[FNG]Set MIDI note property
---@param midiNote RprMidiNote
---@param property string
---@param value integer
function reaper.FNG_SetMidiNoteIntProperty(midiNote, property, value) end

---Full loudness analysis. retval: returns true on successful analysis, false on MIDI take or when analysis failed for some reason. analyzeTruePeak=true: Also do true peak analysis. Returns true peak value and true peak position (relative to item position). Considerably slower than without true peak analysis (since it uses oversampling). Note: Short term uses a time window of 3 sec. for calculation. So for items shorter than this shortTermMaxOut can't be calculated correctly. Momentary uses a time window of 0.4 sec.
---@param take MediaItem_Take
---@param analyzeTruePeak boolean
---@return boolean retval, number lufsIntegrated, number range, number truePeak, number truePeakPos, number shortTermMax, number momentaryMax
function reaper.NF_AnalyzeTakeLoudness(take, analyzeTruePeak) end

---Same as [NF\_AnalyzeTakeLoudness](#NF_AnalyzeTakeLoudness) but additionally returns shortTermMaxPos and momentaryMaxPos (in absolute project time). Note: shortTermMaxPos and momentaryMaxPos actually indicate the beginning of time *intervalls*, (3 sec. and 0.4 sec. resp.). 
---@param take MediaItem_Take
---@param analyzeTruePeak boolean
---@return boolean retval, number lufsIntegrated, number range, number truePeak, number truePeakPos, number shortTermMax, number momentaryMax, number shortTermMaxPos, number momentaryMaxPos
function reaper.NF_AnalyzeTakeLoudness2(take, analyzeTruePeak) end

---Does LUFS integrated analysis only. Faster than full loudness analysis ([NF\_AnalyzeTakeLoudness](#NF_AnalyzeTakeLoudness)) . Use this if only LUFS integrated is required.
---Take vol. env. is taken into account. See: [Signal flow](http://wiki.cockos.com/wiki/index.php/Measure_and_normalize_loudness_with_SWS).
---@param take MediaItem_Take
---@return boolean retval, number lufsIntegrated
function reaper.NF_AnalyzeTakeLoudness_IntegratedOnly(take) end

---Returns the average overall (non-windowed) RMS level of active channels of an audio item active take, post item gain, post take volume envelope, post-fade, pre fader, pre item FX. 
---Returns -150.0 if MIDI take or empty item.
---@param item MediaItem
---@return number 
function reaper.NF_GetMediaItemAverageRMS(item) end

---Returns the greatest max. peak value of all active channels of an audio item active take, post item gain, post take volume envelope, post-fade, pre fader, pre item FX. 
---Returns -150.0 if MIDI take or empty item.
---@param item MediaItem
---@return number 
function reaper.NF_GetMediaItemMaxPeak(item) end

---Returns the greatest overall (non-windowed) RMS peak level of all active channels of an audio item active take, post item gain, post take volume envelope, post-fade, pre fader, pre item FX. 
---Returns -150.0 if MIDI take or empty item.
---@param item MediaItem
---@return number 
function reaper.NF_GetMediaItemPeakRMS_NonWindowed(item) end

---Returns the average RMS peak level of all active channels of an audio item active take, post item gain, post take volume envelope, post-fade, pre fader, pre item FX. 
---Obeys 'Window size for peak RMS' setting in 'SWS: Set RMS analysis/normalize options' for calculation. Returns -150.0 if MIDI take or empty item.
---@param item MediaItem
---@return number 
function reaper.NF_GetMediaItemPeakRMS_Windowed(item) end

---\[S&amp;M\] Deprecated, see [CreateTrackSend](#CreateTrackSend) (v5.15pre1+). Adds a receive. Returns false if nothing updated.
---type -1=Default type (user preferences), 0=Post-Fader (Post-Pan), 1=Pre-FX, 2=deprecated, 3=Pre-Fader (Post-FX).
---Note: obeys default sends preferences, supports frozen tracks, etc..
---@param src MediaTrack
---@param dest MediaTrack
---@param type integer
---@return boolean 
function reaper.SNM_AddReceive(src, dest, type) end

---[S&amp;M] Add an FX parameter knob in the TCP. Returns false if nothing updated (invalid parameters, knob already present, etc..)
---@param tr MediaTrack
---@param fxId integer
---@param prmId integer
---@return boolean 
function reaper.SNM_AddTCPFXParm(tr, fxId, prmId) end

---\[S&amp;M\] Instantiates a new "fast string". You must delete this string, see [SNM\_DeleteFastString](#SNM_DeleteFastString).
---@param str string
---@return WDL_FastString 
function reaper.SNM_CreateFastString(str) end

---[S&amp;M] Deletes a "fast string" instance.
---@param str WDL_FastString
function reaper.SNM_DeleteFastString(str) end

---[S&amp;M] Returns a floating-point preference (look in project prefs first, then in general prefs). Returns errvalue if failed (e.g. varname not found).The settings can be from the Preferences, Project settings and Render-dialog, as well as numerous other settings, as e.g. set in the context menu of the transport-area.
---Some variables are bitfields, where each bit represents e.g a checkbox in the preferences.            
---@param varname string
---@param errvalue number
---@return number 
function reaper.SNM_GetDoubleConfigVar(varname, errvalue) end

---[S&amp;M] Gets the "fast string" content.
---@param str WDL_FastString
---@return string 
function reaper.SNM_GetFastString(str) end

---[S&amp;M] Gets the "fast string" length.
---@param str WDL_FastString
---@return integer 
function reaper.SNM_GetFastStringLength(str) end

---[S&amp;M] Returns an integer preference (look in project prefs first, then in general prefs). Returns errvalue if failed (e.g. varname not found).The settings can be from the Preferences, Project settings and Render-dialog, as well as numerous other settings, as e.g. set in the context menu of the transport-area.
---Some variables are bitfields, where each bit represents e.g a checkbox in the preferences.
---@param varname string
---@param errvalue integer
---@return integer retval
function reaper.SNM_GetIntConfigVar(varname, errvalue) end

---[S&amp;M] Reads a 64-bit integer preference split in two 32-bit integers (look in project prefs first, then in general prefs). Returns false if failed (e.g. varname not found).
---@param varname string
---@return boolean retval, number high, number low
function reaper.SNM_GetLongConfigVar(varname) end

---\[S&amp;M\] Gets a take by GUID as string. The GUID must be enclosed in braces {}. To get take GUID as string, see [BR\_GetMediaItemTakeGUID](#BR_GetMediaItemTakeGUID)
---@param project ReaProject
---@param guid string
---@return MediaItem_Take 
function reaper.SNM_GetMediaItemTakeByGUID(project, guid) end

---[S&amp;M] Gets a marker/region name. Returns true if marker/region found.
---@param proj ReaProject
---@param num integer
---@param isrgn boolean
---@param name WDL_FastString
---@return boolean 
function reaper.SNM_GetProjectMarkerName(proj, num, isrgn, name) end

---[S&amp;M] Gets or sets the state of a track, an item or an envelope. The state chunk size is unlimited. Returns false if failed.
---When getting a track state (and when you are not interested in FX data), you can use wantminimalstate=true to radically reduce the length of the state. Do not set such minimal states back though, this is for read-only applications!
---Note: unlike the native GetSetObjectState, calling to FreeHeapPtr() is not required.
---@param obj identifier
---@param state WDL_FastString
---@param setnewvalue boolean
---@param wantminimalstate boolean
---@return boolean 
function reaper.SNM_GetSetObjectState(obj, state, setnewvalue, wantminimalstate) end

---\[S&amp;M\] Gets or sets a take source state. Returns false if failed. Use takeidx=-1 to get/alter the active take.
---Note: this function does not use a MediaItem\_Take\* param in order to manage empty takes (i.e. takes with MediaItem\_Take\*==NULL), see [SNM\_GetSetSourceState2](#SNM_GetSetSourceState2).
---@param item MediaItem
---@param takeidxWDL_FastString integer
---@param setnewvalue boolean
---@return boolean 
function reaper.SNM_GetSetSourceState(item, takeidxWDL_FastString, setnewvalue) end

---\[S&amp;M\] Gets or sets a take source state. Returns false if failed.
---Note: this function cannot deal with empty takes, see [SNM\_GetSetSourceState](#SNM_GetSetSourceState).
---@param takeWDL_FastString MediaItem_Take
---@param setnewvalue boolean
---@return boolean 
function reaper.SNM_GetSetSourceState2(takeWDL_FastString, setnewvalue) end

---[S&amp;M] Deprecated, see [GetMediaSourceType](#GetMediaSourceType). Gets the source type of a take. Returns false if failed (e.g. take with empty source, etc..)
---@param takeWDL_FastString MediaItem_Take
---@return boolean 
function reaper.SNM_GetSourceType(takeWDL_FastString) end

---[S&amp;M] Deprecated, see TakeFX_/TrackFX_ CopyToTrack/Take, TrackFX/TakeFX _Delete (v5.95pre2+). Move or removes a track FX. Returns true if tr has been updated.
---fxId: fx index in chain or -1 for the selected fx. what: 0 to remove, -1 to move fx up in chain, 1 to move fx down in chain.
---@param tr MediaTrack
---@param fxId integer
---@param what integer
---@return boolean 
function reaper.SNM_MoveOrRemoveTrackFX(tr, fxId, what) end

---\[S&amp;M\] Reads a media file tag. Supported tags: "artist", "album", "genre", "comment", "title", "track" (track number) or "year". Returns false if tag was not found. See [SNM\_TagMediaFile](#SNM_TagMediaFile).
---@param fn string
---@param tag string
---@return boolean retval, string tagval
function reaper.SNM_ReadMediaFileTag(fn, tag) end

---\[S&amp;M\] Deprecated, see [RemoveTrackSend](#RemoveTrackSend) (v5.15pre1+). Removes a receive. Returns false if nothing updated.
---@param tr MediaTrack
---@param rcvidx integer
---@return boolean 
function reaper.SNM_RemoveReceive(tr, rcvidx) end

---[S&amp;M] Removes all receives from srctr. Returns false if nothing updated.
---@param tr MediaTrack
---@param srctr MediaTrack
---@return boolean 
function reaper.SNM_RemoveReceivesFrom(tr, srctr) end

---[S&amp;M] Select a bookmark of the Resources window. Returns the related bookmark id (or -1 if failed).
---@param name string
---@return integer 
function reaper.SNM_SelectResourceBookmark(name) end

---[S&amp;M] Sets a floating-point preference (look in project prefs first, then in general prefs). Returns false if failed (e.g. varname not found or newvalue out of range).
---        
---The settings can be from the Preferences, Project settings and Render-dialog, as well as numerous other settings, as e.g. set in the context menu of the transport-area.
---Some variables are bitfields, where each bit represents e.g a checkbox in the preferences.The changed settings are usually only changed within the running Reaper, but not stored in the config-files, so you need to do it manually or they get lost after Reaper is closed!
---@param varname string
---@param newvalue number
---@return boolean retval
function reaper.SNM_SetDoubleConfigVar(varname, newvalue) end

---[S&amp;M] Sets the "fast string" content. Returns str for facility.
---@param str WDL_FastString
---@param newstr string
---@return WDL_FastString 
function reaper.SNM_SetFastString(str, newstr) end

---[S&amp;M] Sets an integer preference (look in project prefs first, then in general prefs). Returns false if failed (e.g. varname not found).Some variables are bitfields, where each bit represents e.g a checkbox in the preferences.
---The changed settings are usually only changed within the running Reaper, but not stored in the config-files, so you need to do it manually or they get lost after Reaper is closed!
---@param varname string
---@param newvalue integer
---@return boolean retval
function reaper.SNM_SetIntConfigVar(varname, newvalue) end

---[S&amp;M] Sets a 64-bit integer preference from two 32-bit integers (look in project prefs first, then in general prefs). Returns false if failed (e.g. varname not found).Some variables are bitfields, where each bit represents e.g a checkbox in the preferences.
---The changed settings are usually only changed within the running Reaper, but not stored in the config-files, so you need to do it manually or they get lost after Reaper is closed!
---@param reaper boolean
---@param varname string
---@param newHighValue integer
---@param newLowValue integer
function reaper.SNM_SetLongConfigVar(reaper, varname, newHighValue, newLowValue) end

---\[S&amp;M\] Deprecated, see [SetProjectMarker4](#SetProjectMarker4) -- Same function as SetProjectMarker3() except it can set empty names "".
---@param proj ReaProject
---@param num integer
---@param isrgn boolean
---@param pos number
---@param rgnend number
---@param name string
---@param color integer
---@return boolean 
function reaper.SNM_SetProjectMarker(proj, num, isrgn, pos, rgnend, name, color) end

---\[S&amp;M\] Tags a media file thanks to [TagLib](https://taglib.github.io). Use an empty tagval to clear a tag. When a file is opened in REAPER, turn it offline before using this function. Returns false if nothing updated. See [SNM\_ReadMediaFileTag](#SNM_ReadMediaFileTag).
---@param fn string
---@param tag string
---@param tagval string
---@return boolean 
function reaper.SNM_TagMediaFile(fn, tag, tagval) end

---[S&amp;M] Attach Resources slot actions to a given bookmark.
---@param bookmarkId integer
function reaper.SNM_TieResourceSlotActions(bookmarkId) end

---Focuses the active/open MIDI editor.
function reaper.SN_FocusMIDIEditor() end

---\[ULT\]Get item notes.Gets the information from the NOTES-tag, as stored by [ULT\_SetMediaItemNote](#ULT_SetMediaItemNote).
---@param item MediaItem
---@return string 
function reaper.ULT_GetMediaItemNote(item) end

---\[ULT\]Set item notes.Will be added as new tag NOTES in the MediaItem-StateChunk. Can be read again with [ULT\_GetMediaItemNote](#ULT_GetMediaItemNote)
---@param item MediaItem
---@param note string
function reaper.ULT_SetMediaItemNote(item, note) end

---Returns the unsigned byte at address[offset]. Offset is added as steps of 1 byte each.
---@param pointer identifier
---@param offset integer
---@return number byte
function reaper.JS_Byte(pointer, offset) end

---Composites a LICE bitmap with a REAPER window. Each time that the window is re-drawn, the bitmap will be blitted over the window's client area (with per-pixel alpha blending).\* If dstw or dsth is -1, the bitmap will be stretched to fill the width or height of the window, respectively.\* autoUpdate is an optional parameter that is false by default. If true, JS\_Composite will automatically invalidate and re-draw the part of the window that covers the current position of the bitmap, and if the bitmap is being moved, also the previous position. (If only one or a handful of bitmaps are being moved across the screen, autoUpdate should result in smoother animation on WindowsOS; if numerous bitmaps are spread over the entire window, it may be faster to disable autoUpdate and instead call [JS\_Window\_InvalidateRect](#JS_Window_InvalidateRect) explicitly once all bitmaps have been moved.)\* InvalidateRect should also be called whenever the contents of the bitmap contents have been changed, but not the position, to trigger a window update.\* On WindowsOS, the key to reducing flickering is to slow down the frequency at which the window is re-drawn. InvalidateRect should only be called when absolutely necessary, preferably not more than 20 times per second. (Also refer to the [JS\_Composite\_Delay](#JS_Composite_Delay) function.)\* On WindowsOS, flickering can further be reduced by keeping the invalidated area as small as possible, covering only the bitmaps that have been edited or moved. However, if numerous bitmaps are spread over the entire window, it may be faster to simply invalidate the entire client area.\* This function should not be applied directly to top-level windows, but rather to child windows.\* Some classes of UI elements, particularly buttons, do not take kindly to being composited, and may crash REAPER.\* On WindowsOS, GDI blitting does not perform alpha multiplication of the source bitmap. For proper color rendering, a separate pre-multiplication step is therefore required, using either [LICE\_Blit](#LICE_Blit) or [LICE\_ProcessRect](#LICE_ProcessRect).Returns:
---1 if successful, otherwise -1 = windowHWND is not a window, -3 = Could not obtain the original window process, -4 = sysBitmap is not a LICE bitmap, -5 = sysBitmap is not a system bitmap, -6 = Could not obtain the window HDC, -7 = Error when subclassing to new window process.
---@param reaper integer
---@param windowHWND identifier
---@param dstx integer
---@param dsty integer
---@param dstw integer
---@param dsth integer
---@param sysBitmap identifier
---@param srcx integer
---@param srcy integer
---@param srcw integer
---@param srch integer
---@param boolean optional
function reaper.JS_Composite(reaper, windowHWND, dstx, dsty, dstw, dsth, sysBitmap, srcx, srcy, srcw, srch, boolean) end

---On WindowsOS, flickering of composited images can be improved considerably by slowing the refresh rate of the window. The optimal refresh rate may depend on the number of composited bitmaps.minTime is the minimum refresh delay, in seconds, when only one bitmap is composited onto the window. The delay time will increase linearly with the number of bitmaps, up to a maximum of maxTime when numBitmapsWhenMax is reached.If both minTime and maxTime are 0, all delay settings for the window are cleared.Returns:
---\* retval = 1 if successful, 0 if arguments are invalid (i.e. if maxTime &lt; minTime, or maxBitmaps &lt; 1).
---\* If delay times have not previously been set for this window, prev time values are 0.
---@param windowHWND identifier
---@param minTime number
---@param maxTime number
---@param numBitmapsWhenMax integer
---@return integer retval, number prevMinTime, number prevMaxTime, number prevBitmaps
function reaper.JS_Composite_Delay(windowHWND, minTime, maxTime, numBitmapsWhenMax) end

---Returns all bitmaps composited to the given window.The list is formatted as a comma-separated string of hexadecimal values, each representing a LICE_IBitmap\* pointer.retval is the number of linked bitmaps found, or negative if an error occured.
---@param windowHWND identifier
---@return integer retval, string list
function reaper.JS_Composite_ListBitmaps(windowHWND) end

---Unlinks the window and bitmap.			\* autoUpdate is an optional parameter. If unlinking a single bitmap and autoUpdate is true, the function will automatically re-draw the window to remove the blitted image.			If no bitmap is specified, all bitmaps composited to the window will be unlinked -- even those by other scripts.
---@param windowHWND identifier
---@param bitmap identifier
---@param autoUpdate unsupported
function reaper.JS_Composite_Unlink(windowHWND, bitmap, autoUpdate) end

---Returns the 8-byte floating point value at address[offset]. Offset is added as steps of 8 bytes each.
---@param address identifier
---@param pointer integer
---@return number double
function reaper.JS_Double(address, pointer) end

---Returns information about a file.cTime is not implemented on all systems. If it does return a time, the value may differ depending on the OS: on WindowsOS, it may refer to the time that the file was either created or copied, whereas on Linux and macOS, it may refer to the time of last status change.retval is 0 if successful, negative if not.
---@param filePath string
---@return integer retval, number size, string accessedTime, string modifiedTime, string cTime, number deviceID, number deviceSpecialID, number inode, number mode, number numLinks, number ownerUserID, number ownerGroupID
function reaper.JS_File_Stat(filePath) end

---Blits between two device contexts, which may include LICE "system bitmaps".			mode: Optional parameter. "SRCCOPY" by default, or specify "ALPHA" to enable per-pixel alpha blending.			WARNING: On WindowsOS, GDI\_Blit does not perform alpha multiplication of the source bitmap. For proper color rendering, a separate pre-multiplication step is therefore required, using either LICE\_Blit or LICE\_ProcessRect.
---@param destHDC identifier
---@param dstx integer
---@param dsty integer
---@param sourceHDC identifier
---@param srcx integer
---@param srxy integer
---@param width integer
---@param height integer
---@param string optional
function reaper.JS_GDI_Blit(destHDC, dstx, dsty, sourceHDC, srcx, srxy, width, height, string) end

---@param reaper identifier
---@param color integer
function reaper.JS_GDI_CreateFillBrush(reaper, color) end

---Parameters:
---           
---\* weight: 0 - 1000, with 0 = auto, 400 = normal and 700 = bold.
---           
---\* angle: the angle, in tenths of degrees, between the text and the x-axis of the device.
---           
---\* fontName: If empty string "", uses first font that matches the other specified attributes.
---           
---           
---           
---           Note: Text color must be set separately.
---@param reaper identifier
---@param height integer
---@param weight integer
---@param angle integer
---@param italic boolean
---@param underline boolean
---@param strike boolean
---@param fontName string
function reaper.JS_GDI_CreateFont(reaper, height, weight, angle, italic, underline, strike, fontName) end

---@param reaper identifier
---@param width integer
---@param color integer
function reaper.JS_GDI_CreatePen(reaper, width, color) end

---@param GDIObject identifier
function reaper.JS_GDI_DeleteObject(GDIObject) end

---Parameters:
---           
---\* align: Combination of: "TOP", "VCENTER", "LEFT", "HCENTER", "RIGHT", "BOTTOM", "WORDBREAK", "SINGLELINE", "NOCLIP", "CALCRECT", "NOPREFIX" or "ELLIPSIS"
---@param reaper integer
---@param deviceHDC identifier
---@param text string
---@param len integer
---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
---@param align string
function reaper.JS_GDI_DrawText(reaper, deviceHDC, text, len, left, top, right, bottom, align) end

---@param deviceHDC identifier
---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
function reaper.JS_GDI_FillEllipse(deviceHDC, left, top, right, bottom) end

---packedX and packedY are strings of points, each packed as "&lt;i4".
---@param deviceHDC identifier
---@param packedX string
---@param packedY string
---@param numPoints integer
function reaper.JS_GDI_FillPolygon(deviceHDC, packedX, packedY, numPoints) end

---@param deviceHDC identifier
---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
function reaper.JS_GDI_FillRect(deviceHDC, left, top, right, bottom) end

---@param deviceHDC identifier
---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
---@param xrnd integer
---@param yrnd integer
function reaper.JS_GDI_FillRoundRect(deviceHDC, left, top, right, bottom, xrnd, yrnd) end

---Returns the device context for the client area of the specified window.
---@param reaper identifier
---@param windowHWND identifier
function reaper.JS_GDI_GetClientDC(reaper, windowHWND) end

---Returns a device context for the entire screen.
---           
---           
---           
---           WARNING: Only available on Windows, not Linux or MacOS.
---@param reaper identifier
function reaper.JS_GDI_GetScreenDC(reaper) end

---@param reaper integer
---@param GUIElement string
function reaper.JS_GDI_GetSysColor(reaper, GUIElement) end

---@param reaper integer
---@param deviceHDC identifier
function reaper.JS_GDI_GetTextColor(reaper, deviceHDC) end

---Returns the device context for the entire window, including title bar and frame.
---@param reaper identifier
---@param windowHWND identifier
function reaper.JS_GDI_GetWindowDC(reaper, windowHWND) end

---@param deviceHDC identifier
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
function reaper.JS_GDI_Line(deviceHDC, x1, y1, x2, y2) end

---packedX and packedY are strings of points, each packed as "&lt;i4".
---@param deviceHDC identifier
---@param packedX string
---@param packedY string
---@param numPoints integer
function reaper.JS_GDI_Polyline(deviceHDC, packedX, packedY, numPoints) end

---To release a window HDC, both arguments must be supplied: the HWND as well as the HDC. To release a screen DC, only the HDC needs to be supplied.For compatibility with previous versions, the HWND and HDC can be supplied in any order.NOTE: Any GDI HDC should be released immediately after drawing, and deferred scripts should get and release new DCs in each cycle.
---@param windowHWND identifier
---@param deviceHDC identifier
function reaper.JS_GDI_ReleaseDC(windowHWND, deviceHDC) end

---Activates a font, pen, or fill brush for subsequent drawing in the specified device context.
---@param reaper identifier
---@param deviceHDC identifier
---@param GDIObject identifier
function reaper.JS_GDI_SelectObject(reaper, deviceHDC, GDIObject) end

---@param deviceHDC identifier
---@param x integer
---@param y integer
---@param color integer
function reaper.JS_GDI_SetPixel(deviceHDC, x, y, color) end

---@param deviceHDC identifier
---@param color integer
function reaper.JS_GDI_SetTextBkColor(deviceHDC, color) end

---@param deviceHDC identifier
---@param mode integer
function reaper.JS_GDI_SetTextBkMode(deviceHDC, mode) end

---@param deviceHDC identifier
---@param color integer
function reaper.JS_GDI_SetTextColor(deviceHDC, color) end

---Blits between two device contexts, which may include LICE "system bitmaps".			modeOptional: "SRCCOPY" by default, or specify "ALPHA" to enable per-pixel alpha blending.			WARNING: On WindowsOS, GDI\_Blit does not perform alpha multiplication of the source bitmap. For proper color rendering, a separate pre-multiplication step is therefore required, using either LICE\_Blit or LICE\_ProcessRect.
---@param destHDC identifier
---@param dstx integer
---@param dsty integer
---@param dstw integer
---@param dsth integer
---@param sourceHDC identifier
---@param srcx integer
---@param srxy integer
---@param srcw integer
---@param srch integer
---@param string optional
function reaper.JS_GDI_StretchBlit(destHDC, dstx, dsty, dstw, dsth, sourceHDC, srcx, srxy, srcw, srch, string) end

---Returns the 4-byte signed integer at address[offset]. Offset is added as steps of 4 bytes each.
---@param pointer identifier
---@param offset integer
---@return number int
function reaper.JS_Int(pointer, offset) end

---Hue is rolled over, saturation and value are clamped, all 0..1. (Alpha remains unchanged.)
---@param bitmap identifier
---@param hue number
---@param saturation number
---@param value number
function reaper.JS_LICE_AlterBitmapHSV(bitmap, hue, saturation, value) end

---Hue is rolled over, saturation and value are clamped, all 0..1. (Alpha remains unchanged.)
---@param bitmap identifier
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param hue number
---@param saturation number
---@param value number
function reaper.JS_LICE_AlterRectHSV(bitmap, x, y, w, h, hue, saturation, value) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param cx number
---@param cy number
---@param r number
---@param minAngle number
---@param maxAngle number
---@param color integer
---@param alpha number
---@param mode string
---@param antialias boolean
function reaper.JS_LICE_Arc(bitmap, cx, cy, r, minAngle, maxAngle, color, alpha, mode, antialias) end

---@param reaperarray identifier
---@return integer retval
function reaper.JS_LICE_ArrayAllBitmaps(reaperarray) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable per-pixel alpha blending.LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param xstart number
---@param ystart number
---@param xctl1 number
---@param yctl1 number
---@param xctl2 number
---@param yctl2 number
---@param xend number
---@param yend number
---@param tol number
---@param color integer
---@param alpha number
---@param mode string
---@param antialias boolean
function reaper.JS_LICE_Bezier(bitmap, xstart, ystart, xctl1, yctl1, xctl2, yctl2, xend, yend, tol, color, alpha, mode, antialias) end

---Standard LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable per-pixel alpha blending.In addition to the standard LICE modes, LICE\_Blit also offers:
---\* "CHANCOPY\_XTOY", with X and Y any of the four channels, A, R, G or B. (CHANCOPY\_ATOA is similar to MASK mode.)
---\* "BLUR"
---\* "ALPHAMUL", which overwrites the destination with a per-pixel alpha-multiplied copy of the source. (Similar to first clearing the destination with 0x00000000 and then blitting with "COPY,ALPHA".)
---@param destBitmap identifier
---@param dstx integer
---@param dsty integer
---@param sourceBitmap identifier
---@param srcx integer
---@param srcy integer
---@param width integer
---@param height integer
---@param alpha number
---@param mode string
function reaper.JS_LICE_Blit(destBitmap, dstx, dsty, sourceBitmap, srcx, srcy, width, height, alpha, mode) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
---           
---           
---           
---           LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param cx number
---@param cy number
---@param r number
---@param color integer
---@param alpha number
---@param mode string
---@param antialias boolean
function reaper.JS_LICE_Circle(bitmap, cx, cy, r, color, alpha, mode, antialias) end

---@param bitmap identifier
---@param color integer
function reaper.JS_LICE_Clear(bitmap, color) end

---@param reaper identifier
---@param isSysBitmap boolean
---@param width integer
---@param height integer
function reaper.JS_LICE_CreateBitmap(reaper, isSysBitmap, width, height) end

---@param reaper identifier
function reaper.JS_LICE_CreateFont(reaper) end

---Deletes the bitmap, and also unlinks bitmap from any composited window.
---@param bitmap identifier
function reaper.JS_LICE_DestroyBitmap(bitmap) end

---@param LICEFont identifier
function reaper.JS_LICE_DestroyFont(LICEFont) end

---@param bitmap identifier
---@param x integer
---@param y integer
---@param c integer
---@param color integer
---@param alpha number
---@param mode integer
function reaper.JS_LICE_DrawChar(bitmap, x, y, c, color, alpha, mode) end

---@param reaper integer
---@param bitmap identifier
---@param LICEFont identifier
---@param text string
---@param textLen integer
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
function reaper.JS_LICE_DrawText(reaper, bitmap, LICEFont, text, textLen, x1, y1, x2, y2) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
---           
---           
---           
---           LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param cx number
---@param cy number
---@param r number
---@param color integer
---@param alpha number
---@param mode string
---@param antialias boolean
function reaper.JS_LICE_FillCircle(bitmap, cx, cy, r, color, alpha, mode, antialias) end

---packedX and packedY are two strings of coordinates, each packed as "&lt;i4".LICE modes : "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable per-pixel alpha blending.LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param packedX string
---@param packedY string
---@param numPoints integer
---@param color integer
---@param alpha number
---@param mode string
function reaper.JS_LICE_FillPolygon(bitmap, packedX, packedY, numPoints, color, alpha, mode) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
---           
---           
---           
---           LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param color integer
---@param alpha number
---@param mode string
function reaper.JS_LICE_FillRect(bitmap, x, y, w, h, color, alpha, mode) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
---           
---           
---           
---           LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param x3 integer
---@param y3 integer
---@param color integer
---@param alpha number
---@param mode string
function reaper.JS_LICE_FillTriangle(bitmap, x1, y1, x2, y2, x3, y3, color, alpha, mode) end

---@param reaper identifier
---@param bitmap identifier
function reaper.JS_LICE_GetDC(reaper, bitmap) end

---@param reaper integer
---@param bitmap identifier
function reaper.JS_LICE_GetHeight(reaper, bitmap) end

---Returns the color of the specified pixel.
---@param reaper integer
---@param bitmap identifier
---@param x integer
---@param y integer
function reaper.JS_LICE_GetPixel(reaper, bitmap, x, y) end

---@param reaper integer
---@param bitmap identifier
function reaper.JS_LICE_GetWidth(reaper, bitmap) end

---@param bitmap identifier
---@param dstx integer
---@param dsty integer
---@param dstw integer
---@param dsth integer
---@param ir number
---@param ig number
---@param ib number
---@param ia number
---@param drdx number
---@param dgdx number
---@param dbdx number
---@param dadx number
---@param drdy number
---@param dgdy number
---@param dbdy number
---@param dady number
---@param mode string
function reaper.JS_LICE_GradRect(bitmap, dstx, dsty, dstw, dsth, ir, ig, ib, ia, drdx, dgdx, dbdx, dadx, drdy, dgdy, dbdy, dady, mode) end

---@param reaper boolean
---@param bitmap identifier
function reaper.JS_LICE_IsFlipped(reaper, bitmap) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
---           
---           
---           
---           LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param color integer
---@param alpha number
---@param mode string
---@param antialias boolean
function reaper.JS_LICE_Line(bitmap, x1, y1, x2, y2, color, alpha, mode, antialias) end

---@return integer retval, string list
function reaper.JS_LICE_ListAllBitmaps() end

---Returns a system LICE bitmap containing the JPEG.
---@param reaper identifier
---@param filename string
function reaper.JS_LICE_LoadJPG(reaper, filename) end

---Returns a system LICE bitmap containing the PNG.
---@param reaper identifier
---@param filename string
function reaper.JS_LICE_LoadPNG(reaper, filename) end

---@param text string
---@return number width, number Height
function reaper.JS_LICE_MeasureText(text) end

---Applies bitwise operations to each pixel in the target rectangle.operand: a color in 0xAARRGGBB format.modes:
---\* "XOR", "OR" or "AND".
---\* "SET\_XYZ", with XYZ any combination of A, R, G, and B: copies the specified channels from operand to the bitmap. (Useful for setting the alpha values of a bitmap.)
---\* "ALPHAMUL": Performs alpha pre-multiplication on each pixel in the rect. operand is ignored in this mode. (On WindowsOS, GDI\_Blit does not perform alpha multiplication on the fly, and a separate alpha pre-multiplication step is therefore required.)NOTE:
---LICE\_Blit and LICE\_ScaledBlit are also useful for processing bitmap colors. For example, to multiply all channel values by 1.5:
---reaper.JS\_LICE\_Blit(bitmap, x, y, bitmap, x, y, w, h, 0.5, "ADD").
---@param reaper boolean
---@param bitmap identifier
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param mode string
---@param operand number
function reaper.JS_LICE_ProcessRect(reaper, bitmap, x, y, w, h, mode, operand) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
---           
---           
---           
---           LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param x integer
---@param y integer
---@param color integer
---@param alpha number
---@param mode string
function reaper.JS_LICE_PutPixel(bitmap, x, y, color, alpha, mode) end

---@param bitmap identifier
---@param width integer
---@param height integer
function reaper.JS_LICE_Resize(bitmap, width, height) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable per-pixel alpha blending.
---@param destBitmap identifier
---@param dstx integer
---@param dsty integer
---@param dstw integer
---@param dsth integer
---@param sourceBitmap identifier
---@param srcx number
---@param srcy number
---@param srcw number
---@param srch number
---@param angle number
---@param rotxcent number
---@param rotycent number
---@param cliptosourcerect boolean
---@param alpha number
---@param mode string
function reaper.JS_LICE_RotatedBlit(destBitmap, dstx, dsty, dstw, dsth, sourceBitmap, srcx, srcy, srcw, srch, angle, rotxcent, rotycent, cliptosourcerect, alpha, mode) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
---           
---           
---           
---           LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
---@param bitmap identifier
---@param x number
---@param y number
---@param w number
---@param h number
---@param cornerradius integer
---@param color integer
---@param alpha number
---@param mode string
---@param antialias boolean
function reaper.JS_LICE_RoundRect(bitmap, x, y, w, h, cornerradius, color, alpha, mode, antialias) end

---LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable per-pixel alpha blending.
---@param destBitmap identifier
---@param dstx integer
---@param dsty integer
---@param dstw integer
---@param dsth integer
---@param srcBitmap identifier
---@param srcx number
---@param srcy number
---@param srcw number
---@param srch number
---@param alpha number
---@param mode string
function reaper.JS_LICE_ScaledBlit(destBitmap, dstx, dsty, dstw, dsth, srcBitmap, srcx, srcy, srcw, srch, alpha, mode) end

---Sets all pixels that match the given color's RGB values to fully transparent, and all other pixels to fully opaque. (All pixels' RGB values remain unchanged.)
---@param bitmap identifier
---@param colorRGB integer
function reaper.JS_LICE_SetAlphaFromColorMask(bitmap, colorRGB) end

---@param LICEFont identifier
---@param color integer
function reaper.JS_LICE_SetFontBkColor(LICEFont, color) end

---@param LICEFont identifier
---@param color integer
function reaper.JS_LICE_SetFontColor(LICEFont, color) end

---Converts a GDI font into a LICE font.
---           
---           The font can be modified by the following flags, in a comma-separated list:
---           
---           "VERTICAL", "BOTTOMUP", "NATIVE", "BLUR", "INVERT", "MONO", "SHADOW" or "OUTLINE".
---@param LICEFont identifier
---@param GDIFont identifier
---@param moreFormats string
function reaper.JS_LICE_SetFontFromGDI(LICEFont, GDIFont, moreFormats) end

---Parameters:\* quality is an integer in the range 1..100.
---\* forceBaseline is an optional boolean parameter that ensures compatibility with all JPEG viewers by preventing too low quality, "cubist" settings. 
---@param reaper boolean
---@param filenameLICE_IBitmap string
---@param quality integer
---@param boolean optional
function reaper.JS_LICE_WriteJPG(reaper, filenameLICE_IBitmap, quality, boolean) end

---Writes the contents of a LICE_IBitMap as png-file.
---@param reaper boolean
---@param filenameLICE_IBitmap string
---@param wantAlpha boolean
function reaper.JS_LICE_WritePNG(reaper, filenameLICE_IBitmap, wantAlpha) end

---@param listviewHWND identifier
---@param index integer
---@param partialOK boolean
function reaper.JS_ListView_EnsureVisible(listviewHWND, index, partialOK) end

---Returns the translation of the given US English text, according to the currently loaded Language Pack.Parameters:
---\* LangPackSection: Language Packs are divided into sections such as "common" or "DLG\_102".
---\* In Lua, by default, text of up to 1024 chars can be returned. To increase (or reduce) the default buffer size, a string and size can be included as optional 3rd and 4th arguments.Example: reaper.JS\_Localize("Actions", "common", "", 20)
---@param USEnglish string
---@param LangPackSection string
---@return string translation
function reaper.JS_Localize(USEnglish, LangPackSection) end

---Returns the addresses of all open MIDI windows (whether docked or not).
---           
---\* The addresses are stored in the provided reaper.array.
---           
---\* Each address can be converted to a REAPER object (HWND) by the function JS\_Window\_HandleFromAddress.
---@param reaperarray identifier
function reaper.JS_MIDIEditor_ArrayAll(reaperarray) end

---Returns a list of HWNDs of all open MIDI windows (whether docked or not).
---           
---\* The list is formatted as a comma-separated (and terminated) string of hexadecimal values.
---           
---\* Each value is an address that can be converted to a HWND by the function JS\_Window\_HandleFromAddress.
---@param buf string
---@return string buf
function reaper.JS_MIDIEditor_ListAll(buf) end

---Allocates memory for general use by functions that require memory buffers.
---@param reaper identifier
---@param sizeBytes integer
function reaper.JS_Mem_Alloc(reaper, sizeBytes) end

---Frees memory that was previously allocated by JS\_Mem\_Alloc.
---@param reaper identifier
---@param sizeBytes integer
function reaper.JS_Mem_Alloc(reaper, sizeBytes) end

---Copies a packed string into a memory buffer.
---@param reaper boolean
---@param mallocPointer identifier
---@param offset integer
---@param packedString string
---@param stringLength integer
function reaper.JS_Mem_FromString(reaper, mallocPointer, offset, packedString, stringLength) end

---On Windows, retrieves a handle to the current mouse cursor.
---On Linux and macOS, retrieves a handle to the last cursor set by REAPER or its extensions via SWELL.
---@return identifier 
function reaper.JS_Mouse_GetCursor() end

---Retrieves the states of mouse buttons and modifiers keys.
---           
---           
---           
---           Parameters:
---           
---\* flags, state: The parameter and the return value both use the same format as gfx.mouse_cap. I.e., to get the states of the left mouse button and the ctrl key, use flags = 0b00000101.use -1 as flags to retrieve the states of all mouse-buttons and modifier
---@param reaper integer
---@param flags integer
function reaper.JS_Mouse_GetState(reaper, flags) end

---Loads a cursor by number.
---           
---           cursorNumber: Same as used for gfx.setcursor, and includes some of Windows' predefined cursors (with numbers &gt; 32000; refer to documentation for the Win32 C++ function LoadCursor), and REAPER's own cursors (with numbers &lt; 2000). 
---           
---           If successful, returns a handle to the cursor, which can be used in [JS\_Mouse\_SetCursor](#JS_Mouse_SetCursor).
---@param reaper identifier
---@param cursorNumber integer
function reaper.JS_Mouse_LoadCursor(reaper, cursorNumber) end

---Loads a cursor from a .cur file.
---           
---If omitted or false, and if the .cur file has already been loaded previously during the REAPER session, the file will not be re-loaded, and the previous handle will be returned, thereby (slightly) improving speed and (slighty) lowering memory usage.
---If true, the file will be re-loaded and a new handle will be returned.
---           
---If successful, returns a handle to the cursor, which can be used in [JS\_Mouse\_SetCursor](#JS_Mouse_SetCursor).
---forceNewLoad is an optional boolean parameter:
---@param reaper identifier
---@param pathAndFileName string
---@param boolean optional
function reaper.JS_Mouse_LoadCursorFromFile(reaper, pathAndFileName, boolean) end

---Sets the mouse cursor.  (Only lasts while script is running, and for a single "defer" cycle.)
---@param cursorHandle identifier
function reaper.JS_Mouse_SetCursor(cursorHandle) end

---Moves the mouse cursor to the specified coordinates.
---@param reaper boolean
---@param x integer
---@param y integer
function reaper.JS_Mouse_SetPosition(reaper, x, y) end

---@param reaper identifier
---@param s string
function reaper.JS_PtrFromStr(reaper, s) end

---Returns the version of the js_ReaScriptAPI extension.
---@return number version
function reaper.JS_ReaScriptAPI_Version() end

---Returns the memory contents starting at address[offset] as a packed string. Offset is added as steps of 1 byte (char) each.
---@param pointer identifier
---@param offset integer
---@param lengthChars integer
---@return boolean retval, string buf
function reaper.JS_String(pointer, offset, lengthChars) end

---Returns a 255-byte array that specifies which virtual keys, from 0x01 to 0xFF, have sent KEYDOWN messages since cutoffTime.Notes:
---* Mouse buttons and modifier keys are not (currently) reliably detected, and JS\_Mouse\_GetState can be used instead.
---* Auto-repeated KEYDOWN messages are ignored.
---@param cutoffTime number
---@return string state
function reaper.JS_VKeys_GetDown(cutoffTime) end

---deprecated
function reaper.JS_VKeys_ClearHistory() end

---deprecated
---@return boolean retval, string state
function reaper.JS_VKeys_GetHistory() end

---Retrieves the current states (0 or 1) of all virtual keys, from 0x01 to 0xFF, in a 255-byte array.cutoffTime: A key is only regarded as down if it sent a KEYDOWN message after the cut-off time, not followed by KEYUP. (This is useful for excluding old KEYDOWN messages that weren't properly followed by KEYUP.) 
---If cutoffTime is positive, is it interpreted as absolute time in similar format as time_precise().
---If cutoffTime is negative, it is relative to the current time.Notes:
---Notes:
---* Mouse buttons and modifier keys are not (currently) reliably detected, and JS\_Mouse\_GetState can be used instead.
---* Auto-repeated KEYDOWN messages are ignored.
---@return boolean retval, string state
function reaper.JS_VKeys_GetState() end

---Return a 255-byte array that specifies which virtual keys, from 0x01 to 0xFF, have sent KEYUP messages since cutoffTime.Note: Mouse buttons and modifier keys are not (currently) reliably detected, and [JS\_Mouse\_GetState](#JS_Mouse_GetState) can be used instead.
---@param cutoffTime number
---@return string state
function reaper.JS_VKeys_GetUp(cutoffTime) end

---Intercepting (blocking) virtual keys work similar to the native function PreventUIRefresh: Each key has a (non-negative) intercept state, and the key is passed through as usual if the state equals 0, or blocked if the state is greater than 0.keyCode: The virtual key code of the key, or -1 to change the state of all keys.intercept: A script can increase the intercept state by passing +1, or lower the state by passing -1. 
---Multiple scripts can block the same key, and the intercept state may reach up to 255. 
---If zero is passed, the intercept state is not changed, but the current state is returned.Returns: If keyCode refers to a single key, the intercept state of that key is returned. If keyCode = -1, the state of the key that is most strongly blocked (highest intercept state) is returned.
---@param keyCode integer
---@param intercept integer
---@return integer retval
function reaper.JS_VKeys_Intercept(keyCode, intercept) end

---Intercepts window messages to specified window.Parameters: * message: a single message type to be intercepted, either in WM_ or hexadecimal format. For example "WM_SETCURSOR" or "0x0020". * passThrough: Whether message should be blocked (false) or passed through (true) to the window.    For more information on message codes, refer to the Win32 C++ API documentation.    For a list of message types that are valid cross-platform, refer to swell-types.h. Only these will be recognized by WM_ name.Returns: * 1: Success. * 0: The message type is already being intercepted by another script. * -2: message string could not be parsed. * -3: Failure getting original window process / window not valid. * -6: Could not obtain the window client HDC.
---Notes: * Intercepted messages can be polled using JS_WindowMessage_Peek. * Intercepted messages can be edited, if necessary, and then forwarded to their original destination using JS_WindowMessage_Post or JS_WindowMessage_Send. * To check whether a message type is being blocked or passed through, Peek the message type, or retrieve the entire List of intercepts. * Mouse events are typically received by the child window under the mouse, not the parent window.
--- 
--- Keyboard events are usually *not* received by any individual window. To intercept keyboard events, use the VKey functions.
---@param reaper integer
---@param windowHWND identifier
---@param messages string
---@param passThrough boolean
function reaper.JS_WindowMessage_Intercept(reaper, windowHWND, messages, passThrough) end

---Intercepts window messages to specified window.
---           
---           
---           
---           Parameters:
---           
---* messages: comma-separated string of message types to be intercepted (either in WM_ or hexadecimal format), each with a "block" or "passthrough" modifier to specify whether the message should be blocked or passed through to the window. For example "WM_SETCURSOR:block, 0x0201:passthrough".
---           
---   For more information on message codes, refer to the Win32 C++ API documentation.
---           
---   For a list of message types that are valid cross-platform, refer to swell-types.h. Only these will be recognized by WM_ name.
---           
---           
---           
---           Returns:
---           
---* 1: Success.
---           
---* 0: The message type is already being intercepted by another script.
---           
---* -1: windowHWND is not a valid window.
---           
---* -2: message string could not be parsed.
---           
---* -3: Failure getting original window process.
---           
---* -6: Could not obtain the window client HDC.
---           
---           Notes:
---           
---* Intercepted messages can be polled using JS_WindowMessage_Peek.
---           
---* Intercepted messages can be edited, if necessary, and then forwarded to their original destination using JS_WindowMessage_Post or JS_WindowMessage_Send.
---           
---* To check whether a message type is being blocked or passed through, Peek the message type, or retrieve the entire List of intercepts.
---@param reaper integer
---@param windowHWND identifier
---@param messages string
function reaper.JS_WindowMessage_InterceptList(reaper, windowHWND, messages) end

---Returns a string with a list of all message types currently being intercepted for the specified window.
---@param windowHWND identifier
---@param buf string
---@return boolean retval, string buf
function reaper.JS_WindowMessage_ListIntercepts(windowHWND, buf) end

---Changes the passthrough setting of a message type that is already being intercepted.Returns 1 if successful, 0 if the message type is not yet being intercepted, or -2 if the argument could not be parsed.
---@param reaper integer
---@param windowHWND identifier
---@param message string
---@param passThrough boolean
function reaper.JS_WindowMessage_PassThrough(reaper, windowHWND, message, passThrough) end

---Polls the state of an intercepted message.
---           
---           
---           
---           Parameters:
---           
---* message: String containing a single message name, such as "WM_SETCURSOR", or in hexadecimal format, "0x0020".
---           
---(For a list of message types that are valid cross-platform, refer to swell-types.h. Only these will be recognized by WM_ name.)
---           
---           
---           
---           Returns:
---           
---* A retval of false indicates that the message type is not being intercepted in the specified window.
---           
---* All messages are timestamped. A time of 0 indicates that no message if this type has been intercepted yet.
---           
---* For more information about wParam and lParam for different message types, refer to Win32 C++ documentation.
---           
---* For example, in the case of mousewheel, returns mousewheel delta, modifier keys, x position and y position.
---           
---* wParamHigh, lParamLow and lParamHigh are signed, whereas wParamLow is unsigned.
---@param windowHWND identifier
---@param message string
---@return boolean retval, boolean passedThrough, number time, number wParamLow, number wParamHigh, number lParamLow, number lParamHigh
function reaper.JS_WindowMessage_Peek(windowHWND, message) end

---If the specified window and message type are not currently being intercepted by a script, this function will post the message in the message queue of the specified window, and return without waiting.If the window and message type are currently being intercepted, the message will be sent directly to the original window process, similar to WindowMessage_Send, thereby skipping any intercepts.Parameters:
---* message: String containing a single message name, such as "WM_SETCURSOR", or in hexadecimal format, "0x0020".
---(For a list of WM_ and CB_ message types that are valid cross-platform, refer to swell-types.h. Only these will be recognized by WM_ or CB_ name.)
---* wParam, wParamHigh, lParam and lParamHigh: Low and high 16-bit WORDs of the WPARAM and LPARAM parameters.
---(Most window messages encode separate information into the two WORDs. However, for those rare cases in which the entire WPARAM and LPARAM must be used to post a large pointer, the script can store this address in wParam or lParam, and keep wParamHigh and lParamHigh zero.)Notes:
---* For more information about parameter values, refer to documentation for the Win32 C++ function PostMessage.
---* Messages should only be sent to windows that were created from the main thread.
---* Useful for simulating mouse clicks and calling mouse modifier actions from scripts.
---@param windowHWND identifier
---@param message string
---@param wParam number
---@param wParamHighWord integer
---@param lParam number
---@param lParamHighWord integer
---@return boolean retval
function reaper.JS_WindowMessage_Post(windowHWND, message, wParam, wParamHighWord, lParam, lParamHighWord) end

---Release intercepts of specified message types.
---           
---           Parameters:
---           
---* messages: "WM_SETCURSOR,WM_MOUSEHWHEEL" or "0x0020,0x020E", for example.
---@param reaper integer
---@param windowHWND identifier
---@param messages string
function reaper.JS_WindowMessage_Release(reaper, windowHWND, messages) end

---Release script intercepts of window messages for all windows.
function reaper.JS_WindowMessage_ReleaseAll() end

---Release script intercepts of window messages for specified window.
---@param windowHWND identifier
function reaper.JS_WindowMessage_ReleaseWindow(windowHWND) end

---Sends a message to the specified window by calling the window process directly, and only returns after the message has been processed. Any intercepts of the message by scripts will be skipped, and the message can therefore not be blocked.Parameters:
---* message: String containing a single message name, such as "WM_SETCURSOR", or in hexadecimal format, "0x0020".
---(For a list of WM_ and CB_ message types that are valid cross-platform, refer to swell-types.h. Only these will be recognized by WM_ or CB_ name.)
---* wParam, wParamHigh, lParam and lParamHigh: Low and high 16-bit WORDs of the WPARAM and LPARAM parameters.
---(Most window messages encode separate information into the two WORDs. However, for those rare cases in which the entire WPARAM and LPARAM must be used to post a large pointer, the script can store this address in wParam or lParam, and keep wParamHigh and lParamHigh zero.)Notes:
---* For more information about parameter and return values, refer to documentation for the Win32 C++ function SendMessage.
---* Messages should only be sent to windows that were created from the main thread.
---* Useful for simulating mouse clicks and calling mouse modifier actions from scripts.
---@param reaper integer
---@param windowHWND identifier
---@param message string
---@param wParam number
---@param wParamHighWord integer
---@param lParam number
---@param lParamHighWord integer
function reaper.JS_WindowMessage_Send(reaper, windowHWND, message, wParam, wParamHighWord, lParam, lParamHighWord) end

---@param handle identifier
---@return number address
function reaper.JS_Window_AddressFromHandle(handle) end

---Returns all child windows of the specified parent.
---           
---           
---           
---           The addresses are stored in the provided reaper.array, and can be converted to REAPER objects (HWNDs) by the function JS_Window_HandleFromAddress.
---@param parentHWND identifier
---@param reaperarray identifier
function reaper.JS_Window_ArrayAllChild(parentHWND, reaperarray) end

---Returns all top-level windows.
---           
---           
---           
---           The addresses are stored in the provided reaper.array, and can be converted to REAPER objects (HWNDs) by the function JS_Window_HandleFromAddress.
---@param reaperarray identifier
function reaper.JS_Window_ArrayAllTop(reaperarray) end

---Returns all windows, whether top-level or child, whose titles match the specified string.
---           
---           
---           
---           The addresses are stored in the provided reaper.array, and can be converted to REAPER objects (HWNDs) by the function JS_Window_HandleFromAddress.
---           
---           
---           
---           Parameters: * exact: Match entire title exactly, or match substring of title.
---@param title string
---@param exact boolean
---@param reaperarray identifier
function reaper.JS_Window_ArrayFind(title, exact, reaperarray) end

---@param windowHWND identifier
function reaper.JS_Window_AttachResizeGrip(windowHWND) end

---Attaches a "pin on top" button to the window frame. The button should remember its state when closing and re-opening the window.WARNING: This function does not yet work on Linux.
---@param windowHWND identifier
---@return identifier HWND
function reaper.JS_Window_AttachTopmostPin(windowHWND) end

---Converts the client-area coordinates of a specified point to screen coordinates.
---@param windowHWND identifier
---@param x integer
---@param y integer
---@return number x, number y
function reaper.JS_Window_ClientToScreen(windowHWND, x, y) end

---Creates a modeless window with WS\_OVERLAPPEDWINDOW style and only rudimentary features. Scripts can paint into the window using GDI or LICE/Composite functions (and JS\_Window\_InvalidateRect to trigger re-painting).style: An optional parameter that overrides the default style. The string may include any combination of standard window styles, such as "POPUP" for a frameless window, or "CAPTION,SIZEBOX,SYSMENU" for a standard framed window.On Linux and macOS, "MAXIMIZE" has not yet been implemented, and the remaining styles may appear slightly different from their WindowsOS counterparts.className: On Windows, only standard ANSI characters are supported.ownerHWND: Optional parameter, only available on WindowsOS. Usually either the REAPER main window or another script window, and useful for ensuring that the created window automatically closes when the owner is closed.NOTE: On Linux and macOS, the window contents are only updated \*between\* defer cycles, so the window cannot be animated by for/while loops within a single defer cycle.
---@param title string
---@param className string
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param string optional
---@param ownerHWND identifier
---@return identifier retval, optional string
function reaper.JS_Window_Create(title, className, x, y, w, h, string, ownerHWND) end

---Destroys the specified window.
---@param windowHWND identifier
function reaper.JS_Window_Destroy(windowHWND) end

---Enables or disables mouse and keyboard input to the specified window or control.
---@param windowHWND identifier
---@param enable boolean
function reaper.JS_Window_Enable(windowHWND, enable) end

---On macOS, returns the Metal graphics setting:
---			2 = Metal enabled and support GetDC()/ReleaseDC() for drawing (more overhead).
---			1 = Metal enabled.
---			0 = N/A (Windows and Linux).
---			-1 = non-metal async layered mode.
---			-2 = non-metal non-async layered mode.			WARNING: If using mode -1, any BitBlt()/StretchBlt() MUST have the source bitmap persist. If it is resized after Blit it could cause crashes.
---@param windowHWND identifier
---@return integer retval
function reaper.JS_Window_EnableMetal(windowHWND) end

---Returns a HWND to a window whose title matches the specified string.
---\* Unlike the Win32 function FindWindow, this function searches top-level as well as child windows, so that the target window can be found irrespective of docked state.
---\* In addition, the function can optionally match substrings of the title.
---\* Matching is not case sensitive.Parameters:
---\* exact: Match entire title, or match substring of title.
---@param reaper identifier
---@param title string
---@param exact boolean
function reaper.JS_Window_Find(reaper, title, exact) end

---Returns a HWND to a child window whose title matches the specified string.Parameters: \* exact: Match entire title length, or match substring of title. In both cases, matching is not case sensitive.
---@param reaper identifier
---@param parentHWND identifier
---@param title string
---@param exact boolean
function reaper.JS_Window_FindChild(reaper, parentHWND, title, exact) end

---Similar to the C++ WIN32 function GetDlgItem, this function finds child windows by ID.(The ID of a window may be retrieved by JS\_Window\_GetLongPtr.)For instance: with Reaper's [MainHWND](#GetMainHwnd), you can get:
---    0: Transport(Windows)/MainHWND(Mac)
---    999: project-tabs(if existing, otherwise will be nil)
---    1000: trackview
---    1005: timeline
---    1259: Mouse editing help in the area beneath the track control panels
---@param parentHWND identifier
---@param ID integer
---@return identifier HWND
function reaper.JS_Window_FindChildByID(parentHWND, ID) end

---Returns a handle to a child window whose class and title match the specified strings.Parameters: \* childWindow: The function searches child windows, beginning with the window *after* the specified child window. If childHWND is equal to parentHWND, the search begins with the first child window of parentHWND.
---\* title: An empty string, "", will match all windows. (Search is not case sensitive.)
---@param HWND identifier
---@param parentHWND identifier
---@param childHWND identifier
---@param className string
---@param title string
function reaper.JS_Window_FindEx(HWND, parentHWND, childHWND, className, title) end

---Returns a HWND to a top-level window whose title matches the specified string.Parameters:
---\* exact: Match entire title length, or match substring of title. In both cases, matching is not case sensitive.
---@param reaper identifier
---@param title string
---@param exact boolean
function reaper.JS_Window_FindTop(reaper, title, exact) end

---Retrieves a HWND to the window that contains the specified point.
---@param reaper identifier
---@param x integer
---@param y integer
function reaper.JS_Window_FromPoint(reaper, x, y) end

---WARNING: May not be fully implemented on MacOS and Linux.
---@param windowHWND identifier
---@param buf string
---@return string buf
function reaper.JS_Window_GetClassName(windowHWND, buf) end

---Retrieves the coordinates of the client area rectangle of the specified window. The dimensions are given in screen coordinates relative to the upper-left corner of the screen.
---           
---           NOTE 1: Unlike the C++ function GetClientRect, this function returns the actual coordinates, not the width and height.
---           
---           NOTE 2: The pixel at (right, bottom) lies immediately outside the rectangle.
---@param windowHWND identifier
---@return boolean retval, number left, number top, number right, number bottom
function reaper.JS_Window_GetClientRect(windowHWND) end

---Retrieves a HWND to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
---@param windowHWND identifier
---@return boolean retval, number width, number height
function reaper.JS_Window_GetClientSize(windowHWND) end

---Retrieves a HWND to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
---@param reaper identifier
function reaper.JS_Window_GetFocus(reaper) end

---Retrieves a HWND to the top-level foreground window (the window with which the user is currently working).
---@param reaper identifier
function reaper.JS_Window_GetForeground(reaper) end

---In the case of "DLGPROC" and "WNDPROC", the return values can be converted to pointers by [JS\_Window\_HandleFromAddress](#JS_Window_HandleFromAddress).		   If the function fails, the return value is 0.
---@param windowHWND identifier
---@param info string
---@return number retval
function reaper.JS_Window_GetLong(windowHWND, info) end

---Returns information about the specified window.
---           
---           
---           
---           info: "USERDATA", "WNDPROC", "DLGPROC", "ID", "EXSTYLE" or "STYLE".
---           
---           
---           
---           For documentation about the types of information returned, refer to the Win32 function GetWindowLongPtr.
---		   The values returned by "DLGPROC" and "WNDPROC" are typically used as-is, as pointers, whereas the others should first be converted to integers.
---@param reaper identifier
---@param windowHWND identifier
---@param info string
function reaper.JS_Window_GetLongPtr(reaper, windowHWND, info) end

---Retrieves a HWND to the specified window's parent or owner.
---           
---           Returns NULL if the window is unowned or if the function otherwise fails.
---@param reaper identifier
---@param windowHWND identifier
function reaper.JS_Window_GetParent(reaper, windowHWND) end

---Retrieves the coordinates of the bounding rectangle of the specified window. The dimensions are given in screen coordinates relative to the upper-left corner of the screen.
---           
---           NOTE: The pixel at (right, bottom) lies immediately outside the rectangle.
---@param windowHWND identifier
---@return boolean retval, number left, number top, number right, number bottom
function reaper.JS_Window_GetRect(windowHWND) end

---Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
---           
---           relation: "LAST", "NEXT", "PREV", "OWNER" or "CHILD".
---           
---           (Refer to documentation for Win32 C++ function GetWindow.)
---@param reaper identifier
---@param windowHWND identifier
---@param relation string
function reaper.JS_Window_GetRelated(reaper, windowHWND, relation) end

---Retrieves the scroll information of a window.
---           
---           
---           
---           Parameters:
---           
---\* scrollbar: "v" (or "SB\_VERT", or "VERT") for vertical scroll, "h" (or "SB\_HORZ" or "HORZ") for horizontal.
---           
---           
---           
---           Returns:
---           
---\* Leftmost or topmost visible pixel position, as well as the visible page size, the range minimum and maximum, and scroll box tracking position.
---@param windowHWND identifier
---@param scrollbar string
---@return boolean retval, number position, number pageSize, number min, number max, number trackPos
function reaper.JS_Window_GetScrollInfo(windowHWND, scrollbar) end

---Returns the title (if any) of the specified window.
---@param windowHWND identifier
---@return string title
function reaper.JS_Window_GetTitle(windowHWND) end

---Retrieves the dimensions of the display monitor that has the largest area of intersection with the specified rectangle.If the monitor is not the primary display, some of the rectangle's coordinates may be negative.wantWork: Returns the work area of the display, which excludes the system taskbar or application desktop toolbars.
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param wantWork boolean
---@return number left, number top, number right, number bottom
function reaper.JS_Window_GetViewportFromRect(x1, y1, x2, y2, wantWork) end

---Converts an address to a handle (such as a HWND) that can be utilized by REAPER and other API functions.
---@param reaper identifier
---@param address number
function reaper.JS_Window_HandleFromAddress(reaper, address) end

---Similar to the Win32 function InvalidateRect.
---@param windowHWND identifier
---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
---@param eraseBackground boolean
---@return boolean retval
function reaper.JS_Window_InvalidateRect(windowHWND, left, top, right, bottom, eraseBackground) end

---Determines whether a window is a child window or descendant window of a specified parent window.
---@param reaper boolean
---@param parentHWND identifier
---@param childHWND identifier
function reaper.JS_Window_IsChild(reaper, parentHWND, childHWND) end

---Determines the visibility state of the window.
---@param reaper boolean
---@param windowHWND identifier
function reaper.JS_Window_IsVisible(reaper, windowHWND) end

---Determines whether the specified window handle identifies an existing window.On macOS and Linux, only windows that were created by WDL/swell will be identified (and only such windows should be acted on by scripts).NOTE: Since REAPER v5.974, windows can be checked using the native function ValidatePtr(windowHWND, "HWND").
---@param reaper boolean
---@param windowHWND identifier
function reaper.JS_Window_IsWindow(reaper, windowHWND) end

---Finds all child windows of the specified parent.Returns:
---\* retval: The number of windows found; negative if an error occurred.
---\* list: A comma-separated string of hexadecimal values.
---Each value is an address that can be converted to a HWND by the function JS\_Window\_HandleFromAddress.
---@param parentHWND identifier
---@return integer retval, string list
function reaper.JS_Window_ListAllChild(parentHWND) end

---Finds all top-level windows.Returns:
---\* retval: The number of windows found; negative if an error occurred.
---\* list: A comma-separated string of hexadecimal values. Each value is an address that can be converted to a HWND by the function JS\_Window\_HandleFromAddress.
---@return integer retval, string list
function reaper.JS_Window_ListAllTop() end

---Finds all windows (whether top-level or child) whose titles match the specified string.Returns:
---\* retval: The number of windows found; negative if an error occurred.
---\* list: A comma-separated string of hexadecimal values. Each value is an address that can be converted to a HWND by the function JS\_Window\_HandleFromAddress.Parameters:
---\* exact: Match entire title exactly, or match substring of title.
---@param title string
---@param exact boolean
---@return integer retval, string list
function reaper.JS_Window_ListFind(title, exact) end

---Deprecated - use [GetViewportFromRect](#GetViewportFromRect) instead.
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param wantWork boolean
---@return number left, number top, number right, number bottom
function reaper.JS_Window_MonitorFromRect(x1, y1, x2, y2, wantWork) end

---Changes the position of the specified window, keeping its size constant.NOTES:
---* For top-level windows, position is relative to the primary display.
---* On Windows and Linux, position is calculated as the coordinates of the upper left corner of the window, relative to upper left corner of the primary display, and the positive Y-axis points downward.
---* On macOS, position is calculated as the coordinates of the bottom left corner of the window, relative to bottom left corner of the display, and the positive Y-axis points upward.
---* For a child window, on all platforms, position is relative to the upper-left corner of the parent window's client area.
---* Equivalent to calling [JS\_Window\_SetPosition](#JS_Window_SetPosition) with NOSIZE, NOZORDER, NOACTIVATE and NOOWNERZORDER flags set.
---@param windowHWND identifier
---@param left integer
---@param top integer
function reaper.JS_Window_Move(windowHWND, left, top) end

---Sends a "WM\_COMMAND" message to the specified window, which simulates a user selecting a command in the window menu.This function is similar to Main\_OnCommand and MIDIEditor\_OnCommand, but can send commands to any window that has a menu.In the case of windows that are listed among the Action list's contexts (such as the Media Explorer), the commandIDs of the actions in the Actions list may be used.
---@param windowHWND identifier
---@param commandID integer
---@return boolean retval
function reaper.JS_Window_OnCommand(windowHWND, commandID) end

---deprecated, removed from JS_0.952 and later
---@param reaper boolean
---@param windowHWND identifier
---@param remove boolean
function reaper.JS_Window_RemoveXPStyle(reaper, windowHWND, remove) end

---Changes the dimensions of the specified window, keeping the top left corner position constant.
---           
---* If resizing script GUIs, call gfx.update() after resizing.* Equivalent to calling [JS\_Window\_SetPosition](#JS_Window_SetPosition) with NOMOVE, NOZORDER, NOACTIVATE and NOOWNERZORDER flags set.
---@param windowHWND identifier
---@param width integer
---@param height integer
function reaper.JS_Window_Resize(windowHWND, width, height) end

---Converts the screen coordinates of a specified point on the screen to client-area coordinates.
---@param windowHWND identifier
---@param x integer
---@param y integer
---@return number x, number y
function reaper.JS_Window_ScreenToClient(windowHWND, x, y) end

---Sets the keyboard focus to the specified window.
---@param windowHWND identifier
function reaper.JS_Window_SetFocus(windowHWND) end

---Brings the specified window into the foreground, activates the window, and directs keyboard input to it.
---@param windowHWND identifier
function reaper.JS_Window_SetForeground(windowHWND) end

---Similar to the Win32 function SetWindowLongPtr. info: "USERDATA", "WNDPROC", "DLGPROC", "ID", "EXSTYLE" or "STYLE", and only on WindowOS, "INSTANCE" and "PARENT".
---@param windowHWND identifier
---@param info string
---@param value number
---@return number retval
function reaper.JS_Window_SetLong(windowHWND, info, value) end

---Sets the window opacity.Parameters:  
---mode: either "ALPHA" or "COLOR".  
---value: If ALPHA, the specified value may range from zero to one, and will apply to the entire window, frame included.  
---If COLOR, value specifies a 0xRRGGBB color, and all pixels of this color will be made transparent. (All mouse clicks over transparent pixels will pass through, too).  WARNING: COLOR mode is only available in Windows, not Linux or macOS.Transparency can only be applied to top-level windows. If windowHWND refers to a child window, the entire top-level window that contains windowHWND will be made transparent.  
---@param reaper boolean
---@param windowHWND identifier
---@param mode string
---@param value number
function reaper.JS_Window_SetOpacity(reaper, windowHWND, mode, value) end

---If successful, returns a handle to the previous parent window.
---@param reaper identifier
---@param childHWND identifier
---@param parentHWND identifier
function reaper.JS_Window_SetParent(reaper, childHWND, parentHWND) end

---Interface to the Win32/swell function SetWindowPos, with which window position, size, Z-order and visibility can be set, and new frame styles can be applied.ZOrder and flags are optional parameters. If no arguments are supplied, the window will simply be moved and resized, as if the NOACTIVATE, NOZORDER, NOOWNERZORDER flags were set.
---\* ZOrder: "BOTTOM", "TOPMOST", "NOTOPMOST", "TOP" or a window HWND converted to a string, for example by the Lua function tostring.
---\* flags: Any combination of the standard flags, of which "NOMOVE", "NOSIZE", "NOZORDER", "NOACTIVATE", "SHOWWINDOW", "FRAMECHANGED" and "NOCOPYBITS" should be valid cross-platform.
---@param windowHWND identifier
---@param left integer
---@param top integer
---@param width integer
---@param height integer
---@param string optional
---@param string optional
---@return boolean retval, optional string, optional string
function reaper.JS_Window_SetPosition(windowHWND, left, top, width, height, string, string) end

---Parameters:
---           
---* scrollbar: "v" (or "SB_VERT", or "VERT") for vertical scroll, "h" (or "SB_HORZ" or "HORZ") for horizontal.
---           
---           
---           
---           NOTE: API functions can scroll REAPER's windows, but cannot zoom them.  Instead, use actions such as "View: Zoom to one loop iteration".
---@param reaper boolean
---@param windowHWND identifier
---@param scrollbar string
---@param position integer
function reaper.JS_Window_SetScrollPos(reaper, windowHWND, scrollbar, position) end

---Sets and applies a window style.style may include any combination of standard window styles, such as "POPUP" for a frameless window, or "CAPTION,SIZEBOX,SYSMENU" for a standard framed window.On Linux and macOS, "MAXIMIZE" has not yet been implmented, and the remaining styles may appear slightly different from their WindowsOS counterparts.
---@param windowHWND identifier
---@param style string
---@return boolean retval, string style
function reaper.JS_Window_SetStyle(windowHWND, style) end

---Changes the title of the specified window. Returns true if successful.
---@param reaper boolean
---@param windowHWND identifier
---@param title string
function reaper.JS_Window_SetTitle(reaper, windowHWND, title) end

---Sets the window Z order.
---* Equivalent to calling JS_Window_SetPos with flags NOMOVE | NOSIZE.
---* Not all the Z orders have been implemented in Linux yet.Parameters:
---* ZOrder: "BOTTOM", "TOPMOST", "NOTOPMOST", "TOP", or a window HWND converted to a string, for example by the Lua function tostring.* InsertAfterHWND: For compatibility with older versions, this parameter is still available, and is optional. If ZOrder is "INSERTAFTER", insertAfterHWND must be a handle to the window behind which windowHWND will be placed in the Z order, equivalent to setting ZOrder to this HWND; otherwise, insertAfterHWND is ignored and can be left out (or it can simply be set to the same value as windowHWND).
---@param reaper boolean
---@param windowHWND identifier
---@param ZOrder string
---@param insertAfterHWND identifier
function reaper.JS_Window_SetZOrder(reaper, windowHWND, ZOrder, insertAfterHWND) end

---Sets the specified window's show state.Parameters:
---\* state: One of the following options: "SHOW", "SHOWNA" (or "SHOWNOACTIVATE"), "SHOWMINIMIZED", "HIDE", "NORMAL", "SHOWNORMAL", "SHOWMAXIMIZED", "SHOWDEFAULT" or "RESTORE".On Linux and macOS, only the first four options are fully implemented.
---@param windowHWND identifier
---@param state string
function reaper.JS_Window_Show(windowHWND, state) end

---Similar to the Win32 function UpdateWindow.
---@param windowHWND identifier
function reaper.JS_Window_Update(windowHWND) end

---retval is 1 if a folder was selected, 0 if the user canceled the dialog, and -1 if an error occurred.
---@param caption string
---@param initialFolder string
---@return integer retval, string folder
function reaper.JS_Dialog_BrowseForFolder(caption, initialFolder) end

---If allowMultiple is true, multiple files may be selected. The returned string is \0-separated, with the first substring containing the folder path and subsequent substrings containing the file names.
---* On macOS, the first substring may be empty, and each file name will then contain its entire path.
---* This function only allows selection of existing files, and does not allow creation of new files.extensionList is a string containing pairs of \0-terminated substrings. The last substring must be terminated by two \0 characters. Each pair defines one filter pattern:
---* The first substring in each pair describes the filter in user-readable form (for example, "Lua script files (*.lua)") and will be displayed in the dialog box.
---* The second substring specifies the filter that the operating system must use to search for the files (for example, "*.txt"; the wildcard should not be omitted). To specify multiple extensions for a single display string, use a semicolon to separate the patterns (for example, "*.lua;*.eel").An example of an extensionList string:
---"ReaScript files\0*.lua;*.eel\0Lua files (.lua)\0*.lua\0EEL files (.eel)\0*.eel\0\0".On macOS, file dialogs do not accept empty extensionLists, nor wildcard extensions (such as "All files\0*.*\0\0"), so each acceptable extension must be listed explicitly. On Linux and Windows, wildcard extensions are acceptable, and if the extensionList string is empty, the dialog will display a default "All files (*.*)" filter.retval is 1 if one or more files were selected, 0 if the user cancelled the dialog, or negative if an error occurred.Displaying \0-separated strings:
---* REAPER's IDE and ShowConsoleMsg only display strings up to the first \0 byte. If multiple files were selected, only the first substring containing the path will be displayed. This is not a problem for Lua or EEL, which can access the full string beyond the first \0 byte as usual.
---@param windowTitle string
---@param initialFolder string
---@param initialFile string
---@param extensionList string
---@param allowMultiple boolean
---@return integer retval, string fileNames
function reaper.JS_Dialog_BrowseForOpenFiles(windowTitle, initialFolder, initialFile, extensionList, allowMultiple) end

---Opens a file-chooser-dialog for saving operations.retval is 1 if a file was selected, 0 if the user cancelled the dialog, or negative if an error occurred.extensionList is a string containing pairs of 0-terminated substrings. The last substring must be terminated by two 0 characters. Each pair defines one filter pattern:
---* The first substring in each pair describes the filter in user-readable form (for example, "Lua script files (*.lua)") and will be displayed in the dialog box.
---* The second substring specifies the filter that the operating system must use to search for the files (for example, "*.txt"; the wildcard should not be omitted). To specify multiple extensions for a single display string, use a semicolon to separate the patterns (for example, "*.lua;*.eel").An example of an extensionList string:
---"ReaScript files\0*.lua;*.eel\0Lua files (.lua)\0*.lua\0EEL files (.eel)\0*.eel\0\0".If the extensionList string is empty, it will display the default "All files (*.*)" filter.
---@param windowTitle string
---@param initialFolder string
---@param initialFile string
---@param extensionList string
---@return integer retval, string fileName
function reaper.JS_Dialog_BrowseForSaveFile(windowTitle, initialFolder, initialFile, extensionList) end

---Returns the index of the next selected list item with index greater that the specified number. Returns -1 if no selected items left.
---@param reaper integer
---@param listviewHWND identifier
---@param index integer
function reaper.JS_ListView_EnumSelItems(reaper, listviewHWND, index) end

---Returns the index and text of the focused item, if any.
---@param listviewHWND identifier
---@return integer retval, string text
function reaper.JS_ListView_GetFocusedItem(listviewHWND) end

---Returns the text and state of specified item.
---@param listviewHWND identifier
---@param index integer
---@param subItem integer
---@return string text, number state
function reaper.JS_ListView_GetItem(listviewHWND, index, subItem) end

---@param listviewHWND identifier
---@return integer retval
function reaper.JS_ListView_GetItemCount(listviewHWND) end

---Returns client coordinates of the item.
---@param listviewHWND identifier
---@param index integer
---@return boolean retval, number left, number top, number right, number bottom
function reaper.JS_ListView_GetItemRect(listviewHWND, index) end

---State is a bitmask:
---1 = selected, 2 = focused. On Windows only, cut-and-paste marked = 4, drag-and-drop highlighted = 8.Warning: this function uses the Win32 bitmask values, which differ from the values used by WDL/swell.
---@param listviewHWND identifier
---@param index integer
---@return integer retval
function reaper.JS_ListView_GetItemState(listviewHWND, index) end

---@param listviewHWND identifier
---@param index integer
---@param subItem integer
---@return string text
function reaper.JS_ListView_GetItemText(listviewHWND, index, subItem) end

---@param listviewHWND identifier
---@return integer retval
function reaper.JS_ListView_GetSelectedCount(listviewHWND) end

---@param reaper integer
---@param listviewHWND identifier
function reaper.JS_ListView_GetTopIndex(reaper, listviewHWND) end

---@param listviewHWND identifier
---@param clientX integer
---@param clientY integer
---@return number index, number subItem, number flags
function reaper.JS_ListView_HitTest(listviewHWND, clientX, clientY) end

---Returns the indices of all selected items as a comma-separated list.* retval: Number of selected items found; negative or zero if an error occured.
---@param listviewHWND identifier
---@return integer retval, string items
function reaper.JS_ListView_ListAllSelItems(listviewHWND) end

---The mask parameter specifies the state bits that must be set, and the state parameter specifies the new values for those bits.1 = selected, 2 = focused. On Windows only, cut-and-paste marked = 4, drag-and-drop highlighted = 8.Warning: this function uses the Win32 bitmask values, which differ from the values used by WDL/swell.
---@param listviewHWND identifier
---@param index integer
---@param state integer
---@param mask integer
function reaper.JS_ListView_SetItemState(listviewHWND, index, state, mask) end

---Currently, this fuction only accepts ASCII text.
---@param listviewHWND identifier
---@param index integer
---@param subItem integer
---@param text string
function reaper.JS_ListView_SetItemText(listviewHWND, index, subItem, text) end

---Creates writer for 32 bit floating point WAV
---@param reaper AudioWriter
---@param filename string
---@param numchans integer
---@param samplerate integer
function reaper.Xen_AudioWriter_Create(reaper, filename, numchans, samplerate) end

---Destroys writer
---@param writer AudioWriter
function reaper.Xen_AudioWriter_Destroy(writer) end

---Write interleaved audio data to disk
---@param reaper integer
---@param writer AudioWriter
---@param numframes integer
---@param data identifier
---@param offset integer
function reaper.Xen_AudioWriter_Write(reaper, writer, numframes, data, offset) end

---Get interleaved audio data from media source
---@param reaper integer
---@param src PCM_source
---@param destbuf identifier
---@param destbufoffset integer
---@param numframes integer
---@param numchans integer
---@param samplerate number
---@param sourceposition number
function reaper.Xen_GetMediaSourceSamples(reaper, src, destbuf, destbufoffset, numframes, numchans, samplerate, sourceposition) end

---Start audio preview of a PCM\_source, which can be created using functions like [PCM\_Source\_CreateFromFile](#PCM_Source_CreateFromFile)Returns id of a preview handle that can be provided to [Xen\_StopSourcePreview](#Xen_StopSourcePreview).If the given PCM\_source does not belong to an existing MediaItem/Take, it will be deleted by the preview system when the preview is stopped.You can preview more than one file at the same time.
---@param reaper integer
---@param source PCM_source
---@param gain number
---@param loop boolean
---@param number optional
function reaper.Xen_StartSourcePreview(reaper, source, gain, loop, number) end

---Stop audio preview. To stop all running previews, set id=-1
---@param preview_id integer
---@return integer retval
function reaper.Xen_StopSourcePreview(preview_id) end

---[BR] Equivalent to win32 API ComboBox_FindString().
---@param reaper integer
---@param comboBoxHwnd identifier
---@param startId integer
---@param string string
function reaper.BR_Win32_CB_FindString(reaper, comboBoxHwnd, startId, string) end

---[BR] Equivalent to win32 API ComboBox_FindStringExact().
---@param reaper integer
---@param comboBoxHwnd identifier
---@param startId integer
---@param string string
function reaper.BR_Win32_CB_FindStringExact(reaper, comboBoxHwnd, startId, string) end

---[BR] Equivalent to win32 API ClientToScreen().
---@param hwnd identifier
---@param xIn integer
---@param yIn integer
---@return number x, number y
function reaper.BR_Win32_ClientToScreen(hwnd, xIn, yIn) end

---\[BR\] Equivalent to win32 API FindWindowEx(). Since ReaScript doesn't allow passing NULL (None in Python, nil in Lua etc...) parameters, to search by supplied class or name set searchClass and searchName accordingly. HWND parameters should be passed as either "0" to signify NULL or as string obtained from [BR\_Win32_HwndToString](#BR_Win32_HwndToString).
---@param reaper identifier
---@param hwndParent string
---@param hwndChildAfter string
---@param className string
---@param windowName string
---@param searchClass boolean
---@param searchName boolean
function reaper.BR_Win32_FindWindowEx(reaper, hwndParent, hwndChildAfter, className, windowName, searchClass, searchName) end

---[BR] Equivalent to win32 API GET_X_LPARAM().
---@param reaper integer
---@param lParam integer
function reaper.BR_Win32_GET_X_LPARAM(reaper, lParam) end

---[BR] Equivalent to win32 API GET_Y_LPARAM().
---@param reaper integer
---@param lParam integer
function reaper.BR_Win32_GET_Y_LPARAM(reaper, lParam) end

---[BR] Returns various constants needed for BR_Win32 functions.
---Supported constants are:
---CB_ERR, CB_GETCOUNT, CB_GETCURSEL, CB_SETCURSEL
---EM_SETSEL
---GW_CHILD, GW_HWNDFIRST, GW_HWNDLAST, GW_HWNDNEXT, GW_HWNDPREV, GW_OWNER
---GWL_STYLE
---SW_HIDE, SW_MAXIMIZE, SW_SHOW, SW_SHOWMINIMIZED, SW_SHOWNA, SW_SHOWNOACTIVATE, SW_SHOWNORMAL
---SWP_FRAMECHANGED, SWP_FRAMECHANGED, SWP_NOMOVE, SWP_NOOWNERZORDER, SWP_NOSIZE, SWP_NOZORDER
---VK_DOWN, VK_UP
---WM_CLOSE, WM_KEYDOWN
---WS_MAXIMIZE, WS_OVERLAPPEDWINDOW
---@param reaper integer
---@param constantName string
function reaper.BR_Win32_GetConstant(reaper, constantName) end

---[BR] Equivalent to win32 API GetCursorPos().
---@return boolean retval, number x, number y
function reaper.BR_Win32_GetCursorPos() end

---[BR] Equivalent to win32 API GetFocus().
---@param reaper identifier
function reaper.BR_Win32_GetFocus(reaper) end

---[BR] Equivalent to win32 API GetForegroundWindow().
---@param reaper identifier
function reaper.BR_Win32_GetForegroundWindow(reaper) end

---\[BR\] Alternative to [GetMainHwnd](#GetMainHwnd). REAPER seems to have problems with extensions using HWND type for exported functions so all BR_Win32 functions use void* instead of HWND type
---@param reaper identifier
function reaper.BR_Win32_GetMainHwnd(reaper) end

---[BR] Get mixer window HWND. isDockedOut will be set to true if mixer is docked
---@return identifier retval, boolean isDocked
function reaper.BR_Win32_GetMixerHwnd() end

---[BR] Get coordinates for screen which is nearest to supplied coordinates. Pass workingAreaOnly as true to get screen coordinates excluding taskbar (or menu bar on OSX).
---@param workingAreaOnly boolean
---@param leftIn integer
---@param topIn integer
---@param rightIn integer
---@param bottomIn integer
---@return number left, number top, number right, number bottom
function reaper.BR_Win32_GetMonitorRectFromRect(workingAreaOnly, leftIn, topIn, rightIn, bottomIn) end

---[BR] Equivalent to win32 API GetParent().
---@param reaper identifier
---@param hwnd identifier
function reaper.BR_Win32_GetParent(reaper, hwnd) end

---[BR] Equivalent to win32 API GetWindow().
---@param reaper identifier
---@param hwnd identifier
---@param cmd integer
function reaper.BR_Win32_GetWindow(reaper, hwnd, cmd) end

---[BR] Equivalent to win32 API GetWindowLong().
---@param reaper integer
---@param hwnd identifier
---@param index integer
function reaper.BR_Win32_GetWindowLong(reaper, hwnd, index) end

---[BR] Equivalent to win32 API GetWindowRect().
---@param hwnd identifier
---@return boolean retval, number left, number top, number right, number bottom
function reaper.BR_Win32_GetWindowRect(hwnd) end

---[BR] Equivalent to win32 API GetWindowText().
---@param hwnd identifier
---@return integer retval, string text
function reaper.BR_Win32_GetWindowText(hwnd) end

---[BR] Equivalent to win32 API HIBYTE().
---@param reaper integer
---@param value integer
function reaper.BR_Win32_HIBYTE(reaper, value) end

---[BR] Equivalent to win32 API HIWORD().
---@param reaper integer
---@param value integer
function reaper.BR_Win32_HIWORD(reaper, value) end

---\[BR\] Convert HWND to string. To convert string back to HWND, see [BR\_Win32_StringToHwnd](#BR_Win32_StringToHwnd).
---@param hwnd identifier
---@return string string
function reaper.BR_Win32_HwndToString(hwnd) end

---[BR] Equivalent to win32 API IsWindow().
---@param reaper boolean
---@param hwnd identifier
function reaper.BR_Win32_IsWindow(reaper, hwnd) end

---[BR] Equivalent to win32 API IsWindowVisible().
---@param reaper boolean
---@param hwnd identifier
function reaper.BR_Win32_IsWindowVisible(reaper, hwnd) end

---[BR] Equivalent to win32 API LOBYTE().
---@param reaper integer
---@param value integer
function reaper.BR_Win32_LOBYTE(reaper, value) end

---[BR] Equivalent to win32 API LOWORD().
---@param reaper integer
---@param value integer
function reaper.BR_Win32_LOWORD(reaper, value) end

---[BR] Equivalent to win32 API MAKELONG().
---@param reaper integer
---@param low integer
---@param high integer
function reaper.BR_Win32_MAKELONG(reaper, low, high) end

---[BR] Equivalent to win32 API MAKELPARAM().
---@param reaper integer
---@param low integer
---@param high integer
function reaper.BR_Win32_MAKELPARAM(reaper, low, high) end

---[BR] Equivalent to win32 API MAKELRESULT().
---@param reaper integer
---@param low integer
---@param high integer
function reaper.BR_Win32_MAKELRESULT(reaper, low, high) end

---[BR] Equivalent to win32 API MAKEWORD().
---@param reaper integer
---@param low integer
---@param high integer
function reaper.BR_Win32_MAKEWORD(reaper, low, high) end

---[BR] Equivalent to win32 API MAKEWPARAM().
---@param reaper integer
---@param low integer
---@param high integer
function reaper.BR_Win32_MAKEWPARAM(reaper, low, high) end

---\[BR\] Alternative to [MIDIEditor\_GetActive](#MIDIEditor_GetActive). REAPER seems to have problems with extensions using HWND type for exported functions so all BR\_Win32 functions use void* instead of HWND type.
---@param reaper identifier
function reaper.BR_Win32_MIDIEditor_GetActive(reaper) end

---[BR] Equivalent to win32 API ClientToScreen().
---@param hwnd identifier
---@param xIn integer
---@param yIn integer
---@return number x, number y
function reaper.BR_Win32_ScreenToClient(hwnd, xIn, yIn) end

---[BR] Equivalent to win32 API SendMessage().
---@param reaper integer
---@param hwnd identifier
---@param msg integer
---@param lParam integer
---@param wParam integer
function reaper.BR_Win32_SendMessage(reaper, hwnd, msg, lParam, wParam) end

---[BR] Equivalent to win32 API SetFocus().
---@param reaper identifier
---@param hwnd identifier
function reaper.BR_Win32_SetFocus(reaper, hwnd) end

---[BR] Equivalent to win32 API SetForegroundWindow().
---@param reaper integer
---@param hwnd identifier
function reaper.BR_Win32_SetForegroundWindow(reaper, hwnd) end

---[BR] Equivalent to win32 API SetWindowLong().
---@param reaper integer
---@param hwnd identifier
---@param index integer
---@param newLong integer
function reaper.BR_Win32_SetWindowLong(reaper, hwnd, index, newLong) end

---\[BR\] Equivalent to win32 API SetWindowPos().
---hwndInsertAfter may be a string: "HWND\_BOTTOM", "HWND\_NOTOPMOST", "HWND\_TOP", "HWND\_TOPMOST" or a string obtained with [BR\_Win32_HwndToString](#BR_Win32_HwndToString).
---@param reaper boolean
---@param hwnd identifier
---@param hwndInsertAfter string
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param flags integer
function reaper.BR_Win32_SetWindowPos(reaper, hwnd, hwndInsertAfter, x, y, width, height, flags) end

---[BR] Equivalent to win32 API ShowWindow().
---@param reaper boolean
---@param hwnd identifier
---@param cmdShow integer
function reaper.BR_Win32_ShowWindow(reaper, hwnd, cmdShow) end

---\[BR\] Convert string to HWND. To convert HWND back to string, see [BR\_Win32\_HwndToString](BR_Win32_HwndToString).
---@param reaper identifier
---@param string string
function reaper.BR_Win32_StringToHwnd(reaper, string) end

---[BR] Equivalent to win32 API WindowFromPoint().
---@param reaper identifier
---@param x integer
---@param y integer
function reaper.BR_Win32_WindowFromPoint(reaper, x, y) end

---Enumerate the source's media cues. Returns the next index or 0 when finished.
---@param src PCM_source
---@param index integer
---@return integer retval, number time, number endTime, boolean isRegion, string name
function reaper.CF_EnumMediaSourceCues(src, index) end

---Return the index of the next selected effect in the given FX chain. Start index should be -1. Returns -1 if there are no more selected effects.
---@param reaper integer
---@param hwnd FxChain
---@param index integer
function reaper.CF_EnumSelectedFX(reaper, hwnd, index) end

---Wrapper for the unexposed kbd_enumerateActions API function.
---Main=0, Main (alt recording)=100, MIDI Editor=32060, MIDI Event List Editor=32061, MIDI Inline Editor=32062, Media Explorer=32063
---@param section integer
---@param index integer
---@return integer retval, string name
function reaper.CF_EnumerateActions(section, index) end

---Export the source to the given file (MIDI only).
---@param reaper boolean
---@param src PCM_source
---@param fn string
function reaper.CF_ExportMediaSource(reaper, src, fn) end

---Wrapper for the unexposed kbd\_getTextFromCmd API function. See [CF\_EnumerateActions](#CF_EnumerateActions) for common section IDs.
---@param reaper string
---@param section integer
---@param command integer
function reaper.CF_GetCommandText(reaper, section, command) end

---Return a handle to the currently focused FX chain window.
---@return FxChain 
function reaper.CF_GetFocusedFXChain() end

---Returns the bit depth if available (0 otherwise).
---@param reaper integer
---@param src PCM_source
function reaper.CF_GetMediaSourceBitDepth(reaper, src) end

---Get the value of the given metadata field (eg. DESC, ORIG, ORIGREF, DATE, TIME, UMI, CODINGHISTORY for BWF).
---@param src PCM_source
---@param name string
---@param out string
---@return boolean retval, string out
function reaper.CF_GetMediaSourceMetadata(src, name, out) end

---Returns the online/offline status of the given source.
---@param reaper boolean
---@param src PCM_source
function reaper.CF_GetMediaSourceOnline(reaper, src) end

---Get the project associated with this source (BWF, subproject...).
---@param src PCM_source
---@return boolean retval, string fn
function reaper.CF_GetMediaSourceRPP(src) end

---Return the current SWS version number.
---@return string version
function reaper.CF_GetSWSVersion() end

---Return a handle to the given take FX chain window. HACK: This temporarily renames the take in order to disambiguate the take FX chain window from similarily named takes.
---@param reaper FxChain
---@param take MediaItem_Take
function reaper.CF_GetTakeFXChain(reaper, take) end

---Return a handle to the given track FX chain window.
---@param reaper FxChain
---@param track MediaTrack
function reaper.CF_GetTrackFXChain(reaper, track) end

---Select the given file in explorer/finder.
---@param reaper boolean
---@param file string
function reaper.CF_LocateInExplorer(reaper, file) end

---Set which track effect is active in the track's FX chain. The FX chain window does not have to be open.
---@param reaper boolean
---@param track MediaTrack
---@param index integer
function reaper.CF_SelectTrackFX(reaper, track, index) end

---Set the online/offline status of the given source (closes files when set=false).
---@param src PCM_source
---@param set boolean
function reaper.CF_SetMediaSourceOnline(src, set) end

---Open the given file or URL in the default application. See also [CF\_LocateInExplorer](#CF_LocateInExplorer).
---@param reaper boolean
---@param file string
function reaper.CF_ShellExecute(reaper, file) end

---This function combines all other NF\_Peak/RMS functions in a single one and additionally returns peak RMS positions.  [Lua example code here](https://forum.cockos.com/showpost.php?p=2050961&postcount=6). Note: It's recommended to use this function with ReaScript/Lua as it provides reaper.array objects. 
---If using this function with other scripting languages, you must provide arrays in the [reaper.array format](https://forum.cockos.com/showpost.php?p=2039829&postcount=2).
---@param reaper boolean
---@param item MediaItem
---@param windowSize number
---@param reaper identifier
---@param reaper identifier
---@param reaper identifier
---@param reaper identifier
function reaper.NF_AnalyzeMediaItemPeakAndRMS(reaper, item, windowSize, reaper, reaper, reaper, reaper) end

---See [NF\_GetMediaItemMaxPeak](#NF_GetMediaItemMaxPeak), additionally returns maxPeakPos (relative to item position).
---@param item MediaItem
---@return number retval, number maxPeakPos
function reaper.NF_GetMediaItemMaxPeakAndMaxPeakPos(item) end

---Returns SWS/S&amp;M marker/region subtitle. markerRegionIdx: Refers to index that can be passed to [EnumProjectMarkers](#EnumProjectMarkers) (not displayed marker/region index).  
---Returns empty string if marker/region with specified index not found or marker/region subtitle not set.  [Lua code example can be found here](https://github.com/ReaTeam/ReaScripts-Templates/blob/master/Markers%20and%20Regions/NF_Get%20SWS%20markers%20and%20regions%20notes.lua)
---@param reaper string
---@param markerRegionIdx integer
function reaper.NF_GetSWSMarkerRegionSub(reaper, markerRegionIdx) end

---Get the SWS tracknotes.
---@param tracknotes string
---@param track MediaTrack
function reaper.NF_GetSWSTrackNotes(tracknotes, track) end

---Get SWS analysis/normalize options. See [NF\_SetSWS\_RMSoptions](#NF_SetSWS_RMSoptions).
---@return number target, number windowSize
function reaper.NF_GetSWS_RMSoptions() end

---Reads an ID3v2 tag ('text information frame'), works with mp3 only. Supported tags e.g.: "TBPM" (BPM), "TCOP" (Copyright). For other possibly supported tags see [id3v2.4.0-frames.txt](http://id3.org/id3v2.4.0-frames) Returns false if tag was not found.
---@param fn string
---@param tag string
---@return boolean retval, string tagval
function reaper.NF_ReadID3v2Tag(fn, tag) end

---Set SWS/S&amp;M marker/region subtitle. markerRegionIdx: Refers to index that can be passed to [EnumProjectMarkers](#EnumProjectMarkers)(not displayed marker/region index).  
---Returns true if subtitle is set successfully (i.e. marker/region with specified index is present in project). [Lua code example can be found here](https://github.com/ReaTeam/ReaScripts-Templates/blob/master/Markers%20and%20Regions/NF_Get%20SWS%20markers%20and%20regions%20notes.lua")
---@param reaper boolean
---@param markerRegionSub string
---@param markerRegionIdx integer
function reaper.NF_SetSWSMarkerRegionSub(reaper, markerRegionSub, markerRegionIdx) end

---@param track MediaTrack
---@param str string
function reaper.NF_SetSWSTrackNotes(track, str) end

---Set SWS analysis/normalize options (same as running action 'SWS: Set RMS analysis/normalize options'). targetLevel: target RMS normalize level (dB), windowSize: window size for peak RMS (sec.)See [NF\_GetSWS\_RMSoptions](#NF_GetSWS_RMSoptions).
---@param retval boolean
---@param targetLevel number
---@param windowSize number
function reaper.NF_SetSWS_RMSoptions(retval, targetLevel, windowSize) end

---Deprecated.
---Retrieves the name of the module of a takefx from a MediaItem.            See [BR\_TrackFX\_GetFXModuleName](#BR_TrackFX_GetFXModuleName). fx: counted consecutively across all takes (zero-based).
---@param item MediaItem
---@param fx integer
---@return boolean retval, string name
function reaper.NF_TakeFX_GetModuleName(item, fx) end

---Redraw the Notes window (call if you've changed a subtitle via [NF\_SetSWSMarkerRegionSub](#NF_SetSWSMarkerRegionSub) which is currently displayed in the Notes window and you want to appear the new subtitle immediately.)
function reaper.NF_UpdateSWSMarkerRegionSubWindow() end

---This function allows you to get various information about your display.
---        
---Equivalent to [win32 API GetSystemMetrics()](https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-getsystemmetrics).
---@param nIndex integer
---@return integer retval
function reaper.NF_Win32_GetSystemMetrics(nIndex) end

---Adds code to be executed when the script finishes or is ended by the user. Typically used to clean up after the user terminates defer() or runloop() code.You can't defer this atexit-function, when it is run as exit-function, though, when it is run regularily before exiting the script.You can define more than one atexit-function. They will be run in the order they've been registered as atexit-functions.
---For example:    reaper.atexit(exit1)
---    reaper.atexit(exit2)
---    reaper.atexit(exit3)
---    
---will run exit1, exit2 and then exit3, when exiting the script.You can have up to 1024 atexit-functions set in one script, no matter if its different or the same function.
---@param function_ function
function reaper.atexit(function_) end

---Adds code to be called back by REAPER. Used to create persistent ReaScripts that continue to run and respond to input, while the user does other tasks. Identical to runloop().Note that no undo point will be automatically created when the script finishes, unless you create it explicitly.There can be 1024 defer-nodes running at the same time in one script, no matter if it's different functions or the same one.
---@param function_ function
---@return boolean retval
function reaper.defer(function_) end

---Returns contextual information about the script, typically MIDI/OSC input values.val will be set to a relative or absolute value depending on mode (=0: absolute mode, &gt;0: relative modes). resolution=127 for 7-bit resolution, =16383 for 14-bit resolution.Notes: sectionID, and cmdID will be set to -1 if the script is not part of the action list. mode, resolution and val will be set to -1 if the script was not triggered via MIDI/OSC.For relative mode bindings, calling get_action_context() will return the accumulated relative value in decoded form (not 65 or 63, but +1/-1 etc), and clear the internal state. So if you call it multiple times, the first one will return the accumulated value, and the second will always return 0.
---@return boolean is_new_value, string filename_with_path, integer sectionID, integer cmdID, integer mode, integer resolution, integer val
function reaper.get_action_context() end

---The following global variables are special and will be used by the graphics system:* gfx.r, gfx.g, gfx.b, gfx.a2 - These represent the current red, green, blue, and alpha components used by drawing operations (0.0..1.0). gfx.a2 is the value written to the alpha channel when writing solid colors (normally ignored but useful when creating transparent images)
---* gfx.a, gfx.mode - Alpha and blend mode for drawing. Set mode to 0 for default options. Add 1.0 for additive blend mode (if you wish to do subtractive, set gfx.a to negative and use gfx.mode as additive). Add 2.0 to disable source alpha for gfx.blit(). Add 4.0 to disable filtering for gfx.blit(). 
---* gfx.w, gfx.h - These are set to the current width and height of the UI framebuffer. 
---* gfx.x, gfx.y - These set the "current" graphics position in x,y. You can set these yourselves, and many of the drawing functions update them as well. 
---* gfx.clear - If set to a value greater than -1.0, this will result in the framebuffer being cleared to that color. the color for this one is packed RGB (0..255), i.e. red+green*256+blue*65536. The default is 0 (black). 
---* gfx.dest - Defaults to -1, set to 0..1024-1 to have drawing operations go to an offscreen buffer (or loaded image).
---* gfx.texth - Set to the height of a line of text in the current font. Do not modify this variable.
---* gfx.ext_retina - If set to 1.0 on initialization, will be updated to 2.0 if high resolution display is supported, and if so gfx.w/gfx.h/etc will be doubled.
---* gfx.mouse_x, gfx.mouse_y - gfx.mouse_x and gfx.mouse_y are set to the coordinates of the mouse relative to the graphics window.
---* gfx.mouse_wheel, gfx.mouse_hwheel - mouse wheel (and horizontal wheel) positions. These will change typically by 120 or a multiple thereof, the caller should clear the state to 0 after reading it.
---* gfx.mouse_cap is a bitfield of mouse and keyboard modifier state.
---    1: left mouse button
---    2: right mouse button
---    4: Control key
---    8: Shift key
---    16: Alt key
---    32: Windows key
---    64: middle mouse button
---Note: Mousebuttons will be returned after gfx.init(), the other keyboard-modifier only when using gfx.getchar()!
---@param VARIABLES gfx
function VARIABLES(VARIABLES) end

---Draws an arc of the circle centered at x,y, with ang1/ang2 being specified in radians.
---@param x integer
---@param y integer
---@param r integer
---@param ang1 number
---@param ang2 number
---@param number optional
function gfx.arc(x, y, r, ang1, ang2, number) end

---Blits(draws) the content of source-image to another source-image or an opened window.srcx/srcy/srcw/srch specify the source rectangle (if omitted srcw/srch default to image size), destx/desty/destw/desth specify dest rectangle (if not specified, these will default to reasonable defaults -- destw/desth default to srcw/srch * scale). 
---@param source integer
---@param scale number
---@param rotation number
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param integer optional
---@param integer optional
---@param integer optional
---@param integer optional
---@param integer optional
---@param integer optional
---@return integer source
function gfx.blit(source, scale, rotation, number, number, number, number, integer, integer, integer, integer, integer, integer) end

---Blits(draws) the content of source-image to another source-image or an opened window.This is a simplified version of [gfx.blit()](#lua_gfx.blit).If three parameters are specified, copies the entirity of the source bitmap to gfx.x,gfx.y using current opacity and copy mode (set with gfx.a, gfx.mode). You can specify scale (1.0 is unscaled) and rotation (0.0 is not rotated, angles are in radians).For the "source" parameter specify -1 to use the main framebuffer as source, or an image index (see gfx.loadimg()).
---@param source integer
---@param scale number
---@param rotation number
---@return integer source
function gfx.blit(source, scale, rotation) end

---Deprecated, use gfx.blit instead.
function gfx.blitext() end

---Blurs the region of the screen between gfx.x,gfx.y and x,y, and updates gfx.x,gfx.y to x,y.
---@param x integer
---@param y integer
function gfx.blurto(x, y) end

---Draws a circle, optionally filling/antialiasing. 
---@param x integer
---@param y integer
---@param r integer
---@param number optional
---@param number optional
function gfx.circle(x, y, r, number, number) end

---Converts the coordinates x,y to screen coordinates, returns those values.
---@param x integer
---@param y integer
---@return int convx, int convy
function gfx.clienttoscreen(x, y) end

---Blits from srcimg(srcs,srct,srcw,srch) to destination (destx,desty,destw,desth). Source texture coordinates are s/t, dsdx represents the change in s coordinate for each x pixel, dtdy represents the change in t coordinate for each y pixel, etc. dsdxdy represents the change in dsdx for each line. If usecliprect is specified and 0, then srcw/srch are ignored.This function allows you to manipulate the image, which you want to blit, by transforming, moving or cropping it.To do rotation, you can manipulate dtdx and dsdy together.
---@param srcimg integer
---@param srcs integer
---@param srct integer
---@param srcw integer
---@param srch integer
---@param destx number
---@param desty number
---@param destw number
---@param desth number
---@param dsdx number
---@param dtdx number
---@param dsdy number
---@param dtdy number
---@param dsdxdy number
---@param dtdxdy number
---@param integer optional
---@return number retval
function gfx.deltablit(srcimg, srcs, srct, srcw, srch, destx, desty, destw, desth, dsdx, dtdx, dsdy, dtdy, dsdxdy, dtdxdy, integer) end

---Queries or sets the docking-state of the gfx.init()-window.
---Call with v=-1 to query docked state, otherwise v&gt;=0 to set docked state. 
---State is &amp;1 if docked, second byte is docker index (or last docker index if undocked). 
---If wx-wh specified, additional values will be returned with the undocked window position/sizeA specific docking index does not necessarily represent a specific docker, means, you can not query/set left docker top, but rather all dockers that exist in the current screenset.
---So the first queried/set docker can be top-left-docker or the top docker or even one of the bottom dockers.
---The order doesn't seem to make any sense. Especially with more than 16 windows docked in the current screenset.
---@param v integer
---@param integer optional
---@param integer optional
---@param integer optional
---@param integer optional
---@return number querystate, optional integer, optional integer, optional integer, optional integer
function gfx.dock(v, integer, integer, integer, integer) end

---Draws the character (can be a numeric ASCII code as well), to gfx.x, gfx.y, and moves gfx.x over by the size of the character.
---@param char integer
---@return integer char
function gfx.drawchar(char) end

---Draws the number n with ndigits of precision to gfx.x, gfx.y, and updates gfx.x to the right side of the drawing. The text height is gfx.texth.
---@param n number
---@param ndigits integer
function gfx.drawnumber(n, ndigits) end

---Draws a string at gfx.x, gfx.y, and updates gfx.x/gfx.y so that subsequent draws will occur in a similar place.You can optionally set a clipping area for the text, if you set parameter flags&amp;256 and the parameters right and bottom.On Windows, fonts with a size > 255 may have trouble of being displayed correctly, due problems with the font-rendering and the alpha-channel. <a href="https://forum.cockos.com/showpost.php?p=2311977&postcount=7">Justin's post about this.</a>
---To overcome this, try this to disable the alpha-channel: 
---By default, gfx.blit() blits with alpha channel. You can disable this behavior by setting "gfx.mode=2" before calling gfx.blit().
---@param str string
---@param integer optional
---@param integer optional
---@param integer optional
function gfx.drawstr(str, integer, integer, integer) end

---If char is 0 or omitted, returns a character from the keyboard queue, or 0 if no character is available, or -1 if the graphics window is not open. If char is specified and nonzero, that character's status will be checked, and the function will return greater than 0 if it is pressed.
---Common values are standard ASCII, such as 'a', 'A', '=' and '1', but for many keys multi-byte values are used, 
---including 'home', 'up', 'down', 'left', 'right', 'f1'.. 'f12', 'pgup', 'pgdn', 'ins', and 'del'. 			Shortcuts with scope "Global + textfields" will still run the associated action, scope of "Normal" or "Global" will not.
---			
---Modified and special keys can also be returned, including:  - Ctrl/Cmd+A..Ctrl+Z as 1..26  
---- Ctrl/Cmd+Alt+A..Z as 257..282  
---- Alt+A..Z as 'A'+256..'Z'+256  
---- 27 for ESC  
---- 13 for Enter  
---- ' ' for space  
----   
---- use 65536 as parameter charactercode to query special flags, returns: &1 (supported in this script), &2=window has focus, &4=window is visible  Some multibyte-characters, like home, up, down, left, right, f1 .. f12, pgup, pgdn, ins, del are returned as values above 255, but some other characters, like €,  
---are "real"-multibyte-characters, stored as multiple 8-bit-values after each other.
---To retrieve them, you need to run gfx.getchar() twice per defer-cycle and return their retvals into two variables:  
---Example:            A=gfx.getchar() -- first byte
---            B=gfx.getchar() -- second byte
---            
---            if A==261 and B==128 then reaper.MB("You typed the Euro-symbol.", "Message", 0) end -- typed character is the Euro-currency-symbol.
---@param integer optional
---@return integer charactercode
function gfx.getchar(integer) end

---Returns filenames, drag'n'dropped into a window created by gfx.init().
---Use idx to get a specific filename, that has been dropped into the gfx.init()-window.Does NOT support mediaitems/takes or other Reaper-objects!It MUST be called BEFORE calling gfx.update, as gfx.update flushes the filelist accessible with gfx.getdropfile.
---@param idx integer
---@return integer retval, string filename
function gfx.getdropfile(idx) end

---Returns current font index, and the actual font face used by this font (if available).
---@return integer fontindex
function gfx.getfont() end

---Retrieves the dimensions of an image specified by handle, returns w, h pair.
---Handle is basically a frame-buffer.
---@param handle integer
---@return integer w, integer h
function gfx.getimgdim(handle) end

---Returns r,g,b values [0..1] of the pixel at (gfx.x,gfx.y)
---@return integer r, integer g, integer b
function gfx.getpixel() end

---Fills a gradient rectangle with the color and alpha specified. drdx-dadx reflect the adjustment (per-pixel) applied for each pixel moved to the right, drdy-dady are the adjustment applied for each pixel moved toward the bottom. Normally drdx=adjustamount/w, drdy=adjustamount/h, etc.
function gfx.gradrect() end

---Initializes the graphics window with title name. Suggested width and height can be specified.Once the graphics window is open, gfx.update() should be called periodically. Only one graphics-window can be opened per script! Calling gfx.ini after a window has been opened has no effect.
---			
---			To resizes/reposition the window, call gfx.init again and pass an empty string as name-parameter.To get the current window-states, dimensions, etc, you can use [gfx.dock](#lua_gfx.dock).            
---@param integer optional
---@param integer optional
---@param integer optional
---@param integer optional
---@param integer optional
---@return integer retval
function gfx.init(integer, integer, integer, integer, integer) end

---Draws a line from x,y to x2,y2, and if aa is not specified or 0.5 or greater, it will be antialiased. 
---@param x integer
---@param y integer
---@param x2 integer
---@param y2 integer
---@param number optional
function gfx.line(x, y, x2, y2, number) end

---Draws a line from gfx.x,gfx.y to x,y. If aa is 0.5 or greater, then antialiasing is used. Updates gfx.x and gfx.y to x,y.
---@param x integer
---@param y integer
---@param aa number
function gfx.lineto(x, y, aa) end

---Load image from filename into slot 0..1024-1 specified by image. Returns the image index if success, otherwise -1 if failure. The image will be resized to the dimensions of the image file. 
---@param image integer
---@param filename string
---@return integer retval
function gfx.loadimg(image, filename) end

---Measures the drawing dimensions of a character with the current font (as set by [gfx.setfont](#lua_gfx.setfont)). Returns width and height of character.
---@param char integer
---@return integer width, integer height
function gfx.measurechar(char) end

---Measures the drawing dimensions of a string with the current font (as set by [gfx.setfont](#lua_gfx.setfont)). Returns width and height of string.
---@param str string
---@return integer width, integer height
function gfx.measurestr(str) end

---Multiplies each pixel within the given rectangle(x,y,w,h) by the mul_*-parameters and optionally adds add_*-parameters, and updates in-place. Useful for changing brightness/contrast, or other effects.The multiplied values usually affect only pixels, that are not black(0,0,0,0), while the added values affect all pixels.
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param mul_r number
---@param mul_g number
---@param mul_b number
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@param number optional
---@return integer retval
function gfx.muladdrect(x, y, w, h, mul_r, mul_g, mul_b, number, number, number, number, number) end

---Formats and draws a string at gfx.x, gfx.y, and updates gfx.x/gfx.y accordingly (the latter only if the formatted string contains newline). For more information on format strings, see sprintf()    * %% = %
---    * %s = string from parameter
---    * %d = parameter as integer
---    * %i = parameter as integer
---    * %u = parameter as unsigned integer
---    * %x = parameter as hex (lowercase) integer
---    * %X = parameter as hex (uppercase) integer
---    * %c = parameter as character
---    * %f = parameter as floating point
---    * %e = parameter as floating point (scientific notation, lowercase)
---    * %E = parameter as floating point (scientific notation, uppercase)
---    * %g = parameter as floating point (shortest representation, lowercase)
---    * %G = parameter as floating point (shortest representation, uppercase)Many standard C printf() modifiers can be used, including:    * %.10s = string, but only print up to 10 characters
---    * %-10s = string, left justified to 10 characters
---    * %10s = string, right justified to 10 characters
---    * %+f = floating point, always show sign
---    * %.4f = floating point, minimum of 4 digits after decimal point
---    * %10d = integer, minimum of 10 digits (space padded)
---    * %010f = integer, minimum of 10 digits (zero padded)Values for format specifiers can be specified as additional parameters to gfx.printf, or within {} in the format specifier (such as %{varname}d, in that case a global variable is always used).
function gfx.printf() end

---Closes the graphics window.
---@return integer retval
function gfx.quit() end

---Fills a rectangle at x,y, w,h pixels in dimension, filled by default. 
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param integer optional
---@return integer retval
function gfx.rect(x, y, w, h, integer) end

---Fills a rectangle from gfx.x,gfx.y to x,y. Updates gfx.x,gfx.y to x,y. 
---@param x integer
---@param y integer
---@return integer x_coordinate
function gfx.rectto(x, y) end

---Draws a rectangle with rounded corners. 
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param radius number
---@param integer optional
---@return integer retval
function gfx.roundrect(x, y, w, h, radius, integer) end

---Converts the screen coordinates x,y to client coordinates, returns those values.
---@param x integer
---@param y integer
---@return integer convx, integer convy
function gfx.screentoclient(x, y) end

---Sets color, drawing mode and optionally the drawing-image-source-destination.
---If sets the corresponding gfx-variables.
---Sets gfx.r/gfx.g/gfx.b/gfx.a2/gfx.mode sets gfx.dest if final parameter specified
---@param r number
---@param number optional
---@param number optional
---@param number optional
---@param integer optional
---@param integer optional
---@return integer retval
function gfx.set(r, number, number, number, integer, integer) end

---Sets the mouse cursor. resource_id is a value like 32512 (for an arrow cursor), custom_cursor_name is a string like "arrow" (for the REAPER custom arrow cursor). resource_id must be nonzero, but custom_cursor_name is optional.
function gfx.setcursor() end

---Can select a font and optionally configure it. After calling gfx_setfont(), gfx_texth may be updated to reflect the new average line height.
---@param idx integer
---@param string optional
---@param integer optional
---@param integer optional
function gfx.setfont(idx, string, integer, integer) end

---Resize image referenced by index 0..1024-1, width and height must be 0-8192. The contents of the image will be undefined after the resize.
---@param image integer
---@param w integer
---@param h integer
---@return integer retval
function gfx.setimgdim(image, w, h) end

---Writes a pixel of r,g,b to gfx.x,gfx.y.
---@param r number
---@param g number
---@param b number
---@return integer retval
function gfx.setpixel(r, g, b) end

---Shows a popup menu at gfx.x,gfx.y. str is a list of fields separated by | characters. 
---Each field represents a menu item. Fields can start with special characters:#, grayed out; !, checked; &gt;, this menu item shows a submenu;&gt;, last item in the current submenu. 
---An empty field will appear as a separator in the menu. Example: selection = gfx.showmenu("first item, followed by separator||!second item, checked|&gt;third item which spawns a submenu|#first item in submenu, grayed out|&gt;second and last item in submenu|fourth item in top menu")gfx.showmenu returns 0 if the user selected nothing from the menu, 1 if the first field is selected, etc.
---@param str string
---@return integer selection
function gfx.showmenu(str) end

---Blits to destination at (destx,desty), size (destw,desth). div_w and div_h should be 2..64, and table should point to a table of 2*div_w*div_h values (table can be a regular table or (for less overhead) a reaper.array). Each pair in the table represents a S,T coordinate in the source image, and the table is treated as a left-right, top-bottom list of texture coordinates, which will then be rendered to the destination.
---@param srcimg integer
---@param destx integer
---@param desty integer
---@param destw integer
---@param desth integer
---@param div_w integer
---@param div_h integer
---@param table table
function gfx.transformblit(srcimg, destx, desty, destw, desth, div_w, div_h, table) end

---Draws a filled triangle, or any convex polygon. 
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param x3 integer
---@param y3 integer
---@param integer optional
---@param integer optional
function gfx.triangle(x1, y1, x2, y2, x3, y3, integer, integer) end

---Causes gmem_read()/gmem_write() to read EEL2/JSFX/Video shared memory segment named by parameter. Set to empty string to detach.Must be called, before you can use a specific gmem-variable-index with gmem_write!
---@param sharedMemoryName string
function reaper.gmem_attach(sharedMemoryName) end

---Read (number) value from shared memory attached-to by gmem_attach(). index can be [0..1&lt;&lt;25).returns nil if not available
---@param index integer
---@return number retval
function reaper.gmem_read(index) end

---Write (number) value to shared memory attached-to by gmem_attach(). index can be \[0..1&lt;&lt;25).Before you can write into a currently unused variable with index "index", you must call [gmem\_attach](#lua_gmem_attach) first!
---@param index integer
---@param value number
function reaper.gmem_write(index, value) end

---Updates the graphics display, if opened
function gfx.update() end

---Creates a new reaper.array object of maximum and initial size size, if specified, or from the size/values of a table/array. Both size and table/array can be specified, the size parameter will override the table/array size.
---@return ReaperArray reaper_array
function reaper.new_array() end

---Adds code to be called back by REAPER. Used to create persistent ReaScripts that continue to run and respond to input, while the user does other tasks. Identical to defer().Note that no undo point will be automatically created when the script finishes, unless you create it explicitly.
---@param function_ function
---@return boolean retval
function reaper.runloop(function_) end

---Sets the value of zero or more items in the array. If value not specified, 0.0 is used. offset is 1-based, if size omitted then the maximum amount available will be set.
---@return boolean retval
function {reaper.array}.clear() end

---Convolves complex value pairs from reaper.array, starting at 1-based srcoffs, reading/writing to 1-based destoffs. size is in normal items (so it must be even)
---@return integer retval
function {reaper.array}.convolve() end

---Copies values from reaper.array or table, starting at 1-based srcoffs, writing to 1-based destoffs.
---@return integer retval
function {reaper.array}.copy() end

---Performs a forward FFT of size. size must be a power of two between 4 and 32768 inclusive. If permute is specified and true, the values will be shuffled following the FFT to be in normal order.
function {reaper.array}.fft() end

---Performs a forward real-&gt;complex FFT of size. size must be a power of two between 4 and 32768 inclusive. If permute is specified and true, the values will be shuffled following the FFT to be in normal order.
function {reaper.array}.fft_real() end

---Returns the maximum (allocated) size of the array.
---@return integer size
function {reaper.array}.get_alloc() end

---Performs a backwards FFT of size. size must be a power of two between 4 and 32768 inclusive. If permute is specified and true, the values will be shuffled before the IFFT to be in fft-order.
function {reaper.array}.ifft() end

---Performs a backwards complex-&gt;real FFT of size. size must be a power of two between 4 and 32768 inclusive. If permute is specified and true, the values will be shuffled before the IFFT to be in fft-order.
function {reaper.array}.ifft_real() end

---Multiplies values from reaper.array, starting at 1-based srcoffs, reading/writing to 1-based destoffs.
function {reaper.array}.multiply() end

---Resizes an array object to size. size must be [0..max_size].
function {reaper.array}.resize() end

---Returns a new table with values from items in the array. Offset is 1-based and if size is omitted all available values are used.
function {reaper.array}.table() end

---Show the about dialog of the given package entry.
---The repository index is downloaded asynchronously if the cached copy doesn't exist or is older than one week.
---@param reaper boolean
---@param entry PackageEntry
function reaper.ReaPack_AboutInstalledPackage(reaper, entry) end

---Show the about dialog of the given repository. Returns true if the repository exists in the user configuration.
---The repository index is downloaded asynchronously if the cached copy doesn't exist or is older than one week.
---@param reaper boolean
---@param repoName string
function reaper.ReaPack_AboutRepository(reaper, repoName) end

---Add or modify a repository. Set url to nullptr (or empty string in Lua) to keep the existing URL. Call [ReaPack\_ProcessQueue(true)](#ReaPack_ProcessQueue) when done to process the new list and update the GUI.autoInstall: usually set to 2 (obey user setting).
---@param name string
---@param url string
---@param enable boolean
---@param autoInstall integer
---@return boolean retval, string error
function reaper.ReaPack_AddSetRepository(name, url, enable, autoInstall) end

---Opens the package browser with the given filter string.
---@param filter string
function reaper.ReaPack_BrowsePackages(filter) end

---Compares two versionnumbers. Versionnumbers must start with a number/digit, or they can't be compared.
---Returns 0 if both versions are equal, a positive value if ver1 is higher than ver2 and a negative value otherwise.
---@param ver1 string
---@param ver2 string
---@return integer retval, string error
function reaper.ReaPack_CompareVersions(ver1, ver2) end

---Enumerate the files owned by the given package. Returns false when there is no more data.    sections: 0=not in action list, &1=main, &2=midi editor, &4=midi inline editor
---    type: see [ReaPack\_GetEntryInfo](#ReaPack_GetEntryInfo).
---@param entry PackageEntry
---@param index integer
---@return boolean retval, string path, number sections, number type
function reaper.ReaPack_EnumOwnedFiles(entry, index) end

---Free resources allocated for the given package entry. Must be used to free PackageEntry-objects created by [ReaPack\_GetOwner](#ReaPack_GetOwner).
---@param reaper boolean
---@param entry PackageEntry
function reaper.ReaPack_FreeEntry(reaper, entry) end

---Get the repository name, category, package name, package description, package type, the currently installed version, author name, pinned status and how many files are owned by the given package entry.
---@param entry PackageEntry
---@return boolean retval, string repo, string cat, string pkg, string desc, number type, string ver, string author, boolean pinned, number fileCount
function reaper.ReaPack_GetEntryInfo(entry) end

---Returns the package entry owning the given file.
---Delete the returned object from memory after use with [ReaPack\_FreeEntry](#ReaPack_FreeEntry).
---@param fn string
---@return PackageEntry retval, string error
function reaper.ReaPack_GetOwner(fn) end

---Get the infos of the given repository.
---@param name string
---@return boolean retval, string url, boolean enabled, number autoInstall
function reaper.ReaPack_GetRepositoryInfo(name) end

---Run pending operations and save the configuration file. If refreshUI is true the browser and manager windows are guaranteed to be refreshed (otherwise it depends on which operations are in the queue).
---@param refreshUI boolean
function reaper.ReaPack_ProcessQueue(refreshUI) end
