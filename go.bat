@echo off
GOTO %1
:desktop
cd %USERPROFILE%\Desktop
GOTO END
:xampp
cd C:\xampp\htdocs
GOTO END
:DB
cd %USERPROFILE%\Dropbox
GOTO END
:tmp
cd C:\dev\tmp
GOTO END
:dev
cd C:\dev
GOTO END
:waas
cd C:\dev\mcux
GOTO END
:d
cd %USERPROFILE%\Desktop
GOTO END
:h
cd %USERPROFILE%
GOTO END
:END
