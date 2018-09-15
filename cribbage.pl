#!/usr/bin/env perl
use v5.10.0;
use warnings;
use strict;

# build deck
my @deck = ();
for my $r (qw(A 2 3 4 5 6 7 8 9 T J Q K)) {
    push @deck, map {$r . $_} qw(♠︎ ♣︎ ♥︎ ♦︎);}

sub shuffle {
    my $n = 52;
    while (--$n) {
        my $i = int rand($n+1);
        @deck[$n,$i] = @deck[$i,$n];}}

# sub hsort {
#     my $a = $_;
#     my $len = scalar $_;
#     for my $i (0 .. $len) {
#         for my $j ($i+1 .. $len) {
#             $a[$j] < $a[$i] and @a[$i, $j] = @a[$j, $i];}}}
#
# sub selection_sort {
#     my @a = @_;
#     foreach my $i (0 .. $#a - 1) {
#         my $min = $i + 1;
#         $a[$_] < $a[$min] and $min = $_ foreach $min .. $#a;
#         $a[$i] > $a[$min] and @a[$i, $min] = @a[$min, $i];}
#     return @a;}

# ⬆︎⇧↑

sub count {
    my ($x,@a) = ($_[0],@_[1..scalar @_ - 1]);
    my $c = 0;
    for (@a) {
        if ($_ eq $x) {
            $c++;}}
    return $c;}

say count "⬆︎", ("a", "b", "c", "⬆︎", "⬆︎");

# while (1) {
    shuffle;
    my @hand1 = @deck[0 .. 5];
    my @hand2 = @deck[6 .. 11];
    my @cut = $deck[12];
    my @pointers = (1 .. 6);
    while (1) {
        system "clear";
        say "@hand1";
        say map {$_ . "  "} @pointers;
        if (2 == count "⬆︎", @pointers) {
            select(undef, undef, undef, 0.5);
            last;
        } else {
            my $n = <STDIN>;
            chomp $n;
            if (@pointers[$n-1] eq "⬆︎") {@pointers[$n-1] = $n;}
            else {@pointers[$n-1] = "⬆︎";}
        }
    }

say "done";

# }




# system "clear";
# say "Decks?";
#
# my $deckcount = <STDIN>;
# chomp $deckcount;
# my @deck = new $deckcount;







# say @deck;
