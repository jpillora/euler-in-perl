#!/usr/bin/perl
for($c = 0; $c<=1000; ++$c) {
    for($b = 0; $b<$c; ++$b) {
        for($a = 0; $a<$b; ++$a) {
            next if($a >= $b || $b >= $c || $a + $b + $c != 1000 || $a*$a + $b*$b != $c*$c);
            print $a*$b*$c," \n";
        }
    }
}


