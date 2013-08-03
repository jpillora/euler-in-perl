#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';


$n = Math::BigInt->new("100");
$n->bfac();

@ns = split(//,$n->bstr());

$sum = 0;
foreach $nn (@ns) {
    $sum += $nn;
}

print $sum . "\n";

 