rem This script installs the required environment for running the testbench
SET PATH=c:\Users\%USERNAME%\AppData\Local\miniforge3\;%PATH%
python -m venv venv_test
call venv_test\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r pip/win-requirements.txt


