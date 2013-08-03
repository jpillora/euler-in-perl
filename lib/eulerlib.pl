#common project euler functions
use Math::BigInt lib => 'FastCalc';
use POSIX;

sub fac {
    return Math::BigInt->new(@_[0])->bfac();
}
sub gcd {
    my ($a, $b) = @_;
    while($b > 0) {
        ($a, $b) = ($b, $a%$b);
    }
    return $a;
}

sub lcm {
    my ($a, $b) = @_;
    return abs($a*$b)/gcd($a,$b);
}

sub divisorSum {
    my ($n) = @_;
    my $sum = 0;
    for($j = 1; $j < ceil($n/2)+1; ++$j) {
        if($n%$j==0) {
            $sum += $j;
        }
    }
    return $sum;
}

sub divisors {
    my ($n) = @_;
    @ds = ();
    for($j = 1; $j < $n; ++$j) {
        if($n%$j==0) {
            push(@ds, $j);
        }
    }
    return @ds;
}

sub isPalindrome {
    my $n = shift; 
    my $len = length($n);
    my $odd = (($len+1)%2==0) ? 1 : 0;
    my $one = substr($n, 0, ($len-$odd)/2);
    my $two = substr($n, ($len+$odd)/2, ($len-$odd)/2);
    $two = reverse($two);
    return ($one eq $two) ? 1 : 0;
}

sub isPandigital {
    my $num = shift;
    @ns = split(//,$num);
    @has = (0);
    $l = $#ns+1;
    foreach $n (@ns) {
        return 0 if($n == 0 ||$n > $l || $has[$n] == 1);
        $has[$n] = 1;
    }
    return 1;
}

sub isPrime {
    my $n = shift; 
    if ($n == 0 || $n==1) {
        return 0;
    } elsif ($n < 4) {
        return 1;  #2 and 3 are prime
    } elsif ($n%2==0) {
        return 0;
    } elsif ($n < 9) {
        return 1;    #we have already excluded 4,6 and 8.
    } elsif ($n%3 == 0) {
        return 0;
    } else {
        $r = floor(sqrt($n));  # $n  rounded to the greatest integer $r so that $r*r<=n
        $f = 5;
       while ($f <= $r) {
            return 0 if($n%$f==0);
            return 0 if($n%($f+2)==0);
            $f+=6;
        }
    }
    return 1;
}

sub println {
    print shift(@_) . "\n";
}

sub printArr {
    my ($ref) = @_;
    print "[" . join(",",(ref($ref) eq "ARRAY" ? @$ref : @_)) . "]\n";
}

sub max {
    my ($a,$b) = @_;
    return $a if $a > $b;
    return $b;
}

sub isAbundant {
    my $n = shift;
    return (divisorSum($n) > $n) ? 1 : 0;
}

sub determinant {

my ($a, $b, $c,
       $d, $e, $f,
       $g, $h, $i) = @_;

       return $a*($e*$i - $f*$h) - $b*($d*$i - $f*$g) + $c*($d*$h - $e*$g)

}
