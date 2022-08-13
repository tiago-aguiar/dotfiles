@echo off
call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
call "%ConEmuDir%"\..\init.bat"

set path=e:\Tiago\bin;%path%
set PATH=c:\Program Files (x86)\GnuWin32\bin;%PATH%
set PATH=c:\MinGW\bin;%PATH%
set PATH=e:\Android\Sdk\emulator;%PATH%
set PATH=e:\Android\Sdk\platform-tools;%PATH%
set PATH=e:\Tiago\programming\kotlin-language-server\server\build\install\server\bin;%PATH%
set PKG_CONFIG_PATH=c:\PkgConfigs
set JAVA_HOME="e:\Android Studio\jre"

alias l=ls -al --color $*
alias gst=git status
alias ggpull=git pull
