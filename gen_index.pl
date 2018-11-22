#!/usr/bin/env perl

use warnings;
use strict;

my $result="<HTML><HEAD><TITLE>Coverage report</TITLE><style>
table, th, td {
    border: 1px solid black;
}
</style></HEAD><BODY><TABLE>\n";

while (<STDIN>) {
  print;
  if (/(\d+\.\d+%) \| Total/) {
    $result .= "<TR><TD>Total:</TD><TD>$1</TD></TR>\n";
  }
  elsif (/(\d+\.\d+%) \| (\S+)/) {
    $result .= "<TR><TD><A HREF=\"Elixir.$2.html\">$2</A></TD><TD>$1</TD></TR>\n";
  }
}

$result .= "</TABLE></BODY</HTML>\n";

open(my $f, ">", "cover/index.html") or die $!;
print $f $result;
close($f);

