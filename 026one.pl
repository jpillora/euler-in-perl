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
    print "[" . $d . "] ";
	# print $y->bstr();
	# print "\n\n";

	$str = $y->bstr();
	
	for($n = 1; $n <1000; ++$n) {
	
		$sub0 = substr($str, 0, $n);
		$sub1 = substr($str, $n, $n);
		
		next if (substr($sub0, 0, 1) eq substr($sub0, 1, 1));
		
		for($o = 0; $sub0 && $sub1 && $sub0 eq $sub1; ++$o) {
			# print $sub0 . " == " . $sub1 . "? \n";
			$sub1 = substr($str, ($o+1)*$n, $n);
		}
		
		
		# print $n . " chars repeat: " . $o . "\n";
		if($o >= 2) {
			if($n > $max) {
				$max = $n; 
				$maxD = $d;
				print "[$n : $o] " . $str . "\n";
			}
			$n = 1000;
		}
	}
}

print $maxD . ": " . $max . "\n";

exit;

