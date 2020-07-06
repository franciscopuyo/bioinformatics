use Bio::SeqIO;
use Bio::Factory::EMBOSS;

# Get parameters
my ($filename) = @ARGV;

my $input_file_name = $filename;
my $fasta_file_name = "FGRFR3.fasta";
my $sixpack_file_name = "FGRFR3.sixpack";
my $motifs_file_name = "FGRFR3.patmatmotifs";


my $emboss = Bio::Factory::EMBOSS->new();

my $seqio_obj = Bio::SeqIO->new(-file => $input_file_name,
                             -format => "genbank" );

my $seq_obj = $seqio_obj->next_seq;
my $fastaio = Bio::SeqIO->new(-file => ">$fasta_file_name",
                             -format => 'fasta' );
$fastaio->write_seq($seq_obj);

print "Getting sixpack tool";
my $sixpack = $emboss->program('sixpack') || die "Program not found!\n";
print "Running sixpack and writing to $sixpack_file_name";
$sixpack->run({-sequence => $fasta_file_name,
             -outfile   => $sixpack_file_name});

print "Getting patmatmotifs tool";
my $patmatmotifs = $emboss->program('patmatmotifs') || die "Program not found!\n";

print "Running patmatmotifs and writing to $motifs_file_name";
$patmatmotifs->run({-sequence => $seq_obj,
              	    -full => 1,
                    -outfile => $motifs_file_name});


