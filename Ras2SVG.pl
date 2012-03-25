#!/bin/perl
use File::Basename;

my @bmpFiles = glob("*.bmp");

for my $file (@bmpFiles) {
	system("potrace.exe", $file);
}

my @epsFiles = glob("*.eps");

for my $file (@epsFiles) {
	my ($filename) = substr($file, 0, rindex($file, '.'));
	system( "gswin32.exe -dEPSFitPage -sDEVICE=svg -sOutputFile=$filename.svg '$file' quit.ps" );
}
