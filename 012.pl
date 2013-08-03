#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$n = 0;
$i = 1;
$divs = 1;

while($divs < 500) {

    $n += $i;
    $i++;
    
    next if($n%10!=0);
    
    @ds = ();
    $divs = 1;
    $getDivs = 1;
    for($j = 1; $getDivs && $j < $n; ++$j) {
        
        if($j > 100 && $divs < 15) {
            $getDivs = 0;
        } elsif($n%$j==0) {
            $divs++;
            push(@ds, $j);
        } elsif($j < 7) {
            $getDivs = 0;
        }
    }
    
    print "[",$i-1,"] ",$n, ": ", $divs, "          [", join(",",@ds),"]\n\n" if ($divs > 50);
}

 