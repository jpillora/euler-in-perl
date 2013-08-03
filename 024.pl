#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
use List::Uniq ':all';
do "lib/eulerlib.pl";

$size = $ARGV[0];
@n = ();
@m = ();

for($i = 0; $i <= $size; $i++) {
    push(@n, $i);
}

use List::Permutor;
my $perm = new List::Permutor @n;
while ($#m < 1000000 && ($p = join("",$perm->next))) {
    push(@m, "$p");
}

print "size: " . $#m . " elem.1mil:" . $m[999999] . "\n";
