# Copyright © 2016, Lukas Werling
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
package MwfPlgEventClonkspot;
use utf8;
use strict;
use warnings;
no warnings qw(uninitialized redefine);
our $VERSION = "2.27.0";

#------------------------------------------------------------------------------
# Hide a specific board for newly registered users

sub userRegisterHideBoard
{
	my %params = @_;
	my $m = $params{m};
	my $level = $params{level};
	my $entity = $params{entity};
	my $action = $params{action};
	my $userId = $params{userId};

	if ($level == 1 && $entity eq 'user' && $action eq 'register') {
		# Board "Wettbewerbseinsendungen"
		$m->dbDo("
			INSERT INTO boardHiddenFlags (userId, boardId) VALUES (?, ?)", $userId, 29);
	}
}
