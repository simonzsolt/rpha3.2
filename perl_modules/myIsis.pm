package myIsis;

use Biblio::Isis;
use strict;
use warnings;

BEGIN {
    require Exporter;
    our $VERSION = 1.00;
    our @ISA     = qw(Exporter);
    our @EXPORT  = qw($isis);
}

our $isis = new Biblio::Isis(
    isisdb          => '../repert/data/',
    read_fdt        => 1,
    include_deleted => 1,
    debug           => 0,
);

END { }
1;
