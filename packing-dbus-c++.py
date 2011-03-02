# -*- coding: utf-8 -*-
# Author: Chun-Yu Lee (Mat) <matlinuxer2@gmail.com>

import sys
import os
import shutil

# 重新編譯 libdbus
os.system( "emerge --unmerge expat" );
os.system( "emerge expat" );

os.system( "emerge --unmerge libxml2" );
os.system( "emerge libxml2" );

# 重新編譯 libdbus
os.system( "emerge --unmerge dbus-src" );
os.system( "emerge --target=gitHEAD dbus-src" );

# 重新編譯 libdbus-c++
os.system( "emerge --unmerge dbus-c++-src" );
kderoot_manifest = os.path.join ( os.getenv('KDEROOT'), "manifest" )
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-bin.mft" ) 
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-bin.ver" ) 
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-lib.mft" ) 
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-lib.ver" ) 
os.system( "emerge --target=gitFOLLOW dbus-c++-src" );

# 將編譯後的結果集成至單一目錄下
dst = ".\\dbus-c++-inst"
os.system( "MD "+dst )

kderoot_build = os.path.join ( os.getenv('KDEROOT'), "build" )
src_expat_dir = os.path.join( kderoot_build, "win32libs-bin\\expat-2.0.1\\image" )
#src_dbus_dir = os.path.join( kderoot_build, "win32libs-bin\\dbus-1.4.1-2\\image" )
src_dbus_dir = os.path.join( kderoot_build, "win32libs-sources\\dbus-src-1.4.1-20110111\\image-mingw4-RelWithDebInfo-gitHEAD" )
src_dbuscxx_dir = os.path.join( kderoot_build, "win32libs-sources\\dbus-c++-src-git\\image-mingw4-RelWithDebInfo-gitFOLLOW" )

os.system( "XCOPY "+src_expat_dir + " " + dst + " /E/Y" )
os.system( "XCOPY "+src_dbus_dir + " " + dst + " /E/Y" )
os.system( "XCOPY "+src_dbuscxx_dir + " " + dst + " /E/Y" )

os.system( "makensis .\dbus-c++.nsi" );
