#!/usr/bin/perl
use strict;
use warnings;

sub main(){
	print "Hello World! Could you please tell me your name:";
	my $playerName = getPlayerName();
	my $generalLocation = "Castle Of Hell";
	my $location = "room 1";
	my @room1Content = ("one chest");

	# Find a sword, a shield and 3000 gold
	my @room1ChestContent = ("1 sword\n", "1 shield\n", "3000 gold\n");
	print "Welcome $playerName! You are in $location of the $generalLocation!\n";
	# Prompt the user to know if they wanna open the chest
	print "There is $room1Content[0], do you wish to open it?\n";
	print "1. Yes\n";
	print "2. No\n";
	my $answer = <>;
	if ($answer == 1){
		print "You have chosen to open the chest\n";
		print "You have obtained:\n @room1ChestContent\n";
	}elsif ($answer == 2){
		print "So you would rather not open it... Not very courageous, eh?\n";
		print "The game is over for you.";
	}
}

# Get player name and save it into a file
sub getPlayerName(){
	open (FH, ">", "save.txt");
	my $playerName = <>;
	print FH $playerName;
	close(FH) or "Couldn't close the file"; 
	return $playerName;
}

main();
