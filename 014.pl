#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

#$n = <STDIN>;
#chomp($n);


@maxSeq = ();
$maxSteps = 0;
for($i = 1; $i < 1000000; $i++) {
    @curSeq = ();
    $n = $i;
    $steps = 0;
    
    push(@curSeq, $n);
    while($n != 1) {
        if($n%2==0) {
            $n = $n/2;
        } else {
            $n = $n*3 + 1;
        }
        push(@curSeq, $n);
        $steps++;
    }
    @maxSeq = @curSeq if($steps > $maxSteps);
    $maxSteps = $steps if($steps > $maxSteps);
    #print "($i): $steps \n[@curSeq]\n";
}

print "\n\n starting number: $maxSeq[0]   maxSteps: $maxSteps\n";
