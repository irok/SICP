use strict;
use warnings;

my %step;
my @denomination = (0, 1, 5, 10, 25, 50);

sub cc_step {
	my ($amount, $kinds_of_coins) = @_;
	if ($amount <= 0 || $kinds_of_coins == 0) {
		return 0;
	}
	my $key = "$amount $kinds_of_coins";
	if (!defined $step{$key}) {
		$step{$key} = cc_step($amount, $kinds_of_coins - 1)
		            + cc_step($amount - $denomination[$kinds_of_coins], $kinds_of_coins)
		            + 2;
	}
	return $step{$key};
}

printf "%3d:%6d (+%3d)\n", $_, cc_step($_,5), cc_step($_,5)-cc_step($_-1||1,5) for 1 .. 100;


