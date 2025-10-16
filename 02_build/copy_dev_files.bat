@echo off
set "source_folder=c:\checkouts\d3d_input_files"
set "destination_folder=%CD%"

copy "%source_folder%\02_build\build_d3d4.bat" "%destination_folder%" /Y
copy "%source_folder%\02_build\build_fm.bat" "%destination_folder%" /Y
copy "%source_folder%\02_build\open_solution_fm.bat" "%destination_folder%" /Y
copy "%source_folder%\02_build\open_solution_d3d4.bat" "%destination_folder%" /Y
copy "%source_folder%\04_testbench\start_test_d3d4.bat" "%destination_folder%\test\deltares_testbench" /Y
copy "%source_folder%\04_testbench\start_test_fm.bat" "%destination_folder%\test\deltares_testbench" /Y
copy "%source_folder%\04_testbench\start_update_references.bat" "%destination_folder%\test\deltares_testbench" /Y
copy "%source_folder%\04_testbench\test.bat" "%destination_folder%\test\deltares_testbench" /Y
copy "%source_folder%\04_testbench\update_references.bat" "%destination_folder%\test\deltares_testbench" /Y
copy "%source_folder%\04_testbench\create_venv_test.bat .bat" "%destination_folder%\test\deltares_testbench" /Y
 
pause