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

!define NINJA_MIN_TEXT $%NINJAMIN%

;===============================================================================
;
;   MUI
;

Unicode true

!include "MUI.nsh"
!include "WordFunc.nsh"


Name "${MOD_NAME} ${VER_TEXT}"
OutFile "${OUTDIR}\${MOD_FILE}-${VER_FILE}.exe"
InstallDir "$PROGRAMFILES\Piranha Bytes\Gothic\"
!define MOD_RKEY "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}"
InstallDirRegKey HKLM "${MOD_RKEY}" "InstallLocation"
AllowRootDirInstall true


; Bitmaps

!define MUI_WELCOMEFINISHPAGE_BITMAP "header.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "header.bmp"


; Konfiguration (Installer)

!define MUI_WELCOMEPAGE_TITLE_3LINES
!define MUI_WELCOMEPAGE_TEXT $(WelcomeText)
!define MUI_DIRECTORYPAGE_TEXT_TOP $(DirectoryTextTop)
!define MUI_COMPONENTSPAGE_NODESC
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_TITLE_3LINES

; Setup-Seiten (Installer)

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\LICENSE"
Page custom PageReinstall PageLeaveReinstall
!insertmacro MUI_PAGE_DIRECTORY
Page custom PageCheckRequirements PageCheckRequirementsValidate
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Konfiguration (Uninstaller)

!define MUI_WELCOMEPAGE_TITLE_3LINES
!define MUI_WELCOMEPAGE_TEXT $(UnWelcomeText)
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_TITLE_3LINES

; Setup-Seiten (Uninstaller)

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH


; Setup-Sprache

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "German"


; Reservierte Dateien

ReserveFile "header.bmp"
ReserveFile "setup.ini"
ReserveFile "checks.ini"
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
LangString WelcomeText ${LANG_ENGLISH} "This wizard will guide you through the installation of $(^Name).\r\n\r\nBefore installation you may close all other programs.\r\n\r\n$_CLICK"
LangString UnWelcomeText ${LANG_ENGLISH} "This wizard will guide you through the uninstallation of $(^Name).\r\n\r\nPlease close Gothic and any associated tools,\r\nbefore you proceed with the uninstallation.\r\n\r\n$_CLICK"

LangString TextInsuffRights ${LANG_GERMAN} "Beim Schreiben der Werte für die spätere Deinstallation trat ein Fehler auf.$\r$\nStellen Sie sicher, dass Ihr Benutzerkonto über die notwendigen Rechte verfügt.$\r$\n$\r$\n(HKLM\$R0)"
LangString WelcomeText ${LANG_GERMAN} "Dieser Assistent wird Sie durch die Installation von $(^Name) führen.\r\n\r\nEs wird empfohlen, vor der Installation alle anderen Programme zu schließen.\r\n\r\n$_CLICK"
LangString UnWelcomeText ${LANG_GERMAN} "Dieser Assistent wird Sie durch die Deinstallation von $(^Name) führen.\r\n\r\nBitte beenden Sie Gothic und alle verwandten Programme, bevor Sie mit der Deinstallation fortfahren.\r\n\r\n$_CLICK"


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
;   Callback-Funktionen
;


; Installer (Init)

Function .onInit
  Push $R0

  SetCurInstType 0

  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "checks.ini"
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


; Add note to directory selection page

LangString DirectoryTextTop ${LANG_ENGLISH} "Setup will install $(^NameDA) in the following folder. To install in a different folder, click Browse and select another folder.$\r$\n$\r$\nChoose the installation directory of Gothic.$\r$\n$\r$\n$_CLICK"
LangString DirectoryTextTop ${LANG_GERMAN} "$(^NameDA) wird in das unten angegebene Verzeichnis installiert. Falls Sie in ein anderes Verzeichnis installieren möchten, klicken Sie auf Durchsuchen und wählen Sie ein anderes Verzeichnis aus.$\r$\n$\r$\nWählen Sie das Verzeichnis aus, in welchem sich Gothic befindet.$\r$\n$\r$\n$_CLICK"


; Verify install requirements

