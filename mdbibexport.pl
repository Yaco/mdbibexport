#!/usr/bin/perl
#Simple script to extract references from a bibtex database which are cited in a markdown file
#The installation of BibTool, Pandoc and Perl is required. Non-interactive version.
#Version: 0.21
#Release: 2016/10/31
#Copyright: Dr. Robert Winkler
#Contributor: Albert Krewinkel, Franco Augusto
#Contact: robert.winkler@bioprocess.org, robert.winkler@cinvestav.mx
#License: General Public License (GPL), 3.0

use strict;
use warnings;

if($ARGV[0] && $ARGV[1]){

    my $namemd = $ARGV[0];
    chomp($namemd);
    
    my $namebib = $ARGV[1];
    chomp($namebib);

    #mdbibexport files
    my $nameaux = "mdbibexport.aux";
    my $nameout = "$ARGV[0].bib";


    open my $fm, '<', $namemd or die "Could not open '$namemd' $!\n";

    my $mdcitations = "";

    my $pdcmd = 'pandoc -t json '. $namemd . ' > mdbibexport.tmp';
    system($pdcmd);
    my $pandoctmp = "mdbibexport.tmp";
    open my $fm2, '<', $pandoctmp or die "Could not open '$pandoctmp' $!\n";

    while (my $line = <$fm2>) {
    chomp $line;
    while ($line =~ /"citationId":"([^"]*)"/g){
    print "Extracted citation: $1\n";
    $mdcitations .= "$1,";
        }
    }

    open(my $fa, '>', $nameaux) or die;
    print $fa "\\bibstyle{alpha}\n";
    print $fa "\\bibdata{$namebib}\n";
    print $fa "\\citation{$mdcitations}\n";
    close $fa;
    print "$nameaux created.\n";

    my $btcmd = 'bibtool -v -x '. $nameaux . ' -o ' . $nameout;
    system($btcmd);
    print "$nameout created.\n";

    unlink "mdbibexport.tmp";
    unlink "mdbibexport.aux";
}else{
    print "Missing arguments: mdbibexport <path to .md> <path to .bib>\n";

}

