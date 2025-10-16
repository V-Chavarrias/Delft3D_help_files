rem fpath_out='p:\01_cases\run_all.bat';
rem fname_r='run_dimr.bat';
rem 
rem fid=fopen(fpath_out,'w');
rem for k=1:5
rem     fprintf(fid,'cd r%03d \n',k); 
rem     fprintf(fid,'start "wv" %s \n',fname_r); 
rem     fprintf(fid,'cd ../ \n'); 
rem end
rem fclose(fid);

cd mr1_041
start "w1" run_dimr_21201_p_nf.bat
cd ../

cd mr1_042
start "w1" run_dimr_21201_p_nf.bat
cd ../

cd mr1_043
start "w1" run_dimr_21201_p_nf.bat
cd ../

cd mr1_044
start "w1" run_dimr_21201_p_nf.bat
cd ../