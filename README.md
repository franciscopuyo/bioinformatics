# FGRFR3 RNA Translator 

## Get started 
Install Perl and the cpanm and the following dependencies
```
cpan Bio::DB::GenBank
cpan Bio::Perl
cpan Bio::Tools::CodonTable
cpan Bio::Tools::Run::RemoteBlast
```

Install EMBOSS
http://emboss.open-bio.org/html/use/ch02s07.html
```
cpan Bio::Factory::EMBOSS
```

Setup prosite DB
```
sudo prosextract
```

## Scripts

ARN translator
Creates a translation.fasta with the encoded protein
```
perl arnTranslator.pl [filename.gb] [start] [stop]
```

Blast analyser
Creates a *.out with the query name if exists or .out if it doesn't with the blast analysis using blast proteins DB
```
perl blast.pl [filename.fasta]
```

Blast filter
Filters the blast input file results
```
perl blastFlter.pl [filename.blast] [sequence filter]
```

Emboss anlysis
Analyses a genbank file using patmatmotifs and sixpack 
```
perl embossAnalysis.pl [filename.gb]
```

## Troubleshooting

#### Error
```
--------------------- WARNING ---------------------
MSG: req was POST https://blast.ncbi.nlm.nih.gov/Blast.cgi
User-Agent: bioperl-Bio_Tools_Run_RemoteBlast/1.7.7
Content-Length: 1035
Content-Type: application/x-www-form-urlencoded

FILTER=L&FORMAT_OBJECT=Alignment&FORMAT_TYPE=Text&SERVICE=plain&COMPOSITION_BASED_STATISTICS=off&QUERY=%3E+%0D%0AMGAPACALALCVAVAIVAGASSESLGTEQRVVGRAAEVPGPEPGQQEQLVFGSGDAVELSCPPPGGGPMGPTVWVKDGTGLVPSERVLVGPQRLQVLNASHEDSGAYSCRQRLTQRVLCHFSVRVTDAPSSGDDEDGEDEAEDTGVDTGAPYWTRPERMDKKLLAVPAANTVRFRCPAAGNPTPSISWLKNGREFRGEHRIGGIKLRHQQWSLVMESVVPSDRGNYTCVVENKFGSIRQTYTLDVLERSPHRPILQAGLPANQTAVLGSDVEFHCKVYSDAQPHIQWLKHVEVNGSKVGPDGTPYVTVLKTAGANTTDKELEVLSLHNVTFEDAGEYTCLAGNSIGFSHHSAWLVVLPAEEELVEADEAGSVYAGILSYGVGFFLFILVVAAVTLCRLRSPPKKGLGSPTVHKISRFPLKRQVSLESNASMSSNTPLVRIARLSSGEGPTLANVSELELPADPKWELSRARLTLGKPLGEGCFGQVVMAEAIGIDKDRAAKPVTVAVKMLKDDATDKDLSDLVSEMEMMKMIGKHKNIINLLGACTQGGPLYVLVEYAAKGNLREFLRARRPPGLDYSFDTCKPPEEQLTFKDLVSCAYQVARGMEYLASQKCIHRDLAARNVLVTEDNVMKIADFGLARDVHNLDYYKKTTNGRLPVKWMAPEALFDRVYTHQSDVWSFGVLLWEIFTLGGSPYPGIPVEELFKLLKEGHRMDKPANCTHDLYMIMRECWHAAPSQRPTFKQLVEDLDRVLTVTSTDEYLDLSAPFEQYSPGGQDTPSSSSSGDDSVFAHDLLPPAPPSSGGSRT*&ALIGNMENT_VIEW=Pairwise&ALIGNMENTS=50&CMD=Put&DATABASE=refseq_protein&PROGRAM=blastp&EXPECT=1e-10&DESCRIPTIONS=100

<html>
<head><title>An Error Occurred</title></head>
<body>
<h1>An Error Occurred</h1>
<p>500 Can't verify SSL peers without knowing which Certificate Authorities to trust</p>
</body>
</html>
```
#### Fix
```
cpan Mozilla::CA
```