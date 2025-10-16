@echo off

REM This file executes a series of Sobek-RE simulations
REM with graded sediment in batch.
REM
REM victor.chavarrias@deltares.nl
REM 
REM $Revision: 2720 $
REM $Date: 2025-10-16 16:48:55 +0200 (Thu, 16 Oct 2025) $
REM $Author: chavarri $
REM $Id: run_sre.bat 2720 2025-10-16 14:48:55Z chavarri $
REM $HeadURL: https://svn.oss.deltares.nl/repos/openearthmodels/trunk/riverlab/input_files/01_submit/run_sre_batch/run_sre.bat $

REM
REM INPUT
REM

REM Modify. 

REM Path to the file with simulations to run. 
REM In each line, there must be one path to a folder. The path should
REM have no spaces (neither at the beginning, middle, or end of the 
REM line).
set fpath_in=c:\run_sre\input.txt 

REM Path to the <parsen.fnm> file. 
REM The paths in this file should refer to <WORK> folder. Can be 
REM relative. 
set fpath_parsen=c:\run_sre\parsen.fnm 

REM Path to the <sobeksim.fnm> file.
REM The paths in this file should refer to <WORK> folder. Can be 
REM relative. 
set fpath_sobeksim=c:\run_sre\sobeksim.fnm

REM Path to the project folder.
REM In this folder, folders <WORK> and <CMTWORK> are created. It 
REM is usually inside the Sobek-RE installation folder.
set fdir_proj=c:\SobekRE\Model\RIJNMORF.SBK\

REM Path to the Sobek-RE installation folder. 
set fdir_sre=c:\SobekRE\

REM
REM CALC
REM

REM Do not modify. 

set fdir_work=%fdir_proj%WORK\
echo WORK directory: %fdir_work%

set fdir_cmtwork=%fdir_proj%CMTWORK\
echo CMTWORK directory: %fdir_cmtwork%

set fpath_GSActive=%fdir_cmtwork%GSActive.dum

set fdir_exe=%fdir_sre%Programs\x64\
echo SRE-EXE directory: %fdir_exe%

set fpath_parsen_exe=%fdir_exe%parsen.exe
set fpath_sobeksim_exe=%fdir_exe%Sobeksim.exe

set fpath_Txtparse=%fdir_sre%Programs\Compute\Flow\river\Txtparse.bat

setlocal enabledelayedexpansion

for /f "tokens=*" %%a in (%fpath_in%) do (
    echo Running simulation: %%a
	 
	cd %fdir_work%
	
	if exist %fdir_work% del /Q %fdir_work%
	xcopy /E /I /Y %%a %fdir_work%
	
	if exist %fdir_cmtwork% del /Q %fdir_cmtwork%
	xcopy /E /I /Y %fpath_parsen% %fdir_cmtwork%
	xcopy /E /I /Y %fpath_sobeksim% %fdir_cmtwork%
	echo 0 > %fpath_GSActive%
	
	cd %fdir_cmtwork%
	
	%fpath_parsen_exe% parsen.fnm 
	call %fpath_Txtparse%
	%fpath_sobeksim_exe% sobeksim.fnm 
	
	REM copy output
	set fdir_out=%%a_output 
	echo Output directory: !fdir_out!
	xcopy /E /I /Y %fdir_work% !fdir_out!
	xcopy /E /I /Y %fdir_cmtwork% !fdir_out!

)

endlocal

pause