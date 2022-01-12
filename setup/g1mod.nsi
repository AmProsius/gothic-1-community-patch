;===============================================================================
;
;                         G2MDK - DemoMod Setup-Script
;
;                    System:  NSIS 2.0  http://nsis.sf.net/
;                    Editor:  HMNE 2.0  http://hmne.sf.net/
;
;===============================================================================



; Kompressionseinstellungen

CRCCheck force
;SetCompressor  lzma
;SetCompressorDictSize 128 ; LZMA-Speicherverbrauch, siehe Tabelle
; DictSize Compress Decomp
;    8 MB   141 MB   10 MB (default)
;   12 MB   179 MB   14 MB
;   16 MB   217 MB   18 MB
;   24 MB   293 MB   26 MB
;   32 MB   369 MB   35 MB
;   48 MB   521 MB   50 MB
;   64 MB   673 MB   66 MB
;   96 MB   977 MB   98 MB
;  128 MB  1281 MB  130 MB
;  192 MB  1889 MB  194 MB
;!packhdr "packhdr.tmp" "upx.exe --best packhdr.tmp" ; http://upx.sf.net/


; Definitionen

; TODO: Version der Modifikation
!define VER_MAJOR $%VBASE%
!define VER_MINOR $%VMAJOR%
!define VER_PATCH $%VMINOR%
!define VER_FLAGS 0
!define VER_FILE  "${VER_MAJOR}.${VER_MINOR}.${VER_PATCH}"
!define VER_TEXT  "${VER_MAJOR}.${VER_MINOR}.${VER_PATCH}"

; TODO: Eigenschaften der Modifikation
!define MOD_FILE "$%PATCHNAME%" ; Mod-Dateiname (KEINE Leer- oder Sonderzeichen!)
!define MOD_NAME "$%LONGNAME%"  ; Mod-Titel
!define MOD_COMP "$%AUTHOR%"    ; Mod-Herausgeber
!define MOD_LINK "$%WEBSITE%"   ; Herausgeber-Link
!define MOD_COPY "$%AUTHOR%"    ; Copyright

!define SRC_BASEDIR "..\build\$%BTYPE%"
!define OUTDIR "..\build\$%BTYPE%"


;===============================================================================
;
;   MUI
;


!include "MUI.nsh"


Name "${MOD_NAME} ${VER_TEXT}"
OutFile "${OUTDIR}\${MOD_FILE}-${VER_FILE}.exe"
InstallDir "$PROGRAMFILES\Piranha Bytes\Gothic\"
!define MOD_RKEY "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}"
InstallDirRegKey HKLM "${MOD_RKEY}" "InstallLocation"
AllowRootDirInstall true


; Konfiguration (Installer)

!define MUI_WELCOMEPAGE_TITLE_3LINES
!define MUI_COMPONENTSPAGE_NODESC
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_TITLE_3LINES

; Setup-Seiten (Installer)

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\LICENSE"
Page custom PageReinstall PageLeaveReinstall
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Konfiguration (Uninstaller)

!define MUI_WELCOMEPAGE_TITLE_3LINES
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_TITLE_3LINES

; Setup-Seiten (Uninstaller)

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH


; Setup-Sprache

!define MUI_TEXT_WELCOME_INFO_TEXT "This wizard will guide you through the installation of $(^Name).$\r$\n$\r$\nBefore installation you may close all other programs.$\r$\n$\r$\n$_CLICK"
!define MUI_UNTEXT_WELCOME_INFO_TEXT "This wizard will guide you through the uninstallation of $(^Name).$\r$\n$\r$\nPlease close Gothic and any associated tools,$\r$\nbefore you proceed with the uninstallation.$\r$\n$\r$\n$_CLICK"
!insertmacro MUI_LANGUAGE "English"

