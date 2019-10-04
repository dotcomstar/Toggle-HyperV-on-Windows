:: Suppress verbose output of each line in the file (prints all by default).
@echo off
:: Ensure that exactly one argument is passed in to the program to specify
:: whether to enable or disable the HyperV
if not "%~1"=="" if "%~2"=="" goto SecondCheck
:InvalidArgumentMessage
ECHO This script requires exactly one parameter:
ECHO - enable or disable (the HyperV)
goto :EOF
::
:SecondCheck
:: Store the argument in a temporary variable for string comparison.
set argument=%~1
:: `/I` means to read case-insensitive
if /I "%argument%"=="enable" goto Enable
if /I "%argument%"=="disable" goto Disable
::else
goto InvalidArgumentMessage
::
:: Enable/Disable HyperV
:Enable
bcdedit /set hypervisorlaunchtype auto
goto Prompt
::
:Disable
bcdedit /set hypervisorlaunchtype off
goto Prompt
::
:Prompt
:: Prompt the user for input.
set /p ANSWER=Do you want restart now (Y/N)?
:: Note that `/I` means to read case-insensitive
if /I "%ANSWER%"=="y" goto Yes
if /I "%ANSWER%"=="n" goto No
::
:Yes
:: Restart right away.
echo Restarting...
shutdown /r /t 0
goto Continue
::
:No
:: Do Nothing.
echo Make sure to restart your computer for the changes to take effect.
goto Continue
::
:Continue
pause
