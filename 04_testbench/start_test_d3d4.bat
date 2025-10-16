@echo off
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM %%%                 VTOOLS                 %%%
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM % 
REM %Victor Chavarrias (victor.chavarrias@deltares.nl)
REM %
REM %$Revision: 2689 $
REM %$Date: 2024-09-16 06:31:46 +0200 (Mon, 16 Sep 2024) $
REM %$Author: chavarri $
REM %$Id: test.bat 2689 2024-09-16 04:31:46Z chavarri $
REM %$HeadURL: https://svn.oss.deltares.nl/repos/openearthmodels/trunk/riverlab/input_files/04_testbench/test.bat $
REM %
REM %Call the test script.
REM %
REM %First, an environment needs to be created. For 
REM %this, run <create_venv_test.bat>

xcopy ..\..\install_d3d4-suite data\engines\teamcity_artifacts\x64\ /E /Y /I
call venv_test\Scripts\activate.bat
call test.bat 
pause