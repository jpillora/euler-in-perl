#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$offset = ord('A') - 1;

open(F, "extras/022names.txt");
$namesStr = <F>;
close(F);

$namesStr =~ s/"//g;
@names = split(/,/, $namesStr);
@names = sort(@names);
$sum = 0;
for($i = 0; $i <= $#names; ++$i) {

    $l_sum = 0;
    @ns = split(//, $names[$i]);
    foreach $n (@ns) {
        $l_sum += ord($n) - $offset;
    }
    
    $l_sum *= ($i + 1);
    $sum += $l_sum;
    
    print $i . ": " . $names[$i] . " -> " . $l_sum . "\n";
}
print $sum . "\n";

