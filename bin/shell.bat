@echo off
call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
call "%ConEmuDir%"\..\init.bat"
set path=e:\Tiago\bin;%path%
set PATH=c:\Program Files (x86)\GnuWin32\bin;%PATH%
set PATH=c:\MinGW\bin;%PATH%
set PKG_CONFIG_PATH=c:\PkgConfigs
