#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$max_d = 1000000;
$str = "";

for($n = 1; length($str) <= $max_d; ++$n) {
    $str .= $n;
}

@d = split(//, $str);

$result = 1;
for($n = 0; 10**$n <= $max_d; ++$n) {
    $result *= $d[10**$n-1];
}

print $result . "\n";
exit 1;
