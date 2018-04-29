#!/usr/bin/perl

use Modern::Perl;
use Data::Dumper;
use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../perl_modules";
use myIsis;

sub convert_to_utf8_dump {
    for ( my $mfn = 1 ; $mfn <= $isis->count ; $mfn++ ) {
        my $rec_hash = $isis->to_hash($mfn);
        my $rec_dump = Dumper($rec_hash);

        $rec_dump =~ s/\N{U+0091}/'/g;    # PRIVATE USE ONE
        $rec_dump =~ s/\N{U+00a0}/á/g;    # NBSP
        $rec_dump =~ s/\N{U+0083}/â/g;    # NO BREAK HERE
        $rec_dump =~ s/\N{U+0084}/ä/g;    # <control>
        $rec_dump =~ s/\N{U+00a1}/í/g;    # Â¡
        $rec_dump =~ s/\N{U+008b}/ï/g;    # PARTIAL LINE FORWARD
        $rec_dump =~ s/\N{U+008c}/î/g;    # PARTIAL LINE BACKWARD
        $rec_dump =~ s/\N{U+0082}/é/g;    # BREAK PERMITTED HERE
        $rec_dump =~ s/\N{U+008a}/è/g;    # LINE TABULATION SET
        $rec_dump =~ s/\N{U+0088}/ê/g;    # CHARACTER TABULATION SET
        $rec_dump =~ s/\N{U+00a2}/ó/g;    # Â¢
        $rec_dump =~ s/\N{U+0094}/ö/g;    # CANCEL CHARACTER
        $rec_dump =~ s/\N{U+00a3}/ú/g;    # Â£
        $rec_dump =~ s/\N{U+0093}/ő/g;    # 'ô' -> 'ő', SET TRANSMIT STATE
        $rec_dump =~ s/\N{U+0081}/ü/g;    # <control>
        $rec_dump =~ s/\N{U+0096}/ű/g;    # 'û' -> 'ű', START OF GUARDED AREA
        $rec_dump =~ s/\N{U+008f}/Á/g;    # SINGLE SHIFT THREE
        $rec_dump =~ s/\N{U+0090}/É/g;    # DEVICE CONTROL STRING
        $rec_dump =~ s/\N{U+008d}/Í/g;    # ?'ì' -> Í, REVERSE LINE FEED
        $rec_dump =~ s/\N{U+0099}/Ö/g;    # <control>
        $rec_dump =~ s/\N{U+0095}/Ó/g;    # 'ò' -> 'Ó', MESSAGE WAITING
        $rec_dump =~ s/\N{U+00a7}/Ő/g;    # Âº
        $rec_dump =~ s/\N{U+0097}/Ú/g;    # END OF GUARDED AREA
        $rec_dump =~ s/\N{U+009a}/Ü/g;    # SINGLE CHARACTER INTRODUCER

        printf $rec_dump;
    }
}

convert_to_utf8_dump();
