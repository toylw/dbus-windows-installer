# -*- coding: utf-8 -*-
# Author: Chun-Yu Lee (Mat) <matlinuxer2@gmail.com>

import sys
import os
import shutil

# 重新編譯 pidgin-dbus
os.system( "emerge --unmerge pidgin-dbus" );
os.system( "emerge pidgin-dbus" );

# 將編譯後的結果集成至單一目錄下
dst = ".\\pidgin-dbus-inst"
os.system( "MD "+dst )

kderoot_build = os.path.join ( os.getenv('KDEROOT'), "build" )
src_pidgindbus_dir = os.path.join( kderoot_build, "testing\\pidgin-dbus-0.6.1\\image-mingw4-RelWithDebInfo-0.6.1\\lib\\pidgin" )

os.system( "XCOPY "+src_pidgindbus_dir+ " " + dst + " /E/Y" )
