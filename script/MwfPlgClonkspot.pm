package MwfPlgClonkspot;
use strict;
use warnings;

sub htmlHeader {
	my %params = @_;
	my $m = $params{m};
	return unless $m->{env}{script} eq "topic_show";
	print "<script type='text/javascript' src='$m->{cfg}{dataPath}/clonkspot.js'></script>\n";
}

1;
