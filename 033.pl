#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$numSum = 1;
$denSum = 1;

for($num = 10; $num < 100; $num++) {
    for($den = 10; $den < 100; $den++) {
        next if($num >= $den);
        @ns = split(//,$num);
        @ds = split(//,$den);
        #has one duplicate number - one different number on the diagonals and
        #the remaining numbers == the initial numbers ( and denom != 0)
        if(($ds[0] != 0 && $ns[0] == $ds[1] && $ns[1] != $ds[0] &&
            $num/$den == $ns[1]/$ds[0]) ||
            ($ds[1] != 0 && $ns[1] == $ds[0] && $ns[0] != $ds[1] &&
                   $num/$den == $ns[0]/$ds[1])) {
            print "$num / $den = " . $num/$den ."\n";
            $numSum *= $num;
            $denSum *= $den;
        }
    
    }
}

print "$numSum / $denSum = " . 
    $numSum/gcd($numSum,$denSum) . " / " . 
    $denSum/gcd($numSum,$denSum)  ."\n";
 