!define MUI_TEXT_WELCOME_INFO_TEXT "Dieser Assistent wird Sie durch die Installation von $(^Name) führen.$\r$\n$\r$\nEs wird empfohlen, vor der Installation alle anderen Programme zu schließen.$\r$\n$\r$\n$_CLICK"
!define MUI_UNTEXT_WELCOME_INFO_TEXT "Dieser Assistent wird Sie durch die Deinstallation von $(^Name) führen.$\r$\n$\r$\nBitte beenden Sie Gothic und alle verwandten Programme, bevor Sie mit der Deinstallation fortfahren.$\r$\n$\r$\n$_CLICK"
!insertmacro MUI_LANGUAGE "German"

; Reservierte Dateien

ReserveFile "setup.ini"
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS


;===============================================================================
;
;   Installer
;


; Setup.exe Versionsinformationen (Sprache = MUI_LANGUAGE)
VIProductVersion "${VER_MAJOR}.${VER_MINOR}.${VER_PATCH}.${VER_FLAGS}"
VIAddVersionKey /LANG=1200 "ProductName"      "${MOD_NAME}"
VIAddVersionKey /LANG=1200 "ProductVersion"   "${VER_TEXT}"
VIAddVersionKey /LANG=1200 "CompanyName"      "${MOD_COMP}"
VIAddVersionKey /LANG=1200 "FileVersion"      "${VER_TEXT}"
VIAddVersionKey /LANG=1200 "LegalCopyright"   "${MOD_COPY}  <${MOD_LINK}>"
VIAddVersionKey /LANG=1200 "FileDescription"  "${MOD_NAME}"
VIAddVersionKey /LANG=1200 "OriginalFilename" "${MOD_FILE}-${VER_FILE}.exe"


LangString NameInstFull ${LANG_ENGLISH} "Complete"
LangString NameInstFull ${LANG_GERMAN} "Vollständig"
InstType $(NameInstFull)


!include ".\g1mod.nsh"


;-------------------------------------------------------------------------------
;
;   Init (nicht angezeigt)
;


; Installer

LangString TextInsuffRights ${LANG_ENGLISH} "Setting up the uninstalling option failed.$\r$\nMake sure you have sufficient permission (administrator).$\r$\n$\r$\n(HKLM\$R0)"
LangString TextInsuffRights ${LANG_GERMAN} "Beim Schreiben der Werte für die spätere Deinstallation trat ein Fehler auf.$\r$\nStellen Sie sicher, dass Ihr Benutzerkonto über die notwendigen Rechte verfügt.$\r$\n$\r$\n(HKLM\$R0)"

Section -pre
  Push $R0

  SetDetailsPrint none
  StrCpy $R0 "${MOD_RKEY}"

  ; Setup-Parameter in die Registrierung schreiben
  ClearErrors
  WriteRegExpandStr HKLM $R0 "InstallLocation" $INSTDIR
  IfErrors "" write
  MessageBox MB_OK|MB_ICONSTOP $(TextInsuffRights)
  Pop $R0
  Abort
  write:
  WriteRegDWORD     HKLM $R0 "VersionMajor"    ${VER_MAJOR}
  WriteRegDWORD     HKLM $R0 "VersionMinor"    ${VER_MINOR}
  WriteRegDWORD     HKLM $R0 "VersionPatch"    ${VER_PATCH}
  WriteRegDWORD     HKLM $R0 "VersionFlags"    ${VER_FLAGS}
  WriteRegStr       HKLM $R0 "DisplayIcon"     "$INSTDIR\system\Gothic.exe,0"
  WriteRegStr       HKLM $R0 "DisplayName"     "${MOD_NAME}"
  WriteRegStr       HKLM $R0 "DisplayVersion"  "${VER_TEXT}"
  WriteRegDWORD     HKLM $R0 "NoModify"        1
  WriteRegDWORD     HKLM $R0 "NoRepair"        1
  WriteRegExpandStr HKLM $R0 "UninstallString" "$INSTDIR\${MOD_FILE}-uninst.exe"
  WriteRegStr       HKLM $R0 "Publisher"       "${MOD_COMP}"
  WriteRegStr       HKLM $R0 "URLInfoAbout"    "${MOD_LINK}"

  Pop $R0
