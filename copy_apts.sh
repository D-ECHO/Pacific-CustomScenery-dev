#!/bin/sh
rm -r output/NavData/apt
mkdir output/NavData/apt
for i in data/airports/*; do
	for k in $i/*.dat; do
		cp $k output/NavData/apt/
	done
done
