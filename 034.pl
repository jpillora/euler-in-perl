#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$sum = 0;

for($n = 10;  $n < 50000; $n++) {

    @ns = split(//,$n);
    $nsum = 0;
    for $nn (@ns) {
        next if($nsum > $n);
        $nsum += fac($nn);
    }
    
    if($nsum ==$n) {
        $sum += $n;
    }
}
println($sum);