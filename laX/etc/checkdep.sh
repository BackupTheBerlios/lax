#!/bin/sh
for DEP in $1; do 
	echo "***** Checking and Installing for $DEP *****"
	cd ../../$DEP || exit 1
	make install || exit 1
	done
