#!/bin/bash
DIR="/p/06_simulations/02_runs"
cd /p/06_simulations/02_runs
if [ #? -ne 0 ]; then
	echo "Sorry, directory ${DIR} is not found; run aborted"
else
	for SUB in r644 r651 r622 r656
	do
		if [ ! -d ${SUB} ]; then
			echo "Sorry, directory ${SUB} is not found; run aborted"
		else
			cd ${SUB}
			if [ ! -f run.sh ]; then
				echo "job file \"run.sh\" not found in directory ${SUB}!"
			else
				dos2unix run.sh
				./run.sh       
			fi
			cd ..
		fi
	done
fi
