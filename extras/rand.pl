#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "../lib/eulerlib.pl";

$h = 0;
$t = 0;
srand time;
for($i = 0; $i < 1000000; $i++) {
   
   
   if(rand > 0.5) {
       $h++;
   } else {
       $t++;
   }
    
}

println("H: $h   T: $t    H/T: " . $h/$t);