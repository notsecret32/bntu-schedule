@echo off
setlocal enabledelayedexpansion

rem Getting the relative path to the script
set script_name=pre-commit
set git_hook_name=pre-commit
for /f "delims=" %%a in ('git rev-parse --show-cdup') do set "git_root=%%a"
set "script_dir=%git_root%scripts"
set "git_hooks_dir=%git_root%.git\hooks"

rem Check if the script exists in the specified directory
if not exist "%script_dir%\%script_name%" (
    echo Error: Script '%script_name%' not found in '%script_dir%'
    exit /b 1
)

rem Deleting the old hook, if it exists
if exist "%git_hooks_dir%\%git_hook_name%" (
    del "%git_hooks_dir%\%git_hook_name%"
)

rem Creating a link to the script
mklink "%git_hooks_dir%\%git_hook_name%" "%script_dir%\%script_name%"

echo Script '%script_name%' installed as Git hook '%git_hook_name%'