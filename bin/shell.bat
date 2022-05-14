@echo off
call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
call "%ConEmuDir%"\..\init.bat"
set path=e:\Tiago\bin;%path%