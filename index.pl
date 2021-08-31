#!/usr/bin/perl
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std ); # Make UTF-8 default encoding

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
	}else{
		print "This is not a valid option.\n";
	}
}

sub game(){
	print "Hello World! Could you please tell me your name:";
	my $playerName = setPlayerName();
	my $generalLocation = "Castle Of Hell";
	my $location = "room 1";
	my @room1Content = ("one chest");
	my $gold = 0;
	my @playerItems = ();

	# Find a sword, a shield , an armor and 3000 gold
	my @room1ChestContent = ("1 sword\n", "1 shield\n", "1 armor", "3000 gold\n");
	print "Welcome $playerName! You are in $location of the $generalLocation!\n";

	# Prompt the user to know if they wanna open the chest
	print "There is $room1Content[0], do you wish to open it?\n";
	print "1. Yes\n";
	print "2. No\n";
	my $answer = <>;
	if ($answer == 1){
		print "You have chosen to open the chest\n";
		print "You have obtained:\n @room1ChestContent\n";
		$gold += 3000;
		print "Congrats, you now have $gold gold.\n"
	}elsif ($answer == 2){
		print "So you would rather not open it... Not very courageous, eh?\n";
		print "The game is over for you.";
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
