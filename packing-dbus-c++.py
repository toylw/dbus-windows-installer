# -*- coding: utf-8 -*-
# Author: Chun-Yu Lee (Mat) <matlinuxer2@gmail.com>

import sys
import os
import shutil
import datetime

ver_num = datetime.datetime.utcnow().strftime("%Y%m%d-%H%M")
expat_ver    = "2.0.1"
pthread_ver  = "2.7.0"
dbus_ver     = "1.4.10"
dbus_src_ver = "1.4.10-20110302"
dbuscxx_ver  = "gitFOLLOW"
dbuscxx_src_ver  = "git"

# build dependencies of dbus
os.system( "emerge libxml2" );
os.system( "emerge pthread-win32" );
os.system( "emerge expat" );

# rebuild libdbus from git
os.system( "emerge --unmerge dbus-src" );
os.system( "emerge --offline --target=%s dbus-src" % ( dbus_ver ) );

# rebuild libdbus-c++
os.system( "emerge --unmerge dbus-c++-src" );
os.system( "emerge --offline --target=%s dbus-c++-src" % ( dbuscxx_ver ) );

# gather files into a directory
dst = ".\\dbus-c++-inst"
dst1 = ".\\dbus-c++-inst1"
os.system( "MD "+dst )
os.system( "MD "+dst1 )

kderoot_build = os.path.join ( os.getenv('KDEROOT'), "build" )
src_expat_dir    = os.path.join( kderoot_build, "win32libs-bin\\expat-%s\\image" % ( expat_ver ) )
src_pthread_dir  = os.path.join( kderoot_build, "testing\\pthreads-win32-%s\\image" % ( pthread_ver ) )
src_dbus_src_dir = os.path.join( kderoot_build, "win32libs-sources\\dbus-src-%s\\image-mingw4-RelWithDebInfo-%s" % ( dbus_src_ver, dbus_ver ) )
src_dbuscxx_dir  = os.path.join( kderoot_build, "win32libs-sources\\dbus-c++-src-%s\\image-mingw4-RelWithDebInfo-%s" % ( dbuscxx_src_ver, dbuscxx_ver ) )

os.system( "XCOPY %s %s /E/Y" % ( src_expat_dir, dst1 ) )
os.system( "XCOPY %s %s /E/Y" % ( src_pthread_dir, dst1) )
os.system( "XCOPY %s %s /E/Y" % ( src_dbus_src_dir, dst1) )
os.system( "XCOPY %s %s /E/Y" % ( src_dbuscxx_dir, dst1) )

os.system( "DEL %s /Q/S/F" % ( dst ) )
os.system( "XCOPY %s %s /E/Y" % ( dst1, dst ) )
os.system( "makensis -DVERSION_NUMBER=%s-git .\dbus-c++.nsi" % ( dbus_ver ) );

