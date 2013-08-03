#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$solution = 0;

    $n_pent = 165;
    $n_hexa = 143;
for($n_tri  = 285 + 1; !$solution; ++$n_tri) {

    $t = tri($n_tri);

    $p = pent($n_pent);
    $h = hexa($n_hexa);

    ++$n_pent if($p < $t);
    ++$n_hexa if($h < $t);

    $solution = $t if($t == $p && $t == $h);
}

print $solution . "\n";

exit 1;


sub tri {
    return @_[0] * (    @_[0] + 1) / 2;
}
sub pent {
    return @_[0] * (3 * @_[0] - 1) / 2;
}
sub hexa {
    return @_[0] * (2 * @_[0]- 1);
}