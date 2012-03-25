#!/bin/perl
use File::Basename;

## Grab all .bmp files
my @bmpFiles = glob("*.bmp");

print( "\nConverting all .bmp files into .eps intermediate files\n" );
for my $file (@bmpFiles) {
	## Trace the outline of the important regions using potrace
	system("potrace.exe", $file);
}

## Grab all .eps files (presumably we just generated all of these)
my @epsFiles = glob("*.eps");

print( "\nConverting all .eps files into .svg and deleting intermediates\n" );
for my $file (@epsFiles) {
	## Grab the base filename of the file we're trying to convert
	my ($filename) = substr($file, 0, rindex($file, '.'));
	
	## Convert the file to SVG
	system( "gswin32.exe -dEPSFitPage -sDEVICE=svg -sOutputFile=$filename.svg '$file' quit.ps" );
	
	## Delete the file (note this will delete every .eps in the folder)
	unlink($file);
}

print( "\nJob Complete!\n" );
