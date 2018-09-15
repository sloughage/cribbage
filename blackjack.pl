#!/usr/bin/env perl
use v5.10.0;
use warnings;
use strict;

sub shuffle {
    my $n = scalar @_;
    while (--$n) {
        my $i = int rand($n+1);
        @_[$n,$i] = @_[$i,$n];}}

sub new {
    my @deck = ();
    for my $r (qw(A 2 3 4 5 6 7 8 9 10 J Q K)) {
        push @deck, map {$r . $_} qw(♠︎ ♣︎ ♥︎ ♦︎);}
    @deck = (@deck) x $_[0];
    shuffle @deck;
    return @deck;}

system "clear";
say "Decks?";

my $deckcount = <STDIN>;
chomp $deckcount;
my @deck = new $deckcount;







say scalar @deck;
