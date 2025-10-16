import bmi.wrapper as bmi
import os

current_directory = os.getcwd()

# Path to the DFlow-FM model executable
#model_executable = os.path.join(current_directory, '../', '../', 'fm-suite', 'lib' ,'dflowfm.dll')
model_executable = r'c:\Program Files\Deltares\Delft3D FM Suite 2025.01 1D2D\plugins\DeltaShell.Dimr\kernels\x64\lib\dflowfm.dll' #Path to installed version
#model_executable = r'c:\checkouts\sc_fm_trunk\install_fm-suite\lib\dflowfm.dll' #Path to installed version

# Initialize the BMI model
model = bmi.BMIWrapper(model_executable)

# Set up the model
path_model = os.path.join(current_directory, 'model', 'FlowFM.mdu')
model.initialize(path_model)

# Debug: print variable names and types
# get_var_count = model.get_var_count()
# print('Number of variables:', get_var_count)
# for i in range(get_var_count):
#     var_name = model.get_var_name(i)
#     var_type = model.get_var_type(i)
#     print('Variable name:', var_name)       
#     print('Variable type:', var_type)       

# Loop through the model time steps
for i in range(28800):

    # Run the model for a single time step (`DtUser`)
    model.update()

    # Get the current time
    current_time = model.get_current_time()
    print('Current time:', current_time)

    # Get the value of the water level
    s1 = model.get_var('s1') 
    s0 = model.get_var('s0') 
    vol1 = model.get_var('vol1')
    vol0 = model.get_var('vol0')
    # wu = model.get_var('wu')
    # xu = model.get_var('xu')

    # Set the value 
    if current_time >400000:
        s0[2] = 1.6
        s1[2] = 1.6
        vol1[2] = 854
        vol0[2] = 854
        
        # Update the variable in the model
        model.set_var('s1', s1)  
        model.set_var('s0', s0)
        model.set_var('vol1', vol1)
        model.set_var('vol0', vol0)

# Finalize the model
model.finalize()
