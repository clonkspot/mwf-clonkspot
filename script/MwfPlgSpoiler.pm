#------------------------------------------------------------------------------
# mwForum - Web-based discussion forum
# Copyright © 1999-2014 Markus Wichitill
#
# SPOILERS
# Copyright © 2014 Tobias Jaeggi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#------------------------------------------------------------------------------
package MwfPlgSpoiler;
use utf8;
use strict;
use warnings;
no warnings qw(uninitialized redefine);
our $VERSION = "2.29.1";
 
#------------------------------------------------------------------------------
# Spoiler tag
sub spoilers
{
	my %params = @_;
	my $m = $params{m};
	my $board = $params{board};
	my $post = $params{post};
	
	my $text = \$post->{body};
	
	$$text =~ s~\[spoiler\](.+?)\[/spoiler\]~<span class='spoiler'>$1</span>~g;
	
	return 0;
}
 
1;
