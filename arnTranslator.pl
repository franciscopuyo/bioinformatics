#!/usr/bin/perl

# ARN translator
# Parameters
#   $filename: Genbank file name
#   $from: frame start
#   $to: frame end

# Output
#   .fasta file with the encoded protein in a .fasta file

use Bio::Perl;
use Bio::Seq;
use Bio::SeqIO;
use Bio::Tools::CodonTable;

# Get parameters
my ($filename, $from, $to) = @ARGV;

$arnCodeFile = Bio::SeqIO->new(-file => $filename, -format => "GenBank" );
$outputProteinFile = Bio::SeqIO->new(-file => '>translation.fasta', -format => 'fasta' );
$input = $arnCodeFile->next_seq;

#from: 276 to: 2696 from FGRFR3.gb for ORF9
$orf = $input->subseq($from, $to);
$trad = Bio::Seq->new(-seq => $orf)->translate();
$outputProteinFile->write_seq($trad);

