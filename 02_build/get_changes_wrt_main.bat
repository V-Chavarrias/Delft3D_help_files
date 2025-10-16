@echo off
set PAGER="%PAGER%"
cd delft3d
cd src
git diff --oneline --name-only main...HEAD > ../../changed_files.txt
cd ..
cd ..
