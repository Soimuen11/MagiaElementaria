#!/usr/bin/perl
use strict;
use warnings;
# Make UTF-8 default encoding
use open qw( :encoding(UTF-8) :std );
use Switch;

### Defining Main Game Menu ###
sub startMenu(){
	print "####################################################\n";
	print "########## Welcome To The Lost Castle!##############\n";
	print "####################################################\n";
	# When a player enters the game, they can either create a new game or load
	# a save file
	my @options = ("1) Load Game\n", "2) New Game\n");
	foreach my $option (@options){
		print $option;
	}
	my $userChoice = <>;
	switch($userChoice){
		# Option Load Game
		case 1 {
			my $saveFile = "./save.txt";
			print "Travel safe, experienced adventured!\n";
			# if save file exists, print its content and save it in variable
			# playerName
			if (-e $saveFile){
				my $playerName = `cat $saveFile`;
				print "Player name: $playerName";
			}
		}
		# Option New Game
		case 2 {
			print "A new adventure always sounds exciting, uh?\n";
			print "Could you please tell me your name:\n";
			my $playerName = setPlayerName();
			print "Welcome $playerName";
		}
		# When player enters invalid input (letters, characters, numbers that
		# aren't 1 or 2
		else { 
			print "This is not a valid option\n"; 
		}
	}
}

### Get player name and save it into a file ###
sub setPlayerName(){
	open (FH, ">", "save.txt");
	my $playerName = <>;
	print FH $playerName;
	close(FH);
	return $playerName;
}

### Return true ###
1;
