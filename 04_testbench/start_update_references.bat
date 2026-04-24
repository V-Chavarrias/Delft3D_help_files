@echo off
REM Call the script to update references and cases.
REM 
REM First, an environment needs to be created. For 
REM this, run <create_venv_test.bat>

call .venv\Scripts\activate.bat
call update_references_cases.bat
pause