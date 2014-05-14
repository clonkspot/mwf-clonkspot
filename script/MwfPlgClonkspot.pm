package MwfPlgClonkspot;
use strict;
use warnings;

our %headerPaths = (
	'MwfGerman' => ['../layout/header-de.html', '../layout/footer-de.html'],
	'MwfEnglish' => ['../layout/header-en.html', '../layout/footer-en.html'],
);

sub htmlHeader {
	my %params = @_;
	my $m = $params{m};

	print "<link rel='stylesheet' href='/css/clonkspot.css'></script>\n";

	return unless $m->{env}{script} eq "topic_show";
	print "<script type='text/javascript' src='$m->{cfg}{dataPath}/clonkspot.js'></script>\n";
}

sub top {
	my %params = @_;
	my $m = $params{m};

	open my $fh, $headerPaths{$m->{lngModule}}[0] or return;
	while (<$fh>) {
		print;
	}
	close $fh;
}

1;
