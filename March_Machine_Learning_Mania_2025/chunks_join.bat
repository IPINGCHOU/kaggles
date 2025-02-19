@echo off
setlocal enabledelayedexpansion

rem Get the current folder
set "folder=%~dp0"

rem Output CSV file
set "output=%folder%concatenated.csv"

rem Temporary output file
set "temp_output=%folder%temp_concatenated.csv"

rem Create or clear the temporary output file
> "%temp_output%" echo.

rem Concatenate all CSV files
copy /b "%folder%\*.csv" "%temp_output%"

rem Add header and concatenate the temporary file to the final output
(
    echo ID,Pred
    type "%temp_output%"
) > "%output%"

rem Delete the temporary output file
del "%temp_output%"

echo CSV files concatenated successfully into %output%.
pause
