
#
#Set environment
#

#source ./src/setenv.sh intel24
source ./src/setenv.sh intel23
#source ./src/setenv.sh intel24LLVM

#
#Cmake
#

#FM debug
cmake -S ./src/cmake -B build_fm-suite_debug -D CONFIGURATION_TYPE:STRING=fm-suite -D CMAKE_INSTALL_PREFIX=./install_fm-suite_debug/ -D CMAKE_BUILD_TYPE=Debug -T fortran=ifort
cmake --build build_fm-suite_debug --config Debug
cmake --install build_fm-suite_debug --config Debug

#D3D4 Release
cmake ./src/cmake -B build_d3d4-suite_RelWithDebInfo -D CONFIGURATION_TYPE:STRING=d3d4-suite -D CMAKE_INSTALL_PREFIX=./install_d3d4-suite_RelWithDebInfo/ -D CMAKE_BUILD_TYPE=RelWithDebInfo -G "Unix Makefiles" -T fortran=ifort    
cmake --build build_d3d4-suite_RelWithDebInfo --config RelWithDebInfo
cmake --install build_d3d4-suite_RelWithDebInfo --config RelWithDebInfo

#D3D4 Release with debug info
cmake ./src/cmake -B build_d3d4-suite_RelWithDebInfo -D CONFIGURATION_TYPE:STRING=d3d4-suite -D CMAKE_INSTALL_PREFIX=./install_d3d4-suite_RelWithDebInfo/ -D CMAKE_BUILD_TYPE=RelWithDebInfo -G "Unix Makefiles" -T fortran=ifort    
cmake --build build_d3d4-suite_RelWithDebInfo --config RelWithDebInfo
cmake --install build_d3d4-suite_RelWithDebInfo --config RelWithDebInfo

#D3D4 Debug
cmake ./src/cmake -B build_d3d4-suite_Debug -D CONFIGURATION_TYPE:STRING=d3d4-suite -D CMAKE_INSTALL_PREFIX=./install_d3d4-suite_Debug/ -D CMAKE_BUILD_TYPE=Debug -G "Unix Makefiles" -T fortran=ifort  
cmake --build build_d3d4-suite_Debug --config Debug
cmake --install build_d3d4-suite_Debug --config Debug
