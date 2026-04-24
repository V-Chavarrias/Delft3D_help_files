@echo off
REM Call the test script in case of Delft3D FM testcase.
REM 
REM First, an environment needs to be created. For 
REM this, run <create_venv_test.bat>

xcopy ..\..\install_all data\engines\teamcity_artifacts\x64\ /E /Y /I

for %%F in ("data\engines\teamcity_artifacts\x64\bin\dimr.exe" "data\engines\teamcity_artifacts\x64\bin\dflowfm-cli.exe") do (
	if exist "%%~fF" echo %%~nxF generated at: %%~tF
)

call .venv\Scripts\activate.bat
call test.bat 
pause