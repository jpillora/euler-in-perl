#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$spirals = $ARGV[0];
$sum = Math::BigInt->new('1');
for($i = 3; $i <= $spirals;$i+=2) {
    $x = Math::BigInt->new($i);
    $x->bpow(2);
    $x->bmul(4);
    $x->bsub(($i-1)*6);
    
    $sum->badd($x);
}
print $sum->bstr() . "\n"; 