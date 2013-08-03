#!/usr/bin/perl

do "lib/eulerlib.pl";

$i = 0;
open(F, "extras/067.triangle");
while($line = <F>) {
    my @nums = (split(/\s/, $line));
    
    for($j = 0; $j <= $#nums; ++$j) {
        if($i == 0) {
            $tri[$i][$j] = $nums[$j];
        } elsif($j == 0) {
            $tri[$i][$j] = $nums[$j] + $tri[$i-1][$j];
        } elsif($j == $#nums) {
            $tri[$i][$j] = $nums[$j] + $tri[$i-1][$j-1];
        } else {
            my $maxParent = ($tri[$i-1][$j] > $tri[$i-1][$j-1])
                            ? $tri[$i-1][$j]
                            : $tri[$i-1][$j-1];
        
            $tri[$i][$j] = $nums[$j] + $maxParent;
        }
    }
    $i++;
}

$maxSum = 0;
for ($i=0; $i <= $#tri; $i++) {
    $maxSum = max($maxSum,$tri[$#tri][$i]);
}
print $maxSum . "\n";
