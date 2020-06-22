After having figured out my bins. 
# blastx

## create a blast local db 
`makeblastdb -in /Users/euphrasieservant/Documents/internship_ecl/proteins_db2/BSSA/BSSA_db.fasta  -title "BSSA_blast_db" -dbtype prot`

## get gene calls
I export gene calls from my contigs.db. Open reading frames were identify using Prodigal while creating the contigs.db in anvio.

`anvi-get-sequences-for-gene-calls -c /Users/euphrasieservant/Documents/internship_ecl/EMW/asmw2/contigs.db   -o mygenes --report-extended-deflines`

## blastx 
The “blastx” application translates a nucleotide query in six frames and searches it against a protein database.

`blastx -query mygenes  -db bssa/BSSA_db.fasta -outfmt 6 -out blastx_bssa`

## select significant hits
Import blastx_bssa.csv into R, and select hits with the best bitscore (over 200), and a lenght close to the BSSA (around 800)

### bitscore 
the bit-score is a normalized score that lets you estimate the magnitude of the search space you would have to look through before you would expect to find a score as good as or better than this one by chance. The higher the better. 

### e-value 
It provides information about the likelihood that a given sequence match is purely by chance. 

```
len = nrow(blastx_bssa_01)
for (i in 1:len) 
  if (blastx_bssa_01[i,12]>200 && blastx_bssa_01[i,4]>750) {print (blastx_bssa_01[i,])}
  
```

## BSSA results:

```
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|Q5P6…   29.5    806      502      20     64  2358     69   849 1.06e-97      314
# A tibble: 1 x 12
  qseqid             sseqid  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>              <chr>    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_00… sp|O87…   29.9    802      504      23     64  2358     69   849 2.26e-96      311
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|A0A1…   29.5    801      509      22     64  2358     69   849 1.11e-95      309
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|A0A0…   29.5    807      507      23     55  2358     67   850 6.47e-95      306
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|A0A0…   29.9    812      497      22     55  2358     67   850 4.21e-93      302
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|K0NC…   28.5    806      510      20     64  2358     70   850 8.04e-91      296
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|R4KC…   28.3    805      521      20     55  2358     67   852 1.29e-90      295
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|A0A5…   28.6    809      512      21     55  2358     67   850 1.96e-88      289
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|B9M0…   29.0    806      512      21     55  2358     67   850 3.65e-88      288
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|I6LH…   28.9    802      512      23     64  2358     72   852 4.98e-87      285
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|B9M0…   28.7    833      520      24     10  2358     42   850 1.06e-85      281
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_0… tr|Q39V…   27.6    841      519      22     10  2358     42   850 2.20e-82      273
# A tibble: 1 x 12
  qseqid             sseqid  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>              <chr>    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_00… sp|O87…   30.3    801      496      21     64  2349     70   847 3.10e-75      253
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|Q5P6…   29.4    802      502      20     64  2349     70   847 7.04e-74      249
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|A0A1…   30.0    801      499      21     64  2349     70   847 9.95e-74      248
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|R4KC…   30.0    833      511      25      1  2349     40   850 1.66e-72      245
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|A0A0…   28.8    806      502      23     64  2349     71   848 4.95e-72      244
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|K0NC…   28.7    804      505      21     64  2349     71   848 2.08e-71      242
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|I6LH…   29.2    835      511      27      4  2349     43   850 1.85e-69      236
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|A0A5…   27.8    824      537      20      4  2349     41   848 1.92e-69      236
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|B9M0…   27.8    836      524      23      4  2352     41   849 1.38e-67      231
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|B9M0…   28.0    832      525      21      4  2349     41   848 2.48e-66      228
# A tibble: 1 x 12
  qseqid            sseqid   pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>             <chr>     <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_0… tr|Q39V…   27.7    838      522      23      4  2352     41   849 1.03e-64      223
```
There is only 2 different genes meeting these requirements in mycontigs.db, that are in contigs:

- c_000000014013
- c_000000011944

### Find where the hits come from 
`anvi-export-collection -p SAMPLES-MERGED/PROFILE.db -C collection1 -O mybins2 --include-unbinned` allows to download all the contigs ID and their bins (if they are binned). 

ctrl+F {contig ID} into mybins2 

- c\_000000014013 : bin\_41_6, Geobacter
- c\_000000011944 : contigs\_Bin_43 (which is an unrefined bin)

## PED 





