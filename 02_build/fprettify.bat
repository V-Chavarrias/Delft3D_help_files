cd delft3d
for /F "tokens=*" %%A in (../changed_files.txt) do (
    echo %%A
    if %%~xA == .f90 (c:\Users\ottevan\AppData\Local\miniforge3\envs\fprettify\Scripts\fprettify.exe --config-file .fprettify.rc %%A )
    if %%~xA == .F90 (c:\Users\ottevan\AppData\Local\miniforge3\envs\fprettify\Scripts\fprettify.exe --config-file .fprettify.rc %%A )
)
cd ..
