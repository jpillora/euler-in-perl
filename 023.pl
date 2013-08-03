#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$sum = 0;
for($i = 0; $i <= 28123; $i++) {
    $hasDoubleSum = 0;
    $as{$i} = 1 if isAbundant($i);  
    foreach $a (sort(keys %as)) {
        last if $a > $i;
        $hasDoubleSum = 1 if($as{$i-$a});
    }
    $sum += $i if(!$hasDoubleSum);
}
print $sum . "\n";

