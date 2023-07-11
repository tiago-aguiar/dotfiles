@echo off
call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
REM call "%ConEmuDir%"\..\init.bat"

set path=e:\Tiago\bin;%path%
set PATH=c:\Program Files (x86)\GnuWin32\bin;%PATH%
set PATH=c:\MinGW\bin;%PATH%
set PATH=c:\Java\jdk-19.0.1\bin;%PATH%
set PATH=e:\Android\Sdk\emulator;%PATH%
set PATH=e:\Android\Sdk\platform-tools;%PATH%
set PATH=e:\Tiago\programming\kotlin-language-server\server\build\install\server\bin;%PATH%
set PKG_CONFIG_PATH=c:\PkgConfigs
set JAVA_HOME="E:\Android Studio\jbr"

alias l=ls -al --color $*
alias gs=git status
alias gp=git pull origin $1
alias gc=git commit -m $1
alias ga=git add $1
alias gpp=git push origin
