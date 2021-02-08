 #!/usr/bin/perl -w  
 use Tk;
 use strict;

 # Creating new window object
 my $mw = MainWindow->new;

 # Text element for testing purposes
 $mw->Label(-text => 'Hello, world!')->pack;

 # Quit button
 $mw->Button(
 	-text    => 'Quit',
 	-command => sub { exit },
 )->pack;

 # Main loop always at the end
 MainLoop;
