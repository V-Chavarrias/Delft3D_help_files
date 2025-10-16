set dfm_dir=c:\checkouts\delft3d_fm_trunk\

if not exist unstruc.ini   copy "%dfm_dir%\src\engines_gpl\dflowfm\res\unstruc.ini"   .
if not exist isocolour.hls copy "%dfm_dir%\src\engines_gpl\dflowfm\res\isocolour.hls" .
if not exist interact.ini  copy "%dfm_dir%\src\engines_gpl\dflowfm\res\interact.ini"  .
SET OMP_NUM_THREADS=3

REM Kill rundll32.exe, which is almost always the blocking process
taskkill /F /IM rundll32.exe /T

SET PATH=%PATH%;%dfm_dir%\install_dflowfm_interacter\lib\

%dfm_dir%\install_dflowfm_interacter\bin\dflowfm-cli.exe RIJN.mdu %1 %2 %3 %4 

REM with opengl there is sometimes problems (e.g., plotting text of cross-sections). You can disable it.
rem %dfm_dir%\install_dflowfm_interacter\bin\dflowfm-cli.exe RIJN.mdu %1 %2 %3 %4 --display:opengl=0

del unstruc.ini
del isocolour.hls
del interact.ini
del unstru*.dia
