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
REM %Script to update the references of the testbench cases.
REM %
REM %You have 'push' and 'pull', but you also have 'update-references'. The 
REM %'update-references' is the only command that will look in the local 
REM %'cases' directory, and compare them to the 'references' in minio. But 
REM %the catch is: It does updates only. So only local output files in the
REM %case directory that already exist in the minio references will be 
REM %updated. 'update-references' is only convenient for updating existing 
REM %references in MinIO. It does not create or delete files, because 
REM %usually there's a lot of extra stuff in the 'cases' directory that you
REM %do not need in the references. And the tool can't differentiate between
REM %input files and output files.

set HOME=C:\Users\chavarri

REM Case: references are updated
REM
REM The new references must be in the place where they are run by the
REM testbench script. E.g.:
REM <\test\deltares_testbench\data\cases\e02_f500_c01_hydro\DFM_OUTPUT_r\> 
REM I.e., a testcase is executed calling <test.bat> and the output can
REM be used to update the references. 
REM 
REM The call to the python tool only updates one testcase. Hence, add
REM a call for each testcase. 

python -m tools.minio update-references --issue-id UNST-7828 --config configs\dimr\dimr_dflowfm_dwaves_tutorial_course_win64.xml --test-case-name e100_f08_c06 --batch
python -m tools.minio update-references --issue-id UNST-7828 --config configs\dimr\dimr_dflowfm_dwaves_tutorial_course_win64.xml --test-case-name e100_f08_c07 --batch

REM Case: new references are added
REM
REM The new references must be in the references folder. E.g.:
REM <\test\deltares_testbench\data\reference_results\win64\e02_f500_c01_hydro\DFM_OUTPUT_r\>
REM I.e., a testcase is executed calling <test.bat> and the output must
REM be copied from the <cases> to the <reference_results> folder for
REM this to be uploaded. 
REM 
REM The call to the python tool only updates one testcase. Hence, add
REM a call for each testcase. 
REM
REM The name of the testcase folder must be <e#1_f#2_c#3>. The name automatically
REM changes once uploaded. 

python -m tools.minio push --issue-id UNST-8314 --config configs\dimr\dimr_dmorphology_validation_win64.xml --reference --test-case-name e02_f039_c10 --batch --allow-create-and-delete
python -m tools.minio push --issue-id UNST-8314 --config configs\dimr\dimr_dmorphology_validation_win64.xml --reference --test-case-name e02_f039_c11 --batch --allow-create-and-delete

REM Case: new case is added or case is updated
REM
REM The new case must be in the place where they are run by the
REM testbench script. E.g.:
REM <\test\deltares_testbench\data\cases\e02_f500_c01_hydro\> 
REM I.e., a testcase is executed calling <test.bat> and the output can
REM be used to update the references. 
REM 
REM The call to the python tool only updates one testcase. Hence, add
REM a call for each testcase. 
REM
REM The name of the testcase folder must be <e#1_f#2_c#3>. The name automatically
REM changes once uploaded. 

python -m tools.minio push --issue-id UNST-8314 --config configs\dimr\dimr_dmorphology_validation_win64.xml --case --test-case-name e02_f039_c10 --batch --allow-create-and-delete
python -m tools.minio push --issue-id UNST-8314 --config configs\dimr\dimr_dmorphology_validation_win64.xml --case --test-case-name e02_f039_c11 --batch --allow-create-and-delete

 