LangString TextVerifyTitle ${LANG_ENGLISH} "Installation Requirements"
LangString TextVerifySubtitle ${LANG_ENGLISH} "Please review the installation requirements."
LangString TextVerifyNextButton ${LANG_ENGLISH} "Install"
LangString TextVerifyNotMet ${LANG_ENGLISH} "Not all installation requirements are met.\r\n\r\nPlease take the necessary actions."
LangString TextVerifyContinue ${LANG_ENGLISH} "&Continue anyway?"
LangString TextVerifyWarning ${LANG_ENGLISH} "Note: ${MOD_FILE} will not work in the current configuration."
LangString TextVerifyDownload ${LANG_ENGLISH} "Download"
LangString TextVerifyDownloadSp ${LANG_ENGLISH} "Download SystemPack"
LangString TextVerifyDownloadUnion ${LANG_ENGLISH} "Download Union"
LangString TextVerifyInstructions ${LANG_ENGLISH} "Instructions"
LangString TextVerifyOptionalRecom ${LANG_ENGLISH} "recommended"
LangString TextVerifyOr ${LANG_ENGLISH} "or"
LangString TextVerifyOrHigher ${LANG_ENGLISH} "or higher"
LangString TextVerifyDisabled ${LANG_ENGLISH} "disabled"
LangString TextVerifyIsInstalled ${LANG_ENGLISH} "is installed"
LangString TextVerifyIsDisabled ${LANG_ENGLISH} "is disabled"
LangString TextVerifyGothicVersion ${LANG_ENGLISH} "Please update your version."
LangString TextVerifyNinja ${LANG_ENGLISH} "An installation of Ninja is required."
LangString TextVerifyNinjaInvalid ${LANG_ENGLISH} "The Ninja installation is invalid or corrupted."
LangString TextVerifyNinjaVersion ${LANG_ENGLISH} "Please update your version. Currently"
LangString TextVerifySPUnion ${LANG_ENGLISH} "Either SystemPack or Union is highly recommended."
LangString TextVerifyNotInProgFiles ${LANG_ENGLISH} "Gothic not in 'Program Files'"
LangString TextVerifyBadDir ${LANG_ENGLISH} "These directories may cause issues for the game."
LangString TextVerifyProgFilesGood ${LANG_ENGLISH} "Gothic is installed somewhere else."
LangString TextVerifyDEPisOn ${LANG_ENGLISH} "Please disable DEP or add exemptions for Gothic."
LangString TextVerifyDEPexclude ${LANG_ENGLISH} "Make sure Gothic is listed as exemption."

LangString TextVerifyTitle ${LANG_GERMAN} "Installationsvoraussetzungen"
LangString TextVerifySubtitle ${LANG_GERMAN} "Bitte prüfen Sie die Voraussetzungen."
LangString TextVerifyNextButton ${LANG_GERMAN} "Installieren"
LangString TextVerifyNotMet ${LANG_GERMAN} "Nicht alle Voraussetzungen sind erfüllt.\r\n\r\nBitte unternehmen Sie die nötigen Schritte."
LangString TextVerifyContinue ${LANG_GERMAN} "&Trotzdem fortfahren?"
LangString TextVerifyWarning ${LANG_GERMAN} "Achtung: ${MOD_FILE} wird in dieser Konfiguration nicht funktionieren."
LangString TextVerifyDownload ${LANG_GERMAN} "Herunterladen"
LangString TextVerifyDownloadSp ${LANG_GERMAN} "SystemPack herunterladen"
LangString TextVerifyDownloadUnion ${LANG_GERMAN} "Union herunterladen"
LangString TextVerifyInstructions ${LANG_GERMAN} "Anleitung"
LangString TextVerifyOptionalRecom ${LANG_GERMAN} "empfohlen"
LangString TextVerifyOr ${LANG_GERMAN} "oder"
LangString TextVerifyOrHigher ${LANG_GERMAN} "oder höher"
LangString TextVerifyDisabled ${LANG_GERMAN} "deaktiviert"
LangString TextVerifyIsInstalled ${LANG_GERMAN} "ist installiert"
LangString TextVerifyIsDisabled ${LANG_GERMAN} "ist deaktiviert"
LangString TextVerifyGothicVersion ${LANG_GERMAN} "Bitte aktualisieren Sie Ihre Installation."
LangString TextVerifyNinja ${LANG_GERMAN} "Eine Installation von Ninja wird vorrausgesetzt."
LangString TextVerifyNinjaInvalid ${LANG_GERMAN} "Die Installation von Ninja ist ungültig oder beschädigt."
LangString TextVerifyNinjaVersion ${LANG_GERMAN} "Bitte aktualisieren Sie Ihre Installation. Derzeit"
LangString TextVerifySPUnion ${LANG_GERMAN} "Das SystemPack oder Union wird empfohlen."
LangString TextVerifyNotInProgFiles ${LANG_GERMAN} "Gothic nicht in 'Progamme' Verzeichnis"
LangString TextVerifyBadDir ${LANG_GERMAN} "Diese Verzeichnisse können Probleme verursachen."
LangString TextVerifyProgFilesGood ${LANG_GERMAN} "Gothic ist außerhalb installiert."
LangString TextVerifyDEPisOn ${LANG_GERMAN} "Deaktivieren Sie DEP oder fügen Sie Ausnahmen hinzu."
LangString TextVerifyDEPexclude ${LANG_GERMAN} "Prüfen Sie, ob Gothic als Ausnahme hinzugefügt ist."


