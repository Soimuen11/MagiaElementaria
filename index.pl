#!/usr/bin/perl
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std ); # Make UTF-8 default encoding
require './game.pl';
require './gameOver.pl';

### Main function ###
sub main(){
	startMenu();
	game();
}

### Defining main game menu ###
sub startMenu(){
	print "Welcome to the fantasy world of Magia Elementaria!\n";
	my @options = ("1) Load Game\n", "2) New Game\n");
	foreach my $option (@options){
		print $option;
	}
	my $userChoice = <>;
	if ($userChoice == 1){
		print "Travel safe, experienced adventured!\n";
		my $files = `ls -l | grep save`;
		print $files;
	}elsif ($userChoice == 2){
		print "A new adventure always sounds exciting.\n";
		print "Could you please tell me your name:\n";
		my $playerName = setPlayerName();
		print "Welcome $playerName";
	}else{
		print "This is not a valid option.\n";
	}
}

### Get player name and save it into a file ###
sub setPlayerName(){
	open (FH, ">", "save.txt");
	my $playerName = <>;
	print FH $playerName;
	close(FH) or "Couldn't close the file";
	return $playerName;
}

### Function Calls ###
main();
