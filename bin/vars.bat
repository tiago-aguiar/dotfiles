@echo off
REM @echo off remove the output of command echo
echo "configure shell"

REM configure compiler
call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

REM configure emacs
IF NOT EXIST "c:\bin"      mklink /d "c:\bin"      "c:\dotfiles\bin"
IF NOT EXIST "c:\.emacs.d" mklink /d "c:\.emacs.d" "c:\dotfiles\.emacs.d"
IF NOT EXIST "c:\.emacs"   mklink    "c:\.emacs"   "c:\dotfiles\.emacs"
type nul > "c:\.emacs-custom.el"

REM scripts on path
set PATH=c:\bin;%PATH%