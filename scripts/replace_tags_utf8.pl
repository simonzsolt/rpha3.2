#!/usr/bin/perl

use Modern::Perl;
use Data::Dumper;
use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../perl_modules";
use myIsis;

sub replace_tag_name {

    my $fdt = '../repert/data/data.fdt';

    open( my $fh, '<:encoding(utf8)', $fdt )
      or die "Could not open file '$fdt' $!";

    open( my $fh_to_json, '>', '../results/tag_names_utf8.json' );
    print $fh_to_json "{";

    while ( my $row = <$fh> ) {
        chomp $row;

        $row =~ s/\\xA0/á/g;
        $row =~ s/\\x82/é/g;
        $row =~ s/\\xA1/í/g;
        $row =~ s/\\xA2/ó/g;
        $row =~ s/\\xA3/ú/g;
        $row =~ s/\\xA7/Ő/g; # º -> Ő
        $row =~ s/\\x94/ö/g;
        $row =~ s/\\x93/ő/g; # ô -> ő
        $row =~ s/\\x96/ű/g; # û -> ű
        $row =~ s/\\x90/É/g;

        # Remove unecessary lines
        $row =~ s/.*:.*|^\*.*|\*\w{1,}//g;

        # Skip empty lines
        $row =~ /^$/ and next;

        # Pair tag names with numbers in json
        $row =~ s/(.+?)(\s{2,}.*)\s(\d{1,}(?=(\s\d{1,}){3}))(.*)/"$3":"$1"/g;

        if ( !eof ) {
            print $fh_to_json "$row,";
        }
        elsif (eof) {

            # this is added because to_hash creates a '000' key by default
            print $fh_to_json '"000": "$MFN",';
            print $fh_to_json "$row}";
        }

    }    # while

    close $fh;
    close $fh_to_json;
}

replace_tag_name();
