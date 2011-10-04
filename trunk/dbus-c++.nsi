# 
# Author: Chun-Yu Lee (Mat) <matlinuxer2@gmail.com>
# 

;--------------------------------
; Include 
# standard modules
!include "Library.nsh"
!include "MUI2.nsh"

# 3rd modules
!include "ProcFunc.nsh"
!include "EnvVarUpdate.nsh"

;--------------------------------
; Parameters
Name "DBus Windows Installer (unofficial)"

OutFile "DBus-Windows-Installer-${VERSION_NUMBER}.exe"

# 定義相關的目錄路徑
!define SRC_IMG_DIR "dbus-c++-inst\"

; The default installation directory
InstallDir "$PROGRAMFILES\D-Bus"

; Registry key to check for directory (so if you install again, it will overwrite the old one automatically)
InstallDirRegKey HKLM "Software\D-Bus" "Install_Dir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

!insertmacro MUI_PAGE_WELCOME
;!insertmacro MUI_PAGE_LICENSE "${SRC_IMG_DIR}\License.txt"
;!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages
 
!insertmacro MUI_LANGUAGE "English"
 
;--------------------------------
; To install
;--------------------------------
Section
    # 設定安裝的目標目錄
    SetOutPath "$INSTDIR\bin\"
    File "${SRC_IMG_DIR}\bin\dbus-daemon.exe"
    File "${SRC_IMG_DIR}\bin\dbus-env.bat"
    File "${SRC_IMG_DIR}\bin\dbus-launch.exe"
    File "${SRC_IMG_DIR}\bin\dbus-monitor.exe"
    File "${SRC_IMG_DIR}\bin\dbus-send.exe"
    File "${SRC_IMG_DIR}\bin\dbusxx-introspect.exe"
    File "${SRC_IMG_DIR}\bin\dbusxx-xml2cpp.exe"
    File "${SRC_IMG_DIR}\bin\libdbus-1.dll"
    File "${SRC_IMG_DIR}\bin\libdbus-c++-1.dll"
    File "${SRC_IMG_DIR}\bin\libexpat.dll"
    File "${SRC_IMG_DIR}\bin\libpthreads.dll"

    SetOutPath "$INSTDIR\lib\"
    File "${SRC_IMG_DIR}\lib\libdbus-1.dll.a"
    File "${SRC_IMG_DIR}\lib\libdbus-c++-1.dll.a"
    File "${SRC_IMG_DIR}\lib\libpthreads.dll.a"

    # 設定安裝的目標目錄
    SetOutPath "$INSTDIR\etc\"
    File "${SRC_IMG_DIR}\etc\dbus-1\session.conf"
    File "${SRC_IMG_DIR}\etc\dbus-1\system.conf"

    # 設定安裝的目標目錄
    SetOutPath "$INSTDIR\include\"
    File "${SRC_IMG_DIR}\include\pthread.h"
    File "${SRC_IMG_DIR}\include\sched.h"

    # 設定安裝的目標目錄
    SetOutPath "$INSTDIR\include\dbus-c++\"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\api.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\connection.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\dbus.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\debug.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\dispatcher.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\error.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\eventloop-integration.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\eventloop.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\interface.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\introspection.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\message.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\object.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\pendingcall.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\property.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\refptr_impl.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\server.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\types.h"
    File "${SRC_IMG_DIR}\include\dbus-c++-1\dbus-c++\util.h"

    # 設定安裝的目標目錄
    SetOutPath "$INSTDIR\include\dbus\"
    File "${SRC_IMG_DIR}\include\dbus\dbus-address.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-arch-deps.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-bus.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-connection.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-errors.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-macros.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-memory.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-message.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-misc.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-pending-call.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-protocol.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-server.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-shared.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-signature.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-threads.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus-types.h"
    File "${SRC_IMG_DIR}\include\dbus\dbus.h"

    ;設定環璄變數 PATH，在win7 HKLM會失敗，沒有辦法 append
    ${EnvVarUpdate} $0 "PATH" "A" "HKCU" "$INSTDIR\bin"
    ;${EnvVarUpdate} $0 "Path" "A" "HKLM" "$INSTDIR\bin"

    ; Write the installation path into the registry
    WriteRegStr HKLM SOFTWARE\D-BUS "Install_Dir" "$INSTDIR"
    
    ; Write the uninstall keys for Windows
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\D-Bus" "DisplayName" "D-Bus"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\D-Bus" "UninstallString" '"$INSTDIR\uninstall.exe"'
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\D-Bus" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\D-Bus" "NoRepair" 1
    WriteUninstaller $INSTDIR\uninstall.exe
SectionEnd

;--------------------------------
; To uninstall
;--------------------------------
Section uninstall
    ; Remove registry keys
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\D-Bus"
    DeleteRegKey HKLM SOFTWARE\D-Bus

    ;設定環璄變數 PATH
    ${un.EnvVarUpdate} $0 "PATH" "R" "HKCU" "$INSTDIR\bin"
    ;${un.EnvVarUpdate} $0 "Path" "R" "HKLM" "$INSTDIR\bin"

    ; Kill running daemon
    ${TerminateProcess} "dbus-daemon.exe" $0

    Delete "$INSTDIR\*.*"
    RMDir /r "$INSTDIR"
SectionEnd
