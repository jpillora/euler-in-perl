#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$sum = 0;
@cs = (0);

for($a = 100; $a < 9999; $a++) {
    for($b = 1; $b < 99; $b++) {
        $c = $a*$b;
        next if($cs[$c] || length($a) + length($b) + length($c) != 9);
        
        if(isPandigital("$a$b$c")) {
            $sum += $c;
            $cs[$c] = 1;
            print("$a * $b = $c\n");
        }
    }
}

print $sum . "\n";
 