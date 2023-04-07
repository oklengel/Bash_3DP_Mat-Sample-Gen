#!/bin/bash

# assign command line arguments to variables
Tlabel=$1
Clabel=$2
Mlabel=$3

pwd=$(pwd)
echo $pwd


if [[ "$OSTYPE" == "darwin"* ]]; then
  OPENSCAD_PATH="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
else
  OPENSCAD_PATH="openscad"
fi
#echo  openscad: $OPENSCAD_PATH

echo $Mlabel 
# generate STL file

cp sample.scad ${pwd}/${Tlabel}_${Clabel}_${Mlabel}_sample.scad

#$ sed -i "" "s|${search}|${replace}|g" config.php
 sed -i "" "s|TlabelV|${Tlabel}|g" ${Tlabel}_${Clabel}_${Mlabel}_sample.scad
 sed -i "" "s|ClabelV|${Clabel}|g" ${Tlabel}_${Clabel}_${Mlabel}_sample.scad
 sed -i "" "s|MlabelV|${Mlabel}|g" ${Tlabel}_${Clabel}_${Mlabel}_sample.scad


 eval $OPENSCAD_PATH -o ${Tlabel}_${Clabel}_${Mlabel}_sample.stl  ${Tlabel}_${Clabel}_${Mlabel}_sample.scad

