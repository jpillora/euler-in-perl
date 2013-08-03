#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$result = 0;
$maxProd = 0;
$maxPrimes = 0;
for($a = -1000; $a < 1000; $a++) {
    for($b = 999; $b > -999; $b-=2) {
       
        $conPrimes = consecPrimes($a, $b);
        #print "=" . $conPrimes . ":" .$maxPrimes . "\n";
        if($conPrimes > $maxPrimes) {
        
            $maxPrimes = $conPrimes;
            $result = $a*$b;
        }
    }
    #print "[$a]=" . $conPrimes . ":" .$maxPrimes . "\n" ;
}
print $result . "\n";

sub consecPrimes {

    my ($a, $b) = @_;
    
    #print "[$a:$b]\n";
    return 0 if(!isPrime($b));
    $p = 2;
    for($n = 1; isPrime($p); ++$n) {
        $p = $n*$n + $a*$n + $b;
        $p *= -1 if($p < 0);
        #print "$n:$p\n";
    }
    return $n;
}