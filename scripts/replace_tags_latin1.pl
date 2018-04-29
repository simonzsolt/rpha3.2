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

    open( my $fh_read_fdt, '<:encoding(Latin1)', $fdt )
      or die "Could not open file '$fdt' $!";

    open( my $fh_to_json, '>', '../results/tag_names_latin1.json' );
    print $fh_to_json "{";

    while ( my $row = <$fh_read_fdt> ) {
        chomp $row;

        $row =~ s/\N{U+00A0}/á/g;
        $row =~ s/\N{U+0082}/é/g;
        $row =~ s/\N{U+00A1}/í/g;
        $row =~ s/\N{U+00A2}/ó/g;
        $row =~ s/\N{U+00A3}/ú/g;
        $row =~ s/\N{U+00A7}/Ő/g;    # º -> Ő
        $row =~ s/\N{U+0094}/ö/g;
        $row =~ s/\N{U+0093}/ő/g;    # ô -> ő
        $row =~ s/\N{U+0096}/ű/g;    # û -> ű
        $row =~ s/\N{U+0090}/É/g;

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

    close $fh_read_fdt;
    close $fh_to_json;
}

replace_tag_name();
