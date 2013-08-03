#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";
$sum = 0;
$primes = 0;
for($i = 0; $i < 1000000; ++$i) {
    if(isPrime($i)) {
		#print "[" . $i . "] p:" . $primes;
		if(length($i) == 1) {
			$primes++;
		} else {
			$isP = 1;
			@ps = split(//,$i);
			for($j = 1; $j < length($i); ++$j) { 
				push(@ps, shift(@ps));
				$isP = 0 if(!isPrime(join("",@ps)));
				#print " [" . join("",@ps) . "] ";
			}
			$primes++ if($isP);
		}
		#print "\n";
	}
}
print $primes . "\n";
 