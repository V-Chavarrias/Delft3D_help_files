#In the command prompt, add the path to shared libraries. 
#If you include it in a sh file, than you have to run that file through 'source file.sh' or '. file.sh', but not through './file.sh', otherwise it starts a new shell with a new environment to run the file.
export LD_LIBRARY_PATH=./install_fm-suite_debug/lib

#Point to the librarie to be tested
gdb --args ./build_fm-suite_debug/tests_unit_delwaq/test_waq_external_access_layer/test_connection_manager 

#run 
run 

#q for quit

#
#LOAD COREDUMP
#

#You need a program with debug symbols
gdb /p/dflowfm/users/chavarri/sc_branch_p_02/build_d3d4-suite_RelWithDebInfo/install/bin/d_hydro core.d_hydro.1782
#see stack 
backtrace 
#
#run
#

gdb /p/dflowfm/users/chavarri/sc_branch_p_02/build_d3d4-suite_RelWithDebInfo/install/bin/d_hydro
break /p/dflowfm/users/chavarri/sc_branch_p_02/src/utils_gpl/morphology/packages/morphology_data/src/dredge_data_module.f90:320
run