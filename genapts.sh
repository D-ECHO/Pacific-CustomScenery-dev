#!/bin/sh
build_airport() {
	echo $1;
	case $1 in
		PKRO)	slope=0.025;
			perimeter=0.5;;
		*)	slope=0.025;
			perimeter=5.0;;
	esac
	genapts850 --threads --input=data/airports/`echo $1 | cut -c 1-2`/$1.dat --work=./work --dem-path=SRTM-1 --max-slope=$slope --perimeter=$perimeter
}

if [ -z "$1" ]
then
	echo "Complete, hard rebuilt: Removing old work files";
	rm -r work/AirportArea work/AirportObj;
	for i in data/airports/*
	do 
		for k in $i/*.dat
		do
			build_airport `echo $k | cut -c 18-21`;
		done
	done
else
	if [ "$2" = "hard" ]
	then
		echo "Hard rebuilt: Removing old work files";
		rm -r work/AirportArea work/AirportObj;
	fi
	build_airport $1;
fi
