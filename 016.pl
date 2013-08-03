#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$num = Math::BigInt->new("2");
$num->bpow(1000);
$numStr = $num->bstr();
@nums = split(//, $numStr);
 
 $result = 0;
 foreach $n (@nums) {
    $result += $n;
 }
 
 print $result,"\n";