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
