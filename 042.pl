#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$solution = 0;
@tri_nums = (1);

open(F, "extras/Q42_words.txt");
$wordsStr = <F>;
$wordsStr =~ s/"//g;
close(F);

@words = split(/,/,$wordsStr);

foreach $word (@words) {
    my $charSum = 0;
    my @chars = split(//,$word);
    
    foreach $char (@chars) {
        $charSum += ord($char)-64;
    }
    
    #print "$word - $charSum - ";
    
    if(isTri($charSum)) {
        #qprint("$charSum - @tri_nums\n");
        $solution++; 
    } else {
        #print("NO\n");
    }
}

print $solution . "\n";

exit 1;

sub isTri {
    my $n = shift(@_);
    while($n > $tri_nums[$#tri_nums]) {
        my $newTri = tri($#tri_nums+2);
        push(@tri_nums, $newTri);
    }
    return binsearch($n);
}

sub tri {
    return @_[0] * (@_[0] + 1) / 2;
}

sub linsearch {
    my $n = shift(@_);
    for(my $i = $#tri_nums; $i >= 0; --$i) {
        return 1 if ($tri_nums[$i] == $n);
    }
    return 0;
}

sub binsearch {
    my $n = shift(@_);
    my $hi = $#tri_nums;
    my $lo = 0;
    my $lastmid = -1;
    while(1) {
    
        my $mid = int(($hi+$lo)/2);
        #print "$n - checking $lo:" . ($mid-$lastmid) . ":$hi: " . $tri_nums[$mid] . "\n";
        $mid = $hi if ($hi-$lo == 1);
        last if($mid - $lastmid == 0);
        $lastmid = $mid;
        if($n == $tri_nums[$mid]) {
            return 1;
        } elsif($n > $tri_nums[$mid]) {
            $lo = $mid;
        } else {
            $hi = $mid;
        }
    }
    return 0;
}