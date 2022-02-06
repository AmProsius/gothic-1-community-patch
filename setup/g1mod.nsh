;===============================================================================
;
;               G2MOD (Gothic II - Modification) Setup Macros
;               Copyright (c) 2004 Nico Bendlin - Version 2.6
;
;                  System:   NSIS 2.0  http://nsis.sf.net/
;                  Editor:   HMNE 2.0  http://hmne.sf.net/
;
;===============================================================================


!ifndef G2MOD_NSH_INCLUDED
!define G2MOD_NSH_INCLUDED


;===============================================================================
;
;   Player-Kit
;

;===============================================================================
;
;   Install
;


Function .onVerifyInstDir
  IfFileExists $INSTDIR\System\Gothic.exe +2
    Abort
FunctionEnd

Function g2mod_GetInstallLocation
  Push $R0
  Push $R1
  Push $R2
  StrCpy $R1 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Gothic"
  ReadRegStr $R0 HKLM $R1 "InstallLocation"
  StrCmp $R0 "" "" done
  ReadRegStr $R0 HKLM $R1 "UninstallString"
  StrCmp $R0 "" done
  Push $R0
  Push "\UNWISE.EXE"
  Call g2mod_StrStr
  Pop $R1
  StrCmp $R1 "" "" +2
  StrCpy $R1 $R0
  StrLen $R2 $R1
  StrLen $R1 $R0
  IntOp $R1 $R1 - $R2
  StrCpy $R0 $R0 $R1
  GetFullPathName $R0 $R0
  done:
  Pop $R2
  Pop $R1
  Exch $R0
FunctionEnd


!macro g2mod_SetOutPath FILEPATH
  StrCmp "$OUTDIR" "${FILEPATH}" +2
  SetOutPath "${FILEPATH}"
!macroend


;===============================================================================
;
;   Directories
;


!macro g2mod_CreateDirectory FILEPATH
  IfFileExists "${FILEPATH}" +2
  CreateDirectory "${FILEPATH}"
!macroend


!macro g2mod_RemoveDirectory FILEPATH
  IfFileExists "${FILEPATH}\*.*" "" +2
  RMDir "${FILEPATH}"
!macroend


;===============================================================================
;
;   Files
;


!macro g2mod_DeleteFile FILENAME
  IfFileExists "${FILENAME}" "" +2
  Delete "${FILENAME}"
!macroend


!macro g2mod_BackupFile FILENAME
  IfFileExists "${FILENAME}" "" +4
  IfFileExists "${FILENAME}.bak" "" +2
  Delete "${FILENAME}.bak"
  Rename "${FILENAME}" "${FILENAME}.bak"
!macroend


!macro g2mod_RestoreFile FILENAME
  IfFileExists "${FILENAME}.bak" "" +4
  IfFileExists "${FILENAME}" "" +2
  Delete "${FILENAME}"
  Rename "${FILENAME}.bak" "${FILENAME}"
!macroend


!macro g2mod_SetFilename FILENAME
  IfFileExists "${FILENAME}" "" +2
  Rename "${FILENAME}" "${FILENAME}"
!macroend


;===============================================================================
;
;   Volumes
;


!macro g2mod_DisableVolume FILENAME
  IfFileExists "${FILENAME}" "" +4
  IfFileExists "${FILENAME}.disabled" "" +2
  Delete "${FILENAME}.disabled"
  Rename "${FILENAME}" "${FILENAME}.disabled"
!macroend


!macro g2mod_EnableVolume FILENAME
  IfFileExists "${FILENAME}.disabled" "" +4
  IfFileExists "${FILENAME}" "" +2
  Delete "${FILENAME}"
  Rename "${FILENAME}.disabled" "${FILENAME}"
!macroend


!macro g2mod_ExtractVolumeEx FILENAME ROOT
  !insertmacro g2mod_SetOutPath "${ROOT}"
  IfFileExists "${FILENAME}" "" +3
  ExecWait '"${ROOT}\_work\tools\VDFS\GothicVDFS.exe" /X "${FILENAME}"'
  Goto +3
  IfFileExists "${FILENAME}.disabled" "" +2
  ExecWait '"${ROOT}\_work\tools\VDFS\GothicVDFS.exe" /X "${FILENAME}.disabled"'
!macroend


!macro g2mod_ExtractVolume FILENAME
  !insertmacro g2mod_ExtractVolumeEx "${FILENAME}" $INSTDIR
!macroend


!macro g2mod_ExtractAndDisableVolume FILENAME
  !insertmacro g2mod_ExtractVolume "${FILENAME}"
  !insertmacro g2mod_DisableVolume "${FILENAME}"
!macroend


;===============================================================================
;
;   Utilities
;


Function g2mod_StrStr
  Exch $R1
  Exch
  Exch $R2
  Push $R3
  Push $R4
  Push $R5
  StrLen $R3 $R1
  StrCpy $R4 0
  loop:
  StrCpy $R5 $R2 $R3 $R4
  StrCmp $R5 $R1 done
  StrCmp $R5 "" done
  IntOp $R4 $R4 + 1
  Goto loop
  done:
  StrCpy $R1 $R2 "" $R4
  Pop $R5
  Pop $R4
  Pop $R3
  Pop $R2
  Exch $R1
FunctionEnd

Function explodeVersion
  Pop $R0
  Push $R1
  Push $R2
  Push $R3
  ${WordFind} $R0 "." "+1" $R1
  ${WordFind} $R0 "." "+2" $R2
  ${WordFind} $R0 "." "+3" $R3
  IntOp $R0 $R1 * 1000
  IntOp $R2 $R2 * 100
  IntOp $R0 $R0 + $R2
  IntOp $R0 $R0 + $R3
  Pop $R3
  Pop $R2
  Pop $R1
  Push $R0
FunctionEnd

;===============================================================================


!endif ;G2MOD_NSH_INCLUDED

