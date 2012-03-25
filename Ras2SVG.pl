#!/bin/sh
for file in *.bmp
do
potrace "$file";
done
for file in *.eps
do
gswin32 -dEPSFitPage -sDEVICE=svg -sOutputFile=$file.svg "$file" quit.ps;
done