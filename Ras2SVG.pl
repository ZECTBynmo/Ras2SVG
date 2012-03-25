#!/bin/perl
use File::Basename;

my @bmpFiles = glob("*.bmp");

print( "\nConverting all .bmp files into .eps intermediate files\n" );
for my $file (@bmpFiles) {
	system("potrace.exe", $file);
}

my @epsFiles = glob("*.eps");

print( "\nConverting all .eps files into .svg and deleting intermediates\n" );
for my $file (@epsFiles) {
	my ($filename) = substr($file, 0, rindex($file, '.'));
	system( "gswin32.exe -dEPSFitPage -sDEVICE=svg -sOutputFile=$filename.svg '$file' quit.ps" );
	unlink($file);
}

print( "\nJob Complete!\n" );
