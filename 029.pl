#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
use List::Uniq ':all';
do "lib/eulerlib.pl";

$size = $ARGV[0];
@n = ();
for($i = 2; $i <= $size; $i++) {
	push(@n, $i);
}



for($i = 0; $i <= $#n; $i++) {
	for($j = 0; $j <= $#n; $j++) {
		$x = Math::BigInt->new($n[$i]);
		$x->bpow($n[$j]);
		push(@result, $x->bstr());
	}
}

foreach $r (@result) {
	print $r . "\n";
}