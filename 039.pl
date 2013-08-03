#!/usr/bin/perl
#projecteuler Q.

use Math::BigInt;

$init_p = 1;
$final_p = 1000;

$max = 0;
$max_p = $init_p;

for($p = $init_p; $p <= $final_p; ++$p) {
    $num_p = 0;
    #get solutions for p
    for($b = 0; $b < $p/2; ++$b) {
        for($a = 0; $a < $b; ++$a) {
            $c  = $p - $b - $a;
            next if($a >= $c || $b >= $c);
            ++$num_p if isPythag($a, $b, $c);
        }
    }
    
    if ($num_p > $max) {
        $max = $num_p;
        $max_p = $p;
    }
    
    print STDERR $p . "/" . $final_p . " \n" if($p%100 == 0);
}

print $max_p . ": " . $max . "\n";

exit 1;

sub isPythag() {
    my ($a, $b, $c) = @_;
    return ($a*$a + $b*$b == $c*$c);
}