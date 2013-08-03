#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
use List::Uniq ':all';
do "lib/eulerlib.pl";

$sum = 0;
$power = 5;
$size = $ARGV[0];
@n = ();
for($i = 2; $i <= $size; $i++) {

	$s = 0;
	foreach $n (split(//,$i)) {
		next if($s > $i);
		$s += $n**$power;
	}
	
	if($s == $i) {
		print $i . "\n";
		$sum += $s;
	}
}

print "===\n" . $sum . "\n";
