#!/usr/bin/perl

use strict;
use Modern::Perl;
use JSON;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../perl_modules";
use myIsis;

sub convert_to_utf8_json {
    open( my $fh_read_fdt, '>', '../results/repert_array.json' );
    print $fh_read_fdt "[{";
    for ( my $mfn = 1 ; $mfn <= $isis->count ; $mfn++ ) {

        my $rec_hash = $isis->to_hash($mfn);
        my $json_text = to_json( $rec_hash, { utf8 => 1, pretty => 1 } );

        # $json_text =~ s/\n//g;
        $json_text =~ s/\N{U+00c2}\N{U+0091}/'/g;   # Â + PRIVATE USE ONE
        $json_text =~ s/\N{U+00c2}\N{U+00a0}/á/g;  # Â + NBSP
        $json_text =~ s/\N{U+00c2}\N{U+0083}/â/g;  # Â + NO BREAK HERE
        $json_text =~ s/\N{U+00c2}\N{U+0084}/ä/g;  # Â + <control>
        $json_text =~ s/\N{U+00c2}\N{U+00a1}/í/g;  # Â¡
        $json_text =~ s/\N{U+00c2}\N{U+008b}/ï/g;  # Â + PARTIAL LINE FORWARD
        $json_text =~ s/\N{U+00c2}\N{U+008c}/î/g;  # Â + PARTIAL LINE BACKWARD
        $json_text =~ s/\N{U+00c2}\N{U+0082}/é/g;  # Â + BREAK PERMITTED HERE
        $json_text =~ s/\N{U+00c2}\N{U+008a}/è/g;  # Â + LINE TABULATION SET
        $json_text =~
          s/\N{U+00c2}\N{U+0088}/ê/g;    # Â + CHARACTER TABULATION SET
        $json_text =~ s/\N{U+00c2}\N{U+00a2}/ó/g;    # Â¢
        $json_text =~ s/\N{U+00c2}\N{U+0094}/ö/g;    # Â + CANCEL CHARACTER
        $json_text =~ s/\N{U+00c2}\N{U+00a3}/ú/g;    # Â£
        $json_text =~
          s/\N{U+00c2}\N{U+0093}/ő/g;  # 'ô' -> 'ő' | Â + SET TRANSMIT STATE

        $json_text =~ s/\N{U+00c2}\N{U+0081}/ü/g;    # Â + <control>
        $json_text =~ s/\N{U+00c2}\N{U+0096}/ű/g
          ;    # 'û' -> 'ű' | Â + START OF GUARDED AREA

        $json_text =~ s/\N{U+00c2}\N{U+008f}/Á/g;  # Â + SINGLE SHIFT THREE
        $json_text =~ s/\N{U+00c2}\N{U+0090}/É/g;  # Â + DEVICE CONTROL STRING
        $json_text =~
          s/\N{U+00c2}\N{U+008d}/Í/g;    # ?'ì' -> Í Â + REVERSE LINE FEED

        $json_text =~ s/\N{U+00c2}\N{U+0099}/Ö/g;    # Â + <control>
        $json_text =~
          s/\N{U+00c2}\N{U+0095}/Ó/g;    # 'ò' -> 'Ó' Â + MESSAGE WAITING

        $json_text =~ s/\N{U+00c2}\N{U+00a7}/Ő/g;    # Âº
        $json_text =~ s/\N{U+00c2}\N{U+0097}/Ú/g;    # Â + END OF GUARDED AREA
        $json_text =~
          s/\N{U+00c2}\N{U+009a}/Ü/g;    # Â + SINGLE CHARACTER INTRODUCER

        open( my $fh_read_fdt, '>>', '../results/repert_array.json' );
        print $fh_read_fdt "$json_text";
        if ( $mfn <= $isis->count - 1 ) {
            print $fh_read_fdt ",";
        } elsif ( $mfn >= $isis->count - 1 ) {
          print $fh_read_fdt "]";
        }
    }
    close $fh_read_fdt;
    print "done with printing\n";
}

convert_to_utf8_json();
