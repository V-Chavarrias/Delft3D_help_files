@echo off
REM Create the environment for running the testbench.

SET PATH=c:\Users\%USERNAME%\AppData\Local\miniforge3\;%PATH%
python -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r pip/win-requirements.txt