SectionEnd


;-------------------------------------------------------------------------------
;
;   Modifikation
;


; Installer

LangString NameSecModFiles ${LANG_ENGLISH} "${MOD_NAME}"
LangString TextSecModFiles ${LANG_ENGLISH} "Installing ${MOD_NAME}..."
LangString NameRemoveMod ${LANG_ENGLISH} "Remove ${MOD_NAME}"

LangString NameSecModFiles ${LANG_GERMAN} "${MOD_NAME}"
LangString TextSecModFiles ${LANG_GERMAN} "Installiere ${MOD_NAME}..."
LangString NameRemoveMod ${LANG_GERMAN} "${MOD_NAME} entfernen"

Section !$(NameSecModFiles) SecModFiles

  SectionIn RO ; nicht abwählbar

  SetDetailsPrint textonly
  DetailPrint $(TextSecModFiles)
  SetDetailsPrint listonly

  SetOverwrite on

  ; Eventuelles Mod-Volume in /Data entfernen
  !insertmacro g2mod_DeleteFile "$INSTDIR\Data\${MOD_FILE}.vdf"
  ; Installiere Mod-Volume
  SetOutPath "$INSTDIR\Data"
  File      "${SRC_BASEDIR}\${MOD_FILE}.vdf"

  ; Einträge im Startmenü
  SetShellVarContext current
  !insertmacro g2mod_CreateDirectory "$SMPROGRAMS\Piranha Bytes\Gothic\Mods"
  CreateShortCut "$SMPROGRAMS\Piranha Bytes\Gothic\Mods\$(NameRemoveMod)" \
   	"$INSTDIR\${MOD_FILE}-uninst.exe"

SectionEnd


; Uninstaller

Section !un.$(NameSecModFiles) unSecModFiles

  SectionIn RO  ; nicht abwählbar

  ; Mod-Volume und Mod-Volume-Map entfernen
  !insertmacro g2mod_DeleteFile "$INSTDIR\vdfs_${MOD_FILE}.dmp"
  !insertmacro g2mod_DeleteFile "$INSTDIR\Data\${MOD_FILE}.vdf"

  ; Einträge im Startmenü entfernen
  SetShellVarContext current
  !insertmacro g2mod_DeleteFile "$SMPROGRAMS\Piranha Bytes\Gothic\Mods\$(NameRemoveMod).lnk"
  ; Werden nur entfernt, falls die Verzeihcnisse leer sind...
  !insertmacro g2mod_RemoveDirectory "$SMPROGRAMS\Piranha Bytes\Gothic\Mods"
  !insertmacro g2mod_RemoveDirectory "$SMPROGRAMS\Piranha Bytes\Gothic"
  !insertmacro g2mod_RemoveDirectory "$SMPROGRAMS\Piranha Bytes"

SectionEnd


;-------------------------------------------------------------------------------
;
;   Cleanup (nicht angezeigt)
;


; Installer

Section -post

  SetDetailsPrint none

  ; Uninstaller schreiben
  Delete           "$INSTDIR\${MOD_FILE}-uninst.exe"
  WriteUninstaller "$INSTDIR\${MOD_FILE}-uninst.exe"

SectionEnd


; Uninstaller

Section -un.post

  SetDetailsPrint none

  ; Registrierungsdaten entfernen
  DeleteRegKey HKLM "${MOD_RKEY}"

  ; Uninstaller entfernen
  Delete "$INSTDIR\${MOD_FILE}-uninst.exe"

SectionEnd


;===============================================================================
;
;   Player-Kit
;


;Section -g2mpk
;  SetOverwrite on
;  SetDetailsPrint none
;  SetShellVarContext current
;  !insertmacro g2mod_InstallPlayerKit
;SectionEnd


