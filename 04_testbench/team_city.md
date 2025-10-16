#only test one case and get output

Go to the "Delft3D > Windows > Test project":
*	https://dpcbuild.deltares.nl/buildConfiguration/Delft3D_WindowsTest?branch=merge-requests%2F1735
and click on the blue '...' button next to the blue 'Run' button. You should see it in the top-right corner of the page. If not, there may be a permissions issue.
 
If you click the '...' button you can customize the branch and the parameters before starting a run. 
1. "Changes > Build branch": select the branch. E.g., `merge-requests/1735`. The name of the branch also works, but it may trigger a recompilation of the software.
1. "Parameters > Case filter": limit the test cases to run. E.g. `e02_f022_c103`
1. "Parameters > configfile": uncheck all but the configfiles that has your test cases.
1. "Parameters > Copy cases": check the `Copy cases` checkbox for saving the output. 
