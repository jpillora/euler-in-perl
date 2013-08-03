#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';
do "lib/eulerlib.pl";

$max = 0;
$maxD = 0;

$x = Math::BigInt->new('10');
$x->bpow(10000);

for($d = 1; $d < 1000; $d++) {
    
    $y = $x->copy();
    $y->bdiv($d);
	$str = $y->bstr();
	
    print "[1/" . $d . "] ";
	print substr($str, 0, 100);
	print "\n";

	@cs = ();
	for($c = 2; $c < 2000; ++$c) {
		
		$s1 = substr($str,  0, $c);
		$s2 = substr($str, $c, $c);
		
		if($s1 eq $s2) {
		
			my $divs = 0;
			for($ci = 0; $ci <= $#cs; ++$ci) {
				$divs = 1 if($c%$cs[$ci]==0);
			}
			push(@cs, $c) if(!$divs);
		}
	}
	
	if($cs[0] > $max) {
		$max = $cs[0]; 
		$maxD = $d;
	}
	
	printArr(@cs);
	
}

print $maxD . ": " . $max . "\n";

exit;

