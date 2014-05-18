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

	print "<link rel='stylesheet' href='$m->{cfg}{dataPath}/clonkspot.css'>\n";
	print "<link rel='stylesheet' href='/css/clonkspot.css'>\n";

	return unless $m->{env}{script} eq "topic_show";
	print "<script type='text/javascript' src='$m->{cfg}{dataPath}/clonkspot.js'></script>\n";
}

sub top {
	my %params = @_;
	my $m = $params{m};

	printFile($headerPaths{$m->{lngModule}}[0]);
}

sub bottom {
	my %params = @_;
	my $m = $params{m};

	printFile($headerPaths{$m->{lngModule}}[1]);
}

sub printFile {
	my $file = shift;

	open my $fh, $file or return;
	while (my $line = <$fh>) {
		print $line;
	}
	close $fh;
}

1;
