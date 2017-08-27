#!/bin/perl -i

use strict;
use warnings;

local $/ = undef;
my $filename = $ARGV[0];
open INFILE, $filename or die $!;
my $s = <INFILE>;

close INFILE;

$s =~ s/\@\w+\([^\(\)]+\)//smg;

$s =~ s/\@\w+\r\n//g;

$s =~ s/javax\.xml\.datatype\.XMLGregorianCalendar/java\.util\.Date/g;

$s =~ s/import javax.*;\r\n//g;

$s =~ s/XMLGregorianCalendar/Date/g;

open(FILE, ">$filename.new.java") || die "File not found";

print FILE $s;

close(FILE);