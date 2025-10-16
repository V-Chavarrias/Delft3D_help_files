in <src\cmake\compiler_options\intel.cmake>, change:
```
set(openmp_flag                           /Qopenmp)   
```
to
```
set(openmp_flag                           /Qopenmp-stubs)   
```