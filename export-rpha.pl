#!/usr/bin/perl
use Biblio::Isis;
use JSON;
use Modern::Perl;
use Data::Dumper;
use strict;
use warnings;
use utf8;

my $isis = new Biblio::Isis(
    isisdb          => '../repert/data/',
    read_fdt        => 1,
    include_deleted => 1,
    debug           => 0,
);

sub replace_tag_name {

    my $fdt = '../repert/data/data.fdt';

    # open( my $fh, '<:encoding(utf8)', $fdt )
    open( my $fh, '<:encoding(Latin1)', $fdt )
      or die "Could not open file '$fdt' $!";

    while ( my $row = <$fh> ) {
        chomp $row;

        # Charcode replacements in UTF-8
        # NOTE: possibly do in DOS latin1
        # $row =~ s/\\xA0/á/g;
        # $row =~ s/\\x82/é/g;
        # $row =~ s/\\xA1/í/g;
        # $row =~ s/\\xA2/ó/g;
        # $row =~ s/\\xA3/ú/g;
        # $row =~ s/\\xA7/Ő/g; # º -> Ő
        # $row =~ s/\\x94/ö/g;
        # $row =~ s/\\x93/ő/g; # ô -> ő
        # $row =~ s/\\x96/ű/g; # û -> ű
        # $row =~ s/\\x90/É/g;

        # Charcode replacements in DOS Latin1
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

        # Pair tag names with numbers
        $row =~ s/(.+?)(\s{2,}.*)\s(\d{1,}(?=(\s\d{1,}){3}))(.*)/$1,$3/g;

        print "$row\n";
        close $fh;
    }
}

sub convert_to_utf8_json {

    # TODO: Implement in hash filter
    open( my $fh, '>>', './repert_array.json' );
    print $fh "[";
    for ( my $mfn = 1 ; $mfn <= $isis->count ; $mfn++ ) {

        my $rec_hash = $isis->to_hash($mfn);
        my $json_text = to_json( $rec_hash, { utf8 => 1, pretty => 1 } );

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

        # printf "$json_text";
        # open( my $fh, '>>', './repert_array.json' );
        print $fh "$json_text";
        if ( $mfn <= $isis->count - 1 ) {
            print $fh ",";
        }
    }
    print $fh "]";
    close $fh;
    print "done with printing\n";
}

sub convert_to_utf8_dump {
    for ( my $mfn = 1 ; $mfn <= $isis->count ; $mfn++ ) {
        my $rec_hash = $isis->to_hash($mfn);
        my $rec_dump = Dumper($rec_hash);

        $rec_dump =~ s/\N{U+0091}/'/g;     # PRIVATE USE ONE
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

# replace_tag_name();
# convert_to_utf8_json();
# convert_to_utf8_dump();
