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
		print "Could you please tell me your name:\n";
		my $playerName = setPlayerName();
		print "Welcome $playerName";
	}else{
		print "This is not a valid option.\n";
	}
}

sub game(){
	# Defining main variables
	my $generalLocation = "The Lost Castle";
	my $location = "room 1";
	my @room1Content = ("one chest");
	my $gold = 0;
	my @playerItems = ();

	# Find a sword, a shield , an armor and 3000 gold
	my @room1ChestContent = ("1 sword\n", "1 shield\n", "1 armor\n", "3000 gold\n");
	print "You are in $location of the $generalLocation!\n";

	# Prompt the user to know if they wanna open the chest
	print "There is $room1Content[0], its content might be dangerous...\n";
	print "do you wish to open it?\n";
	print "1. Yes\n";
	print "2. No\n";
	my $answer = <>;
	if ($answer == 1){
		print "You have chosen to open the chest\n";
		print "You have obtained:\n @room1ChestContent\n";
		$gold += 3000;
		print "Congrats, you now have $gold gold.\n";
	}elsif ($answer == 2){
		print "So you would rather not open it... Not very courageous, eh?\n";
	}else{
		$answer = <>;
		print "I did not expect such an answer. Please retry:\n";
	}
	print "Let us further analyze the contents of the room\n";
	print "What might help us get out of here?\n";
	my @potentialItemsInRoom = ("1) A door\n", "2) A window\n", "3) A ton of gold\n", "4) A key\n");
	foreach my $item (@potentialItemsInRoom){
		print $item;
	}
	$answer = <>;
	if ($answer == 1){
		print "It would indeed be smart to open the door.\n";
		print "The problem is, though, that we do not have the key to unlock it...\n"
	}elsif($answer == 2){
		print "It is too high to risk jumping out the window.\n";
		print "Let us try not to die in the first room of this castle...\n";
	}elsif($answer == 3){
		print "We already have $gold gold...\n What would you want to do with more?\n";
	}elsif($answer == 4){
		print "Yes! There is a key over there, let us use it to open the door!";
	}else{
		print "This is not a valid option mate.\n"
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
