use Bio::Search::Result::BlastResult;
use Bio::SearchIO;
use Term::ANSIColor;

# Get parameters
my ($filename, $pattern) = @ARGV;

my $report = Bio::SearchIO->new( -file => $filename, -format => blast);
my $result = $report->next_result;

# Trims the input
chomp($pattern);

$matched = 0;

while (my $hit = $result->next_hit) {
	my $description = $hit->description;
	my $length = $hit->length;
	my $expect = $hit -> significance();
	my $bits = $hit -> bits;  
	if (index($description, $pattern) != -1) {
       print color('bold green');
       print "$description\n\n";
       print color('reset');
       print "Expect = $expect, Score = $bits bits (". $hit->score . "), Length = $length \n\n";
       while( my $hsp = $hit->next_hsp ) {
          print $hsp -> hit_string . "\n";
       }
       print "\n\n\n";
       $matched = 1;
	}
	
}
if (!$matched) {
    print "No results found\n"
}