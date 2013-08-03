#!/usr/bin/perl
use lib qw(lib/);
use Math::BigInt lib => 'FastCalc';
use Euler::Common;
use Euler::Vector2D;
do "lib/eulerlib.pl";

$sum = 0;
open(F, "extras/102_triangles.txt");
while($line = <F>) {
    next if($line !~ /^[-\d,]+$/);
    @t = split(/,/,$line);
    $A = Euler::Vector2D->new($t[0],$t[1]);
    $B = Euler::Vector2D->new($t[2],$t[3]) ;
    $C = Euler::Vector2D->new($t[4],$t[5]) ;    
    $sum += has_origin($A, $B, $C);
    $lines++;
}
close(F);

println($sum . "/" . $lines);

 exit;
 
 sub has_origin {
 
    my ($a, $b, $c) = @_;
    my $O = Euler::Vector2D->new(0,0); 
 
    my $oArea = tri_area($O,$a,$b) + tri_area($O,$b,$c) + tri_area($O,$c,$a); 
    my $tArea = tri_area($a,$b,$c);
    return ($tArea == $oArea) ? 1 : 0;
 }
 
 sub tri_area {
    my ($a, $b, $c) = @_;
    return abs(0.5 * determinant($a->x, $a->y, 1,
                                                $b->x, $b->y, 1,
                                                $c->x, $c->y, 1));
 
 }