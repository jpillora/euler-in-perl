#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$sum = 0;
for($i = 1; $i < 2000000;$i++) {
    $sum+= $i if(isPrime($i));
}
print $sum,"\n";

sub isPrime {
    my ($p) = @_;
    return 1 if($p == 2);
    
    #is composite test
    for($a = 2; $a < 3; $a++) {
        $x = Math::BigInt->new($a);
        $x->bmodpow($p, $p);
        $x->bsub($a);
        if(!$x->is_zero()) { # n != 0 ? composite.
            return 0;
        }  
    }

    #is prime test
    for($j = 3; $j < sqrt($p)+1; $j+=2) {
        return 0 if($p%$j==0);
    }
    return 1;
}