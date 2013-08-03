#!/usr/bin/perl

$fib = 1;
$old = 1;
$temp = 0;
$sum = 0;

while($fib < 4000000) {

    $temp = $fib;
    $fib += $old;
    $old = $temp;
    
    $sum += $fib if $fib%2==0;
    
}
print $sum,"\n";
