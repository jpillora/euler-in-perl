#!/usr/bin/perl
do "lib/eulerlib.pl";
$max = 0;
for($i = 1; $i < 1000; ++$i) {
    for($j = 1; $j < 1000; ++$j) {
        $n = $i*$j;
		$max = $n if($n > $max && isPalindrome($n));
    }
}
print $max, "\n";

