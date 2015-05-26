#------------------------------------------------------------------------------
# mwForum - Web-based discussion forum
# Copyright © 1999-2014 Markus Wichitill
#
# Sketchfab Embedding
# Copyright © 2015 Lukas Werling
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
package MwfPlgSketchfab;
use utf8;
use strict;
use warnings;
no warnings qw(uninitialized redefine);
 
#------------------------------------------------------------------------------
# Sketchfab tag
sub sketchfab
{
	my %params = @_;
	my $post = $params{post};
	
	my $text = \$post->{body};
	
	$$text =~ s~\[sketchfab\](\w+?)\[/sketchfab\]~<iframe width="640" height="480" src="https://sketchfab.com/models/$1/embed" frameborder="0" allowfullscreen onmousewheel=""></iframe>~g;
	
	return 0;
}
 
1;
