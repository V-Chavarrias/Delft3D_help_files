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
REM %Script to run testbench in MinIO.
REM %
REM %Run in Anaconda prompt at the level of <test/deltares_testbench>.
REM %
REM %The <x64> folder of the executables should be at <test/deltares_testbench/data/engines/teamcity_artifacts/x64>.
REM %E.G. D3D4:
REM %c:\checkouts\delft3d_branch\test\deltares_testbench\data\engines\teamcity_artifacts\bin\d_hydro.exe 
REM %
REM %Needs credentials from MinIO.
REM %`username` is `accessKey` in credentials.
REM %`password` is `secretKey` in credentials.
REM %`--config` can only refer to xml-files in:
REM %    * <test/deltares_testbench/configs>
REM %    * <test/deltares_testbench/configs/dimr>
REM %    * <test/deltares_testbench/configs/delft3d4>
REM %
REM %Here, the credentials from MinIO are stored in a local file. First line has the `accessKey` and second line the `secretKey`.

setlocal enabledelayedexpansion

REM %
REM % INPUT
REM %

REM %File path to the credentials file.
set "file=c:\Users\chavarri\OneDrive - Stichting Deltares\all\programas\batch\credentials.csv"

REM %
REM % CALL
REM %

REM %The file is copied to the local folder because otherwise it cannot be read if there are spaces in the path.
set "file_local=credentials.csv"
copy "%file%" "%file_local%"

REM %Read the file line by line
set "counter=0"
for /f "delims=" %%a in (%file_local%) do (
    set /a counter+=1
    set "line[!counter!]=%%a"
)

rem REM %Accessing each line using the array (to check that it has been read correctly)
rem for /l %%i in (1,1,%counter%) do (
rem     echo Line %%i: !line[%%i]!
rem )

REM %delete local file with credentials after it has been read
del "%file_local%"

REM %call the testbench script
python TestBench.py -c -i --config configs\dimr\dimr_dflowfm_processes_win64.xml --username !line[1]! --password !line[2]! --filter=testcase=e100_f08_c06,e100_f08_c07