@echo off
REM Call the test script in case of Delft3D 4 testcase.
REM 
REM First, an environment needs to be created. For 
REM this, run <create_venv_test.bat>

xcopy ..\..\install_d3d4-suite data\engines\teamcity_artifacts\x64\ /E /Y /I
call .venv\Scripts\activate.bat
call test.bat 
pause