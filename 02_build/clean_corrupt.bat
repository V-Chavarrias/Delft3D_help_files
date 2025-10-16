@echo off
	rem @echo off: This command turns off command echoing, which makes the batch file's commands not display in the console as they are executed.

	rem setlocal enabledelayedexpansion: This command enables delayed expansion of variables, which is needed for working with variables inside loops.
setlocal enabledelayedexpansion

	rem Set the searchFolder variable to the path of the main folder where you want to search for the subfolder.
set "searchFolder=%CD%"

	rem Set the targetFolderName variable to the name of the subfolder you want to find.
set "targetFolderName=vc160.pdb"

	rem The for /r loop iterates recursively through all files and subfolders under the searchFolder.
	rem Inside the loop, it checks if the name of each file (%%~nxF) matches the targetFolderName (case-insensitive comparison using /i). If it matches, it displays the full path of that file.
for /r "%searchFolder%" %%F in (*) do (
    if /i "%%~nxF"=="%targetFolderName%" (
        echo %%~dpF%%~nxF
		del	%%~dpF%%~nxF
    )
)

echo DONE
pause
