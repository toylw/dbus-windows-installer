# 
# Author: Chun-Yu Lee (Mat) <matlinuxer2@gmail.com>
# 

!include "Library.nsh"
!include "ProcFunc.nsh"

Name "DBus C++ Installer"
OutFile "DBus-C++-Installer.exe"

# 定義相關的目錄路徑
#!define KDEROOT "..\"
#!define TOP_SRC_DIR  "${KDEROOT}\build\win32libs-sources\dbus-c++-src-git\image-mingw4-RelWithDebInfo-gitFOLLOW\"
#!define TOP_SRC_DIR2 "${KDEROOT}\build\win32libs-sources\dbus-src-1.4.1-20110111\image-mingw4-RelWithDebInfo-1.4.1\"
!define SRC_IMG_DIR "dbus-c++-inst\"

;InstallDir "$TEMP\Library Test"
InstallDir "$PROGRAMFILES\D-Bus"

Page directory
Page instfiles

# 使用 WindowsXP 視覺樣式
XPStyle on

RequestExecutionLevel admin 

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
    File "${SRC_IMG_DIR}\lib\libdbus-1.dll.a"
    File "${SRC_IMG_DIR}\lib\libdbus-c++-1.dll.a"

    # RegDLL 沒有成功，但也不確定實際的功用為何
    ;RegDLL  "$INSTDIR\bin\libdbus-c++-1.dll"

    # 設定安裝的目標目錄
    SetOutPath "$INSTDIR\etc\"
    File "${SRC_IMG_DIR}\etc\dbus-1\session.conf"
    File "${SRC_IMG_DIR}\etc\dbus-1\system.conf"

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

    # NSIS 提供的 Library.nsh 的 Macro, 但目前沒有用到
    ;!insertmacro InstallLib DLL       NOTSHARED NOREBOOT_PROTECTED    ${TestDLL} $INSTDIR\test.dll $INSTDIR
    ;!insertmacro InstallLib REGEXE    $0        NOREBOOT_PROTECTED    ${TestEXE} $INSTDIR\test.exe $INSTDIR

    WriteUninstaller $INSTDIR\uninstall.exe
SectionEnd

Section uninstall
    # RegDLL 沒有成功，但也不確定實際的功用為何
    ;UnRegDLL  "$INSTDIR\bin\libdbus-c++-1.dll"
    ${TerminateProcess} "dbus-daemon.exe" $0
    Delete "$INSTDIR\*.*"
    RMDir /r "$INSTDIR"
SectionEnd





