#!/usr/bin/perl -w  use Tk;
use Tk;
use strict;

my $mw = MainWindow -> new();

$mw -> Label(-text => 
	"Hello, world! This is going to be the end of the world!"
) -> pack;

$mw -> Label(-text => 
	"Ciao a tutti! Questa is la mia prima interfaccia graphica con il linguaggio perl!"
) -> pack;

$mw -> Frame(
	-height => 100,
	-width => 100,
) -> pack;

$mw -> Button(
	-text     => 'NEW GAME',
	-height => 3,
	-width => 25,
	-command  => sub { exit },
) -> pack;

$mw -> Button(
	-text     => 'Quit',
	-height => 3,
	-width => 3,
	-command  => sub { exit },
) -> pack;

MainLoop();
