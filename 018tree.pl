#!/usr/bin/perl

use Tree::Binary;
my $tree;
my $cur;

$maxSum = 0;
$sumTreeCalls = 0;

open(F, "extras/018.triangle");

while($line = <F>) {
    @nums = split(/\s/, $line);
    my $level = $#nums;
    
    if($level == 0) {
        $tree = Tree::Binary->new($nums[0]);
    } else {
    
        $cur = $tree;
        for(my $i = 0; $i < $#nums-1; ++$i) {
            $cur = $cur->left();
        }
    
        for(my $i = 0; $i <= $#nums; ++$i) {        
            if($i == 0) {
                $cur->left(Tree::Binary->new($nums[$i]));
            } elsif ($i == $#nums) {
                $cur->right(Tree::Binary->new($nums[$i]));
            } else {
                $node = Tree::Binary->new($nums[$i]);
                $cur->right($node);
                $cur = $cur->parent()->right();
                $cur->left($node);
            }
        }
    }
}

close(F);
print "tree size: " . $tree->size() . "\n";

sumTree($tree);
print "max sum: " . $maxSum . "\n";

sub sumTree {
    $sumTreeCalls++;
    
    print $sumTreeCalls . "\n" if($sumTreeCalls%10000 == 0);
    
    my ($node, $sum) = @_;
    
    if(!$node) {
        print $sum . "\n";
        $maxSum = $sum if $sum > $maxSum;
        return;
    }
    my $val = $node->value();
    sumTree($node->left(), $sum + $val);
    sumTree($node->right(), $sum + $val);
}

sub visit {
    my ($node) = @_;
    return if(!$node);
    print $node->value() . "[" . $node->depth() . "]\n";
    visit($node->left());
    visit($node->right());
}

sub simpleMaxPath {
    my ($node) = @_;
    $cur = $node;
    
    print $cur->value();
    $sum = $cur->value();
    while(!$cur->is_leaf()) {
        if($cur->left()->value() > $cur->right()->value()) {
            $cur = $cur->left();
        } else {
            $cur = $cur->right();
        }
        print "->" . $cur->value();
        $sum += $cur->value();
    }
    print " = " . $sum;
    
}