;===============================================================================
;
;   Callback-Funktionen
;


; Installer (Init)

Function .onInit
  Push $R0

  SetCurInstType 0

  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "setup.ini"

  ; Kein 'unsichtbares' Setup
  SetSilent normal

  ; $INSTDIR bereits gültig?
  IfFileExists "$INSTDIR\system\Gothic.exe" done

  ; Sonst Add-ON Installation suchen (Registrierung)
  Call g2mod_GetInstallLocation
  Pop $R0
  StrCmp $R0 "" done
  ; Übernehmen
  StrCpy $INSTDIR $R0

  done:
  Pop $R0
FunctionEnd


; Uninstaller (Init)

LangString TextInvalidUninstall ${LANG_ENGLISH} "The installation directory is invalid.$\r$\nContinue uninstalling anyway?"
LangString TextInvalidUninstall ${LANG_GERMAN} "Das Installationsverzeichnis scheint ungültig zu sein.$\r$\nSoll die Deinstallation trotzdem fortgesetzt werden?"

Function un.onInit
  Push $R0

  ; $INSTDIR gültig?
  IfFileExists "$INSTDIR\system\Gothic.exe" done

  ; Mod-Installation suchen (Registrierung)
  ReadRegStr $R0 HKLM "${MOD_RKEY}" "InstallLocation"
  StrCmp $R0 "" wrong
  StrCpy $INSTDIR $R0
  IfFileExists "$INSTDIR\system\Gothic.exe" done
  ; Nicht gefunden...
  wrong:
  MessageBox MB_YESNO|MB_ICONQUESTION $(TextInvalidUninstall) IDYES done
    Pop $R0
    Abort

  done:
  Pop $R0
FunctionEnd


; Reinstall

LangString TextReinstTitle ${LANG_ENGLISH} "Previous Installation"
LangString TextReinstHead1 ${LANG_ENGLISH} "Choose how $(^Name) should be installed."
LangString TextReinstOpt1A ${LANG_ENGLISH} "Uninstall first"
LangString TextReinstOpt1B ${LANG_ENGLISH} "Do not uninstall"
LangString TextReinstHead2 ${LANG_ENGLISH} "Choose the repair option."
LangString TextReinstOpt2A ${LANG_ENGLISH} "Re-install"
LangString TextReinstOpt2B ${LANG_ENGLISH} "Uninstall $(^Name)"
LangString TextReinstWrong ${LANG_ENGLISH} "An incompatible version is already installed!\r\nIf you want to install this version,\r\nyou should uninstall the current version first."
LangString TextReinstOlder ${LANG_ENGLISH} "An older version is installed on your system.\r\nIt is recommended to uninstall the current version first."
LangString TextReinstNewer ${LANG_ENGLISH} "A newer version is already installed on your system!\r\nIt is not recommended to install an older version. If you really want to install the older version, you should uninstall the current version first."
LangString TextReinstEqual ${LANG_ENGLISH} "$(^Name) is already installed."

LangString TextReinstTitle ${LANG_GERMAN} "Vorherige Installation"
LangString TextReinstHead1 ${LANG_GERMAN} "Wählen Sie aus, wie $(^Name) installiert werden soll."
LangString TextReinstOpt1A ${LANG_GERMAN} "Vorher deinstallieren"
LangString TextReinstOpt1B ${LANG_GERMAN} "Nicht deinstallieren"
LangString TextReinstHead2 ${LANG_GERMAN} "Wählen Sie die auszuführende Wartungsoption aus."
LangString TextReinstOpt2A ${LANG_GERMAN} "Erneut installieren"
LangString TextReinstOpt2B ${LANG_GERMAN} "$(^Name) deinstallieren"
LangString TextReinstWrong ${LANG_GERMAN} "Eine inkompatible Version ist bereits installiert!\r\nWenn Sie diese Version wirklich installieren wollen,\r\nsollten Sie die aktuelle Version vorher deinstallieren."
LangString TextReinstOlder ${LANG_GERMAN} "Eine ältere Version ist auf Ihrem System installiert.\r\nEs wird empfohlen die aktuelle Version vorher zu deinstallieren."
LangString TextReinstNewer ${LANG_GERMAN} "Eine neuere Version ist bereits auf Ihrem System installiert!\r\nEs wird empfohlen die ältere Version nicht zu installieren. Wenn Sie diese ältere Version wirklich installieren wollen, sollten Sie die aktuelle Version vorher deinstallieren."
LangString TextReinstEqual ${LANG_GERMAN} "$(^Name) ist bereits installiert."

