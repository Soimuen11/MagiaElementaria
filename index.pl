#!/usr/bin/perl
use strict;
use warnings;
# Make UTF-8 default encoding
use open qw( :encoding(UTF-8) :std );
use Switch;
require './game.pl';
require './gameOver.pl';
require './startMenu.pl';

### Main function ###
sub main(){
	startMenu();
	game();
}

### Function Calls ###
main();
