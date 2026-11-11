@echo off
:: =========================================================================
:: PROJECT:     win-force-delete
:: AUTHOR:      BjornEriksson / Björn Eriksson
:: LICENSE:     MIT License
:: DESCRIPTION: A clean Windows native force deletion batch utility script 
::              designed to permanently erase locked or corrupted files
::              and directories using deep system prefix routing.
:: =========================================================================

title win-force-delete
mode con: cols=80 lines=20
chcp 65001 >nul

:MAIN
cls
echo -------------------------------------------------------------------------------
echo   win-force-delete
echo -------------------------------------------------------------------------------
echo.
echo   Instructions:
echo   Drag and drop the file or folder you want to permanently delete into 
echo   this window, then press ENTER.
echo.
set "TARGET="
set /p "TARGET=  Selected path: "

:: Remove any automatic quotes from the drag-and-drop
set "TARGET=%TARGET:"=%"

if "%TARGET%"==="" goto MAIN

:CONFIRM
cls
echo -------------------------------------------------------------------------------
echo   Confirmation Required
echo -------------------------------------------------------------------------------
echo.
echo   The following item has been queued for deletion:
echo   "%TARGET%"
echo.
echo   Warning: This item will be permanently deleted and cannot be restored.
echo   It will completely bypass the Windows Recycle Bin.
echo.
echo -------------------------------------------------------------------------------
set "CONFIRMATION="
set /p "CONFIRMATION=  Are you sure you want to delete this item? (Y/N): "

if /i "%CONFIRMATION%"=="N" goto CANCEL
if /i "%CONFIRMATION%"=="Y" goto PROCESS

goto CONFIRM

:PROCESS
cls
echo Processing deletion...
if exist "%TARGET%\" (
    rd /s /q "\\?\%TARGET%" >nul 2>&1
) else (
    del /f /q /a "\\?\%TARGET%" >nul 2>&1
)
echo.
echo Success: The item was permanently deleted from the system.
echo.
pause
goto MAIN

:CANCEL
cls
echo Deletion canceled by user.
echo.
timeout /t 2 >nul
goto MAIN
