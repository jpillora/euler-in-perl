#!/usr/bin/perl

$result = 0;
$n = 20;
while(!$result) {
    $subResult = 1;
    for($i = 1; $i <= 20; ++$i) {
        if($n%$i!=0) {
            $subResult = 0;
            break;
        }
    }
    $result = $n if($subResult);
    $n += 20;
    
    print $n,"\n" if($n%1000000==0);
}
print $result,"\n"
