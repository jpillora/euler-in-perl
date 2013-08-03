#!/usr/bin/perl

# WOLFRAM !!!

my $p = 600851475143;
my $pLimit = $p/2;

for($i = 1; $i < $pLimit; $i+=2) {
    if($p%$i == 0 && $i != 1) {
        print $i,"\n";
    }
}



sub p_factor() {
    $p = shift(@_);
    for($i = 1; $i < sqrt($p); $i+=2) {
        if($p%$i == 0 && $i != 1) {
            print $i,"\n";
            return $i;
        }
    }
}