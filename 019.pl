#!/usr/bin/perl
use Math::BigInt lib => 'FastCalc';

$sum = 0;

$i = 0;
$day = 1;
$date = 1;
$month = 1;
$year = 1900;

for($i = 0; $year <= 2000;) {
    print dayStr($day) . " " . $date . " " . monthStr($month) . " " . $year . "\n";

    $sum++ if($day == 0 && $date == 1 && $year > 1900);
    
    $i++;
    $endOfMonth = 0;
    
    #calculate day of the week
    $day = (++$day)%7;
    
    #calculate date
    #28 day months
    if($date == 28 && $month == 2 && !isLeapYear($year)) {
        $endOfMonth = 1;
        $date = 1;
    } elsif($date == 29 && $month == 2 && isLeapYear($year)) {
        $endOfMonth = 1;
        $date = 1;
    #30 day months
    } elsif($date == 30 && ($month == 9 || $month == 4 || $month == 6 || $month == 11)) {
        $endOfMonth = 1;
        $date = 1;
    #31 day months
    } elsif($date == 31) {
        $endOfMonth = 1;
        $date = 1;
    } else {
        $date++;
    }
    
    #calculate year
    if($endOfMonth) {
        if($month == 12) {
            $month = 1;
        } else {
            $month++;
        }
    }
    
    #calculate year
    if($date == 1 && $month == 1) {
        $year++;
    }
}

print "$sum\n"; 

exit;

sub isLeapYear {
    my $y = shift; 
    if($y%100==0) {
        return ($y%400==0) ? 1 : 0;
    } elsif($y%4==0) {
        return 1;
    }
    return 0;
}

sub dayStr {
    my $d = shift;
    return "sunday" if($d==0);
    return "monday" if($d==1);
    return "tuesday" if($d==2);
    return "wednesday" if($d==3);
    return "thursday" if($d==4);
    return "friday" if($d==5);
    return "saturday" if($d==6);
}

sub monthStr {
    my $m = shift;
    return "jan" if($m==1);
    return "feb" if($m==2);
    return "mar" if($m==3);
    return "apr" if($m==4);
    return "may" if($m==5);
    return "jun" if($m==6);
    return "jul" if($m==7);
    return "aug" if($m==8);
    return "sep" if($m==9);
    return "oct" if($m==10);
    return "nov" if($m==11);
    return "dec" if($m==12);
}