type REAPER<T extends string> = {
      type: T
      value: string
    }
    
  type MediaTrack = REAPER<'MediaTrack'>
type ReaProject = REAPER<'ReaProject'>
type MediaItem = REAPER<'MediaItem'>
type AudioAccessor = REAPER<'AudioAccessor'>
type TrackEnvelope = REAPER<'TrackEnvelope'>
type MediaItem_Take = REAPER<'MediaItem_Take'>
type optional = REAPER<'optional'>

    /** @noSelf **/
    declare namespace reaper {

    
      /** Creates a new media item. It will be empty and therefore not be shown in the arrange-view, until you associate a mediafile(audio, picture, video, etc) or a length and position to it using [SetMediaItemInfo\_Value](#SetMediaItemInfo_Value) */
      function AddMediaItemToTrack(tr: MediaTrack): MediaItem

      
      /** Creates a new Projectmarker/Region.
Returns the index of the created marker/region, or -1 on failure. Supply wantidx&gt;=0 if you want a particular index number, but you'll get a different index number a region and wantidx is already in use. */
      function AddProjectMarker(proj: ReaProject, isrgn: boolean, pos: number, rgnend: number, name: string, wantidx: number): number

      
      /** Returns the index of the created marker/region, or -1 on failure. Supply wantidx&gt;=0 if you want a particular index number, but you'll get a different index number a region and wantidx is already in use. color should be 0 (default color), or [ColorToNative(r,g,b)|0x1000000](#ColorToNative) */
      function AddProjectMarker2(proj: ReaProject, isrgn: boolean, pos: number, rgnend: number, name: string, wantidx: number, color: number): number

      
      /** Adds a ReaScript (returns the new command ID, or 0 if failed) or removes a ReaScript
Returns &gt;0 on success. 
Use commit==true when adding/removing a single script. 
When bulk adding/removing multiple scripts, you can optimize the n-1 first calls with commit==false and commit==true for the last call.            
The commandID returned, might change, when addng this script into an other Reaper-installation. 
To be sure to use the right command-id, use [ReverseNamedCommandLookup()](#ReverseNamedCommandLookup) to get the ActionCommandID, which will never change, until you remove the script.

If you want to add a script to several sections, you need to add them individually, by calling the function again with the changed section-number. */
      function AddRemoveReaScript(add: boolean, sectionID: number, scriptfn: string, commit: boolean): number

      
      /** creates a new take in an item */
      function AddTakeToMediaItem(item: MediaItem): MediaItem_Take

      
      /** Deprecated. Use [SetTempoTimeSigMarker](#SetTempoTimeSigMarker) with ptidx=-1. */
      function AddTempoTimeSigMarker(proj: ReaProject, timepos: number, bpm: number, timesig_num: number, timesig_denom: number, lineartempochange: boolean): boolean

      
      /** Sets horizontal zoom in track view. */
      function adjustZoom(amt: number, forceset: number, doupd: boolean, centermode: number): void

      
      /** returns, whether any of the tracks is solo in Project proj */
      function AnyTrackSolo(proj: ReaProject): boolean

      
      /** Returns true if function_name exists in the REAPER API */
      function APIExists(function_name: string): boolean

      
      /** Displays a message window with "Hello World", if the API was successfully called. */
      function APITest(): void

      
      /** Nudges elements like items, cursor, contents, etc to or by a value you want. Nudges only selected mediaitems. */
      function ApplyNudge(project: ReaProject, nudgeflag: number, nudgewhat: number, nudgeunits: number, value: number, reverse: boolean, copies: number): boolean

      
      /** open all audio and MIDI devices, if not open */
      function Audio_Init(): void

      
      /** is in pre-buffer? threadsafe */
      function Audio_IsPreBuffer(): number

      
      /** is audio running at all? threadsafe */
      function Audio_IsRunning(): number

      
      /** close all audio and MIDI devices, if open */
      function Audio_Quit(): void

      
      /** Returns true if the underlying samples (track or media item take) have changed, but does not update the audio accessor, so the user can selectively call [AudioAccessorValidateState](#AudioAccessorValidateState) only when needed. 

See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples). */
      function AudioAccessorStateChanged(reaper: boolean, accessor: AudioAccessor): void

      
      /** Force the accessor to reload its state from the underlying track or media item take. 

See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples). */
      function AudioAccessorUpdate(accessor: AudioAccessor): void

      
      /** Validates the current state of the audio accessor -- must ONLY call this from the main thread. Returns true if the state changed. */
      function AudioAccessorValidateState(accessor: AudioAccessor): boolean

      
      /** Does bypassing of the fx of all tracks. */
      function BypassFxAllTracks(bypass: number): void

      
      /** Clears all armed states of all tracks. */
      function ClearAllRecArmed(): void

      
      /** Clear the ReaScript console. See [ShowConsoleMsg](#ShowConsoleMsg) */
      function ClearConsole(): void

      
      /** resets the global peak caches */
      function ClearPeakCache(): void

      
      /** Extract RGB values from an OS dependent color. See [ColorToNative](#ColorToNative).

As Reaper treats colors differently on Mac and Windows, you should always use [ColorFromNative](#ColorFromNative) and [ColorToNative](#ColorToNative). */
      function ColorFromNative(col: number): [r: number, g: number, b: number]

      
      /** Make an OS dependent color from RGB values (e.g. RGB() macro on Windows). r,g and b are in [0..255]. See [ColorFromNative](#ColorFromNative)
As Reaper treats colors differently on Mac and Windows, you should always use [ColorFromNative](#ColorFromNative) and [ColorToNative](ColorToNative).

When using the returned colorvalue, you need to add |0x1000000 at the end of it, like ColorToNative(20,30,40)|0x1000000. */
      function ColorToNative(r: number, g: number, b: number): number

      
      /** Returns the number of automation items on this envelope. See [GetSetAutomationItemInfo](#GetSetAutomationItemInfo). */
      function CountAutomationItems(env: TrackEnvelope): number

      
      /** Returns the number of points in the envelope. See [#CountEnvelopePointsEx](#CountEnvelopePointsEx) */
      function CountEnvelopePoints(envelope: TrackEnvelope): number

      
      /** Returns the number of points in the envelope.
autoitem\_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
For automation items, pass autoitem\_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
even if the automation item is trimmed so that not all points are visible.
Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.

See [GetEnvelopePointEx](#GetEnvelopePointEx), [SetEnvelopePointEx](#SetEnvelopePointEx), [InsertEnvelopePointEx](#InsertEnvelopePointEx), [DeleteEnvelopePointEx](#DeleteEnvelopePointEx). */
      function CountEnvelopePointsEx(envelope: TrackEnvelope, autoitem_idx: number): number

      
      /** count the number of items in the project (proj=0 for active project) */
      function CountMediaItems(proj: ReaProject): number

      
      /** returns the number of all markers and regions, as well as all markers and all regions in a project.
num_markersOut and num_regionsOut may be NULL. */
      function CountProjectMarkers(proj: ReaProject): [retval: number, num_markers: number, num_regions: number]

      
      /** count the number of selected items in the project (proj=0 for active project) */
      function CountSelectedMediaItems(proj: ReaProject): number

      
      /** Count the number of selected tracks in the project. 
This function ignores the master track, see [CountSelectedTracks2](#CountSelectedTracks2) */
      function CountSelectedTracks(proj: ReaProject): number

      
      /** Count the number of selected tracks in the project.
if you set wantmaster to true, it will include the master track as well. */
      function CountSelectedTracks2(proj: ReaProject, wantmaster: boolean): number

      
      /** See [GetTakeEnvelope](#GetTakeEnvelope) */
      function CountTakeEnvelopes(take: MediaItem_Take): number

      
      /** count the number of takes in the item */
      function CountTakes(item: MediaItem): number

      
      /** Count the number of FX parameter knobs displayed on the track control panel. */
      function CountTCPFXParms(project: ReaProject, track: MediaTrack): number

      
      /** Count the number of tempo/time signature markers in the project. See [GetTempoTimeSigMarker](#GetTempoTimeSigMarker), [SetTempoTimeSigMarker](#SetTempoTimeSigMarker), [AddTempoTimeSigMarker](#AddTempoTimeSigMarker), [DeleteTempoTimeSigMarker](#DeleteTempoTimeSigMarker). */
      function CountTempoTimeSigMarkers(proj: ReaProject): number

      
      /** Counts the number of track-envelopes of a certain track.
see [GetTrackEnvelope](#GetTrackEnvelope) */
      function CountTrackEnvelopes(track: MediaTrack): number

      
      /** count the number of items in the track */
      function CountTrackMediaItems(track: MediaTrack): number

      
      /** count the number of tracks in the project (proj=0 for active project) */
      function CountTracks(proj: ReaProject): number

      
      /** Create a new MIDI media item, containing no MIDI events. Time is in seconds unless qn is set. */
      function CreateNewMIDIItemInProj(track: MediaTrack, starttime: number, endtime: number, boolean: optional): MediaItem

      
      /** Create an audio accessor object for this take. Must only call from the main thread. 

See [CreateTrackAudioAccessor](#CreateTrackAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples). */
      function CreateTakeAudioAccessor(take: MediaItem_Take): AudioAccessor

      
      /** Create an audio accessor object for this track. Must only call from the main thread. See [CreateTakeAudioAccessor](#CreateTakeAudioAccessor), [DestroyAudioAccessor](#DestroyAudioAccessor), [AudioAccessorStateChanged](#AudioAccessorStateChanged), [GetAudioAccessorStartTime](#GetAudioAccessorStartTime), [GetAudioAccessorEndTime](#GetAudioAccessorEndTime), [GetAudioAccessorSamples](#GetAudioAccessorSamples). */
      function CreateTrackAudioAccessor(track: MediaTrack): AudioAccessor

      
      /** Create a send/receive (desttrInOptional!=NULL), or a hardware output (desttrInOptional==NULL) with default properties, return &gt;=0 on success (== new send/receive index). See [RemoveTrackSend](#RemoveTrackSend), [GetSetTrackSendInfo](#GetSetTrackSendInfo), [GetTrackSendInfo\_Value](#GetTrackSendInfo_Value), [SetTrackSendInfo\_Value](#SetTrackSendInfo_Value).

For ReaRoute-users: the outputs are hardware outputs, but with 512 added to the destination channel index (512 is the first rearoute channel, 513 the second, etc). */
      function CreateTrackSend(tr: MediaTrack, desttrIn: MediaTrack): number

      
      /** call this to force flushing of the undo states after using CSurf_On*Change() */
      function CSurf_FlushUndo(force: boolean): void

      
      /**  */
      function CSurf_GetTouchState(trackid: MediaTrack, isPan: number): boolean

      
      /** Moves the cursor to the end of the last item in the project. */
      function CSurf_GoEnd(): void

      
      /** Moves the cursor to the start of the project. */
      function CSurf_GoStart(): void

      
      /** counts the number of tracks, or the number of visible tracks, when mcpView is set to true. */
      function CSurf_NumTracks(mcpView: boolean): number

      
      /** Zoom or scroll the Arrangeview vertically. 
The stepsize with scrolling is track by track. */
      function CSurf_OnArrow(whichdir: number, wantzoom: boolean): void

      
      /** Moves editcursor forward, and optionally with seekplay. */
      function CSurf_OnFwd(seekplay: number): void

      
      /** Sets/toggles activation of FX-Chain. */
      function CSurf_OnFXChange(trackid: MediaTrack, en: number): boolean

      }
