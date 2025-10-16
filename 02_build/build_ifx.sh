source ./src/setenv.sh
cmake -S ./src/cmake -B build_all_debug -D CONFIGURATION_TYPE:STRING=all -D CMAKE_INSTALL_PREFIX=./install_all_debug/ -D CMAKE_BUILD_TYPE=Debug -T fortran=ifx
cmake --build build_all_debug --config Debug
cmake --install build_all_debug --config Debug