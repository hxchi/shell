#!/bin/bash

objpath="/home/hxc/Desktop/data/2014/effpar"
effindir="effin"
effinfile="ener.cal"

cd ..
cd ${effindir}
						
for file in `ls $effin`
	do
		if [ -d ../$effindir/$file ]; then
			echo $file | grep -q "-"
			if [ $? -eq 0 ]; then
				start=${file%%-*}
				end=${file##*-}
				while [ $start -le $end ]
					do
						cd ./$file
						cp $effinfile $objpath/"r"$start
						start=$((start+1))
						cd ..
					done
			else
				cd ./$file
				cp $effinfile $objpath/"r"$file
				cd ..
			fi
		fi
done