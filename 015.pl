#!/usr/bin/perl
use Math::BigInt;
#40 different turns
$x = Math::BigInt->new('40');
$x->bfac();
#20 are down - 20 are right
$y = Math::BigInt->new('20');
$y->bfac();

print $x / ($y*$y);
print "\n";

exit 1;
