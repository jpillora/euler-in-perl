#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$fib = Math::BigInt->new('1');
$old = Math::BigInt->new('1');
$temp = Math::BigInt->new(  );
$sum = Math::BigInt->new('0');


$i = 2;
$digits = 0;
while($digits < 1000) {

    $temp = $fib->copy(); #$y = $x->copy();
    $fib->badd($old);
    $old = $temp->copy();  

    $digits = length($fib->bstr());
    
    $i++;
}
print $i . "\n"; 