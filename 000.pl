#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$sum = 0;
$sum2 = 0;
for($i = 0; $i < 4; $i++) {
   
    $sum += fac($i);
    $sum2 += fac2($i);
}

 println($sum);
 println($sum2);