#!/bin/sh

# fpath_out='p:\computations\run_batch.sh';
# fname_r='run_dimr_c7.sh';
# 
# fid=fopen(fpath_out,'w');
# fprintf(fid,'#!/bin/sh \n');
# for k=5:8
#     fprintf(fid,'cd r%03d \n',k); 
#     fprintf(fid,'dos2unix %s \n',fname_r); 
#     fprintf(fid,'./%s \n',fname_r); 
#     fprintf(fid,'cd .. \n'); 
# end

cd r_009 
./run_d3d4.sh 
cd ..

cd r_010 
./run_d3d4.sh 
cd ..

cd r_011 
./run_d3d4.sh 
cd ..

cd r_012 
./run_d3d4.sh 
cd ..
