# -*- coding: utf-8 -*-
# Author: Chun-Yu Lee (Mat) <matlinuxer2@gmail.com>

import sys
import os
import shutil
import datetime

# build dependencies of dbus
os.system( "emerge libxml2" );
os.system( "emerge pthread-win32" );
os.system( "emerge expat" );

# rebuild libdbus
os.system( "emerge --unmerge dbus" );
os.system( "emerge dbus" );

# rebuild libdbus from git
os.system( "emerge --unmerge dbus-src" );
os.system( "emerge --target=gitHEAD dbus-src" );

# rebuild libdbus-c++
os.system( "emerge --unmerge dbus-c++-src" );
kderoot_manifest = os.path.join ( os.getenv('KDEROOT'), "manifest" )
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-bin.mft" ) 
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-bin.ver" ) 
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-lib.mft" ) 
os.system( "DEL " +kderoot_manifest+"\\dbus-c++-src-git-lib.ver" ) 
os.system( "emerge --target=gitFOLLOW dbus-c++-src" );

# gather files into a directory
dst = ".\\dbus-c++-inst"
dst1 = ".\\dbus-c++-inst1"
dst2 = ".\\dbus-c++-inst2"
os.system( "MD "+dst )
os.system( "MD "+dst1 )
os.system( "MD "+dst2 )

kderoot_build = os.path.join ( os.getenv('KDEROOT'), "build" )
src_expat_dir    = os.path.join( kderoot_build, "win32libs-bin\\expat-2.0.1\\image" )
src_pthread_dir  = os.path.join( kderoot_build, "testing\\pthreads-win32-2.7.0\\image" )
src_dbus_dir     = os.path.join( kderoot_build, "win32libs-bin\\dbus-1.4.1-2\\image" )
src_dbus_src_dir = os.path.join( kderoot_build, "win32libs-sources\\dbus-src-1.4.6-20110302\\image-mingw4-RelWithDebInfo-gitHEAD" )
src_dbuscxx_dir  = os.path.join( kderoot_build, "win32libs-sources\\dbus-c++-src-git\\image-mingw4-RelWithDebInfo-gitFOLLOW" )

os.system( "XCOPY "+src_expat_dir    + " " + dst1 + " /E/Y" )
os.system( "XCOPY "+src_pthread_dir  + " " + dst1 + " /E/Y" )
os.system( "XCOPY "+src_dbus_src_dir + " " + dst1 + " /E/Y" )
os.system( "XCOPY "+src_dbuscxx_dir  + " " + dst1 + " /E/Y" )

os.system( "XCOPY "+src_expat_dir    + " " + dst2 + " /E/Y" )
os.system( "XCOPY "+src_pthread_dir  + " " + dst2 + " /E/Y" )
os.system( "XCOPY "+src_dbus_dir     + " " + dst2 + " /E/Y" )
os.system( "XCOPY "+src_dbuscxx_dir  + " " + dst2 + " /E/Y" )


os.system( "DEL "+ dst + " /Q/S/F" )
os.system( "XCOPY "+ dst1 + " " + dst + " /E/Y" )
ver_num = datetime.datetime.utcnow().strftime("%Y%m%d-%H%M-dev")
os.system( "makensis -DVERSION_NUMBER="+ver_num+" .\dbus-c++.nsi" );

os.system( "DEL "+ dst + " /Q/S/F" )
os.system( "XCOPY "+ dst2 + " " + dst + " /E/Y" )
ver_num = datetime.datetime.utcnow().strftime("%Y%m%d-%H%M")
os.system( "makensis -DVERSION_NUMBER="+ver_num+" .\dbus-c++.nsi" );
