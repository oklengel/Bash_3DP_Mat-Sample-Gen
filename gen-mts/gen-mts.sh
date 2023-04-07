#!/bin/bash

# assign command line arguments to variables
Mlabel=$1
Clabel=$2
manufacturer=$3

# generate STL file
openscad -o sample_${Mlabel}_${Clabel}_${manufacturer}.stl -D Mlabel=\"$Mlabel\" -D Clabel=\"$Clabel\" -D manufactuer=\"$manufacturer\" sample.scad