Function PageReinstall

  ; Installationsverzeichnis lesen
  ReadRegStr $R0 HKLM "${MOD_RKEY}" "InstallLocation"
  StrCmp $R0 "" 0 +2
  Abort

  ; Version überprüfen
  ReadRegDWORD $R0 HKLM "${MOD_RKEY}" "VersionFlags"
  IntCmp $R0 ${VER_FLAGS} major wrong wrong
  major:
  ReadRegDWORD $R0 HKLM "${MOD_RKEY}" "VersionMajor"
  IntCmp $R0 ${VER_MAJOR} minor older newer
  minor:
  ReadRegDWORD $R0 HKLM "${MOD_RKEY}" "VersionMinor"
  IntCmp $R0 ${VER_MINOR} patch older newer
  patch:
  ReadRegDWORD $R0 HKLM "${MOD_RKEY}" "VersionPatch"
  IntCmp $R0 ${VER_PATCH} equal older newer
  wrong:
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 1" "Text" "$(TextReinstWrong)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 2" "Text" "$(TextReinstOpt1A)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 3" "Text" "$(TextReinstOpt1B)"
  !insertmacro MUI_HEADER_TEXT "$(TextReinstTitle)" "$(TextReinstHead1)"
  StrCpy $R0 "1"
  Goto start
  older:
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 1" "Text" "$(TextReinstOlder)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 2" "Text" "$(TextReinstOpt1A)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 3" "Text" "$(TextReinstOpt1B)"
  !insertmacro MUI_HEADER_TEXT "$(TextReinstTitle)" "$(TextReinstHead1)"
  StrCpy $R0 "1"
  Goto start
  newer:
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 1" "Text" "$(TextReinstNewer)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 2" "Text" "$(TextReinstOpt1A)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 3" "Text" "$(TextReinstOpt1B)"
  !insertmacro MUI_HEADER_TEXT "$(TextReinstTitle)" "$(TextReinstHead1)"
  StrCpy $R0 "1"
  Goto start
  equal:
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 1" "Text" "$(TextReinstEqual)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 2" "Text" "$(TextReinstOpt2A)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "setup.ini" "Field 3" "Text" "$(TextReinstOpt2B)"
  !insertmacro MUI_HEADER_TEXT "$(TextReinstTitle)" "$(TextReinstHead2)"
  StrCpy $R0 "2"
  start:
  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "setup.ini"

FunctionEnd

Function PageLeaveReinstall

  !insertmacro MUI_INSTALLOPTIONS_READ $R1 "setup.ini" "Field 2" "State"
  StrCmp $R0 "1" 0 +2
  StrCmp $R1 "1" inst done
  StrCmp $R0 "2" 0 +3
  StrCmp $R1 "1" done inst
  inst:
  HideWindow
  ReadRegStr $R1 HKLM "${MOD_RKEY}" "UninstallString"
  ClearErrors
  ExecWait '$R1 _?=$INSTDIR'
  IfErrors nope
  IfFileExists $R1 "" nope
  Delete $R1
  nope:
  StrCmp $R0 "2" 0 +2
  Quit
  BringToFront

  done:
FunctionEnd
