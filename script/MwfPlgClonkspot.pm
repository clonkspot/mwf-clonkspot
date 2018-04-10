# Copyright © 2014-2016, Lukas Werling
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

	return unless $m->{env}{script} =~ /^(topic_show|forum_overview)$/;
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
