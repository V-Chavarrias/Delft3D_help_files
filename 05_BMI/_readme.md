250411
victor.chavarrias@deltares.nl

# Running and controlling model via BMI

For running and controlling a model via BMI, follow these steps:
1. Create a virtual environment with BMI.
1. Prepare running environment (e.g., VS Code).
1. Run case.

## Create a virtual environment with BMI

Execute the bat-file with instruction <install_bmi.bat>.

## Prepare running environment (e.g., VS Code)

The steps are:
1. Download VS Code.
1. Allow for execution of outside script.
	1. Start a PowerShell with admin rights
	1. Change the policy running: `Set-ExecutionPolicy RemoteSigned` and selecting `A`
	1. Check that it worked running: `Get-ExecutionPolicy`
1. In VS Code.
	1. Activate the virtual environment
		1. Open a terminal (<ctrl+`>)
		1. Execute `.\venv\Scripts\activate`
	1. Select Python from environment
		1. <ctrl+alt+p> -> python select environment
		1. `venv\Scripts\python.exe`
	
## Run case

The steps are:
1. Adapt file <main_BMI>.
1. Run. 