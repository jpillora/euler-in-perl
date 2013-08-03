#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$sum = 0;

for($i = 0; $i <= 1000; ++$i) {
   
    $nStr = intLetters($i);
    $nStr =~ s/ //g;
    
    #print "[",$i,"] " . $nStr . "[" . length($nStr) . "]\n";
    $sum += length($nStr);
}

print $sum . "\n";

exit;

 sub intLetters {
    my ($n) = @_;

    $thousands = thousands(int(($n%10000)/1000));
    $hundreds = hundreds(int(($n%1000)/100));
    $tens = tens(int(($n%100)/10), int($n%10));
    $ones = ones(int($n%10));
    $ones = "" if(int(($n%100)/10) == 1);
    
    return $thousands . " " .  $hundreds .  ((($thousands || $hundreds) && ($tens || $ones))?" and ":" ") .  $tens .  " " .  $ones;
 }
 
 sub thousands {
    my ($n) = @_;
    
    if($n == 0) {
        return "";
    } elsif($n >= 1) {
        return ones($n) . " thousand";
    }
 }
 
 sub hundreds {
    my ($n) = @_;
    
    if($n == 0) {
        return "";
    } elsif($n >= 1) {
        return ones($n) . " hundred";
    }
 }
 
 sub tens {
    my ($n, $m) = @_;
    
    if($n == 0) {
        return "";
    } elsif($n == 1) {
        if($m == 0) {
            return "ten";
        } elsif($m == 1) {
            return "eleven";
        } elsif($m == 2) {
            return "twelve";
        } elsif($m == 3) {
            return "thirteen";
        } elsif($m == 5) {
            return "fifteen";
        } elsif($m == 8) {
            return "eighteen";
        } else {
            return ones($m) . "teen";
        }
    } elsif($n == 2) {
        return "twenty";
    } elsif($n == 3) {
        return "thirty";
    } elsif($n == 4) {
        return "forty";
    } elsif($n == 5) {
        return "fifty";
    } elsif($n == 6) {
        return "sixty";
    } elsif($n == 7) {
        return "seventy";
    } elsif($n == 8) {
        return "eighty";
    } elsif($n == 9) {
        return "ninety";
    } else {
        return "";
    }
 }
 
 sub ones {
    my ($n) = @_;
    
    if($n == 0) {
        return "";
    } elsif($n == 1) {
        return "one";
    } elsif($n == 2) {
        return "two";
    } elsif($n == 3) {
        return "three";
    } elsif($n == 4) {
        return "four";
    } elsif($n == 5) {
        return "five";
    } elsif($n == 6) {
        return "six";
    } elsif($n == 7) {
        return "seven";
    } elsif($n == 8) {
        return "eight";
    } elsif($n == 9) {
        return "nine";
    } else {
        return "";
    }
 }