Var HWND
Var DLGITEM
Var FONT

Var RequirementsInvalid
Var RequirementsRecommended
Var RequirementGothic
Var RequirementNinja
Var RequirementDep
Var RequirementSpUnion
Var RequirementProgFiles
Var InstalledNinjaVersion
Var InstalledSpUnion

Function PageCheckRequirements
  StrCpy $RequirementsInvalid ""
  StrCpy $RequirementsRecommended ""
  StrCpy $RequirementGothic ""
  StrCpy $RequirementNinja ""
  StrCpy $RequirementDep ""
  StrCpy $RequirementSpUnion ""
  StrCpy $RequirementProgFiles ""
  StrCpy $InstalledNinjaVersion ""
  StrCpy $InstalledSpUnion ""

  ; Check Gothic version
  MoreInfo::GetFileVersion $INSTDIR\System\Gothic.exe
  Pop $R0
  StrCmp $R0 "1.08k_mod" +3
    StrCpy $RequirementsInvalid "invalid"
    StrCpy $RequirementGothic $(TextVerifyGothicVersion)

  ; Check for Ninja
  IfFileExists $INSTDIR\System\Ninja.dll +4
    StrCpy $RequirementsInvalid "invalid"
    StrCpy $RequirementNinja $(TextVerifyNinja)
    Goto dep

  ; Check if Ninja is valid
  MoreInfo::GetFileVersion $INSTDIR\System\Ninja.dll
  Pop $R0
  ${WordFind} $R0 "." "E#" $R1
  IfErrors +2 +5
  IntCmp $R1 3 +4
    StrCpy $RequirementsInvalid "invalid"
    StrCpy $RequirementNinja $(TextVerifyNinjaInvalid)
    Goto dep

  ; Check Ninja version
  StrCpy $InstalledNinjaVersion $R0
  Push $R0
  Call explodeVersion
  Pop $R1
  Push ${NINJA_MIN_TEXT}
  Call explodeVersion
  Pop $R0
  IntCmp $R0 $R1 +3 +3
    StrCpy $RequirementsInvalid "invalid"
    StrCpy $RequirementNinja "$(TextVerifyNinjaVersion) $InstalledNinjaVersion."

  dep:

  ; Check DEP
  ClearErrors
  System::Call 'kernel32::GetSystemDEPPolicy() i() .r10'
  IfErrors spunion
  IntCmp $R0 1 0 +4 +4 ; AlwaysOn
    StrCpy $RequirementsInvalid "invalid"
    StrCpy $RequirementDep $(TextVerifyDEPisOn)
    Goto spunion
  IntCmp $R0 3 0 +3 +3 ; OptOut
    StrCpy $RequirementsRecommended "recommended"
    StrCpy $RequirementDep $(TextVerifyDEPexclude)

  spunion:

  ; Check for SystemPack (optional)
  IfFileExists $INSTDIR\Data\SystemPack.vdf 0 +3
    StrCpy $InstalledSpUnion "SystemPack"
    Goto progfiles
  IfFileExists $INSTDIR\System\Union.patch 0 +3
    StrCpy $InstalledSpUnion "Union"
    Goto progfiles
  StrCpy $RequirementsRecommended "recommended"
  StrCpy $RequirementSpUnion $(TextVerifySPUnion)

  progfiles:

  ; Check if installed in program files
  ClearErrors
  Push $INSTDIR
  Push $PROGRAMFILES64
  Call g2mod_StrStr
  Pop $R0
  IfErrors +2
  StrCmp $R0 "" 0 +8
  ClearErrors
  Push $INSTDIR
  Push $PROGRAMFILES
  Call g2mod_StrStr
  Pop $R0
  IfErrors +3
  StrCmp $R0 "" +3
    StrCpy $RequirementsRecommended "recommended"
    StrCpy $RequirementProgFiles $(TextVerifyBadDir)

  ; Evaluate verification
  StrCmp $RequirementsRecommended "" 0 +3
  StrCmp $RequirementsInvalid "" 0 +2
    Abort

  ; General text
  !insertmacro MUI_HEADER_TEXT $(TextVerifyTitle) $(TextVerifySubtitle)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Settings" "NextButtonText" $(TextVerifyNextButton)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 1" "Text" $(TextVerifyNotMet)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 2" "Text" $(TextVerifyContinue)
  StrCmp $RequirementsInvalid "" +3
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 3" "Text" "${U+26A0} $(TextVerifyWarning)"
    Goto +2
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 3" "Text" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 14" "Text" $(TextVerifyOptionalRecom)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 19" "Text" $(TextVerifyOptionalRecom)

  ; Links
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 6" "Text" $(TextVerifyDownload)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 6" "State" "https://www.worldofgothic.de/dl/download_6.htm"

  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 9" "Text" $(TextVerifyDownload)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 9" "State" "https://github.com/szapp/Ninja/releases"

  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 12" "Text" $(TextVerifyInstructions)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 12" "State" "https://clockwork-origins.com/spine/#faq-question-1576926774006"

  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "Text" $(TextVerifyDownloadSp)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "State" "https://github.com/GothicFixTeam/GothicFix/releases"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "Text" $(TextVerifyDownloadUnion)
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "State" "https://worldofplayers.ru/threads/40376/"

  ; Language dependent arrangement
  StrCmp $LANGUAGE "1033" 0 +7
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 13" "Right" 193
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 14" "Left" 196
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "Right" 190
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "Left" 193
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 18" "Right" 220
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 19" "Left" 223
  StrCmp $LANGUAGE "1031" 0 +7
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 13" "Right" 205
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 14" "Left" 208
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "Right" 202
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "Left" 205
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 18" "Right" 260
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 19" "Left" 263

  ; Gothic
  StrCmp $RequirementGothic "" 0 +8
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 4" "Text" "${U+2713} Gothic version 1.08k"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 5" "Text" "Version 1.08k $(TextVerifyIsInstalled)."
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 4" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 5" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 6" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 6" "Type" "Label"
    Goto +7
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 4" "Text" "${U+274C} Gothic version 1.08k"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 5" "Text" $RequirementGothic
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 4" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 5" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 6" "Flags" "NOTABSTOP"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 6" "Type" "Link"

  ; Ninja
  StrCmp $RequirementNinja "" 0 +8
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 7" "Text" "${U+2713} Ninja version ${NINJA_MIN_TEXT} $(TextVerifyOrHigher)"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 8" "Text" "Version $InstalledNinjaVersion $(TextVerifyIsInstalled)."
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 7" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 8" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 9" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 9" "Type" "Label"
    Goto +7
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 7" "Text" "${U+274C} Ninja version ${NINJA_MIN_TEXT} $(TextVerifyOrHigher)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 8" "Text" $RequirementNinja
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 7" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 8" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 9" "Flags" "NOTABSTOP"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 9" "Type" "Link"

  ; DEP
  StrCmp $RequirementDep "" 0 +8
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 10" "Text" "${U+2713} Data Execution Prevention (DEP) $(TextVerifyDisabled)"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 11" "Text" "DEP $(TextVerifyIsDisabled)."
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 10" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 11" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 12" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 12" "Type" "Label"
    Goto +7
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 10" "Text" "${U+274C} Data Execution Prevention (DEP) $(TextVerifyDisabled)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 11" "Text" $RequirementDep
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 10" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 11" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 12" "Flags" "NOTABSTOP"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 12" "Type" "Link"

  ; SystemPack or Union
  StrCmp $RequirementSpUnion "" 0 +11
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 13" "Text" "${U+2713} SystemPack $(TextVerifyOr) Union"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 15" "Text" "$InstalledSpUnion $(TextVerifyIsInstalled)."
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 13" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 14" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 15" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "Type" "Label"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "Type" "Label"
    Goto +10
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 13" "Text" "${U+274C} SystemPack $(TextVerifyOr) Union"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 15" "Text" $RequirementSpUnion
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 13" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 14" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 15" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "Flags" "NOTABSTOP"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "Flags" "NOTABSTOP"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 16" "Type" "Link"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 17" "Type" "Link"

  ; Program Files
  StrCmp $RequirementProgFiles "" 0 +7
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 18" "Text" "${U+2713} $(TextVerifyNotInProgFiles)"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 20" "Text" $(TextVerifyProgFilesGood)
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 18" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 19" "Flags" "DISABLED"
    !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 20" "Flags" "DISABLED"
    Goto +6
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 18" "Text" "${U+274C} $(TextVerifyNotInProgFiles)"
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 20" "Text" $RequirementProgFiles
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 18" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 19" "Flags" ""
  !insertmacro MUI_INSTALLOPTIONS_WRITE "checks.ini" "Field 20" "Flags" ""

  ; Set check box
  !insertmacro MUI_INSTALLOPTIONS_READ $R0 "checks.ini" "Field 2" "State"
  FindWindow $R1 "#32770" "" $HWNDPARENT
  GetDlgItem $R1 $HWNDPARENT 1
  EnableWindow $R1 $R0

  ; Generate dialog
  !insertmacro INSTALLOPTIONS_INITDIALOG "checks.ini"
  Pop $HWND

  ; Set headers to bold
  !insertmacro INSTALLOPTIONS_READ $DLGITEM "checks.ini" "Field 4" "HWND"
  CreateFont $FONT $(^Font) $(^FontSize) 700
  SendMessage $DLGITEM ${WM_SETFONT} $FONT 0

  !insertmacro INSTALLOPTIONS_READ $DLGITEM "checks.ini" "Field 7" "HWND"
  CreateFont $FONT $(^Font) $(^FontSize) 700
  SendMessage $DLGITEM ${WM_SETFONT} $FONT 0

  !insertmacro INSTALLOPTIONS_READ $DLGITEM "checks.ini" "Field 10" "HWND"
  CreateFont $FONT $(^Font) $(^FontSize) 700
  SendMessage $DLGITEM ${WM_SETFONT} $FONT 0

  !insertmacro INSTALLOPTIONS_READ $DLGITEM "checks.ini" "Field 13" "HWND"
  CreateFont $FONT $(^Font) $(^FontSize) 700
  SendMessage $DLGITEM ${WM_SETFONT} $FONT 0

  !insertmacro INSTALLOPTIONS_READ $DLGITEM "checks.ini" "Field 18" "HWND"
  CreateFont $FONT $(^Font) $(^FontSize) 700
  SendMessage $DLGITEM ${WM_SETFONT} $FONT 0

  ; Set optional to italic
  !insertmacro INSTALLOPTIONS_READ $DLGITEM "checks.ini" "Field 14" "HWND"
  CreateFont $FONT $(^Font) $(^FontSize) "" /ITALIC
  SendMessage $DLGITEM ${WM_SETFONT} $FONT 0

  !insertmacro INSTALLOPTIONS_READ $DLGITEM "checks.ini" "Field 19" "HWND"
  CreateFont $FONT $(^Font) $(^FontSize) "" /ITALIC
  SendMessage $DLGITEM ${WM_SETFONT} $FONT 0

  ; Set keyboard focus
  !insertmacro MUI_INSTALLOPTIONS_READ $R0 "checks.ini" "Field 2" "State"
  GetDlgItem $R1 $HWNDPARENT 3
  IntCmp $R0 1 +2
    SendMessage $HWND ${WM_SETFOCUS} $HWNDPARENT 0

  !insertmacro INSTALLOPTIONS_SHOW

FunctionEnd

Function PageCheckRequirementsValidate
  !insertmacro MUI_INSTALLOPTIONS_READ $R0 "checks.ini" "Field 2" "State"
  FindWindow $R1 "#32770" "" $HWNDPARENT
  GetDlgItem $R1 $HWNDPARENT 1
  EnableWindow $R1 $R0

  !insertmacro MUI_INSTALLOPTIONS_READ $R2 "checks.ini" "Settings" "State"
  StrCmp $R2 "2" +1 validate
  Abort

  validate:
  StrCmp $R0 "0" +1 ok
  Abort
  ok:
FunctionEnd
