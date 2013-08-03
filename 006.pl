#!/usr/bin/perl

$sumSq = 0;
$sqSum = 0;
for($i = 1; $i <= 100; ++$i) {
    $sumSq += ($i*$i);
}
for($i = 1; $i <= 100; ++$i) {
    $sqSum += $i;
}
$sqSum *= $sqSum;
print $sqSum - $sumSq,"\n"
