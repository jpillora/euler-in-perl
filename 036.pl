#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$sum = 0;

for($i = Math::BigInt->new('1'); $i < 1000000; $i->binc()) {
    $sum += $i if(isPalindrome($i) && 
				  isPalindrome(substr($i->as_bin(), 2)));
}

print $sum . "\n";
 