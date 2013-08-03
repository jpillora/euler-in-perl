#!/usr/bin/perl

$n = 0;
for($i = 1; $n < 10001;$i+=2) {
    $n++ if(isPrime($i));
}

sub isPrime {
    my ($p) = @_;
    for($j = 2; $j < $p/2; ++$j) {
        return 0 if($p%$j==0);
    }
    return 1;
}