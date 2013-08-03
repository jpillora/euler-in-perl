#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$sum = Math::BigInt->new('0');

for($i = 1;$i <= 1000;$i++) {

    $x = Math::BigInt->new($i);
    $x->bpow($i);
    $sum->badd($x);
}
print substr($sum->bstr(), length($sum->bstr())-10, 10) . "\n"; 