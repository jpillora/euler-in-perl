#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

do "lib/eulerlib.pl";

@result = ();
$#result = 10000;
$result[0] = 0;

for($n = 1; $n < 10000; ++$n) {
    $result[$n] = divisorSum($n);
}

$sum = 0;
for($lhs = 0; $lhs <= $#result; ++$lhs) {

    $rhs = $result[$lhs];
    if(defined($result[$rhs])) {
    
        if($result[$lhs] == $rhs &&  #arr[220] = 284
           $result[$rhs] == $lhs &&  #arr[284] = 220
           $lhs != $rhs) {  
            $sum += $lhs;
            #print $lhs . ": " . $rhs . "\n";
        }
        
    } else {
        #print $rhs . " index not defined\n";
    }
}
print $sum . "\n";
exit;



 