After having figured out my bins. 
# blastx

## create a blast local db 
`makeblastdb -in /Users/euphrasieservant/Documents/internship_ecl/proteins_db2/BSSA/BSSA_db.fasta  -title "BSSA_blast_db" -dbtype prot`

## get gene calls
I export gene calls from my contigs.db. Open reading frames were identified using Prodigal while creating the contigs.db in anvio.

`anvi-get-sequences-for-gene-calls -c /Users/euphrasieservant/Documents/internship_ecl/EMW/asmw2/contigs.db   -o mygenes --report-extended-deflines`

## blastx 
The “blastx” application translates a nucleotide query in six frames and searches it against a protein database.

`blastx -query mygenes  -db bssa/BSSA_db.fasta -outfmt 6 -out blastx_bssa`

## select significant hits
Import blastx_bssa.csv into R, and select hits with the best bitscore (over 70), and a lenght close to the BSSA (around 800)

### bitscore 
the bit-score is a normalized score that lets you estimate the magnitude of the search space you would have to look through before you would expect to find a score as good as or better than this one by chance. The higher the better. 

### e-value 
It provides information about the likelihood that a given sequence match is purely by chance. 

```
len = nrow(blastx_bssa_01)
for (i in 1:len) 
  if (blastx_bssa_01[i,12]>70 && blastx_bssa_01[i,4]>750) {print (blastx_bssa_01[i,])}
  
```

## BSSA results:

```
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|Q5P6A2|Q5P6A2_…   29.5    806      502      20     64  2358     69   849 1.06e-97      314
# A tibble: 1 x 12
  qseqid                                                                  sseqid            pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                   <chr>              <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd:… sp|O87943|BSSA_T…   29.9    802      504      23     64  2358     69   849 2.26e-96      311
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A1H5T9P9|A0A1H5T9…   29.5    801      509      22     64  2358     69   849 1.11e-95      309
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A0A2U381|A0A0A2U3…   29.5    807      507      23     55  2358     67   850 6.47e-95      306
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A0A2HSK1|A0A0A2HS…   29.9    812      497      22     55  2358     67   850 4.21e-93      302
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|K0NCD2|K0NCD2_…   28.5    806      510      20     64  2358     70   850 8.04e-91      296
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|R4KCB7|R4KCB7_…   28.3    805      521      20     55  2358     67   852 1.29e-90      295
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A562VLI2|A0A562VL…   28.6    809      512      21     55  2358     67   850 1.96e-88      289
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|B9M011|B9M011_…   29.0    806      512      21     55  2358     67   850 3.65e-88      288
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|I6LHT8|I6LHT8_…   28.9    802      512      23     64  2358     72   852 4.98e-87      285
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|B9M021|B9M021_…   28.7    833      520      24     10  2358     42   850 1.06e-85      281
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|Q39VF1|Q39VF1_…   27.6    841      519      22     10  2358     42   850 2.20e-82      273
# A tibble: 1 x 12
  qseqid                                                                  sseqid            pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                   <chr>              <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_compd… sp|O87943|BSSA_T…   30.3    801      496      21     64  2349     70   847 3.10e-75      253
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|Q5P6A2|Q5P6A2_…   29.4    802      502      20     64  2349     70   847 7.04e-74      249
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A1H5T9P9|A0A1H5T9…   30.0    801      499      21     64  2349     70   847 9.95e-74      248
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|R4KCB7|R4KCB7_…   30.0    833      511      25      1  2349     40   850 1.66e-72      245
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A0A2HSK1|A0A0A2HS…   28.8    806      502      23     64  2349     71   848 4.95e-72      244
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|K0NCD2|K0NCD2_…   28.7    804      505      21     64  2349     71   848 2.08e-71      242
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|I6LHT8|I6LHT8_…   29.2    835      511      27      4  2349     43   850 1.85e-69      236
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A562VLI2|A0A562VL…   27.8    824      537      20      4  2349     41   848 1.92e-69      236
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A0A2U381|A0A0A2U3…   28.9    750      475      22    217  2352    120   849 9.93e-68      231
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|B9M021|B9M021_…   27.8    836      524      23      4  2352     41   849 1.38e-67      231
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|B9M011|B9M011_…   28.0    832      525      21      4  2349     41   848 2.48e-66      228
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|Q39VF1|Q39VF1_…   27.7    838      522      23      4  2352     41   849 1.03e-64      223
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev… tr|A0A562VLI2|A0A562VL…   25.4    705      458      17    655  2703    189   847 3.72e-49      178
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|Q39VF1|Q39VF1_…   24.0    858      527      22    220  2703     85   847 3.58e-41      153
> len = nrow(blastx_bssa_01)
> for (i in 1:len) 
+   if (blastx_bssa_01[i,12]>70 && blastx_bssa_01[i,4]>650) {print (blastx_bssa_01[i,])}
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|Q5P6A2|Q5P6A2_…   29.5    806      502      20     64  2358     69   849 1.06e-97      314
# A tibble: 1 x 12
  qseqid                                                                  sseqid            pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                   <chr>              <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd:… sp|O87943|BSSA_T…   29.9    802      504      23     64  2358     69   849 2.26e-96      311
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A1H5T9P9|A0A1H5T9…   29.5    801      509      22     64  2358     69   849 1.11e-95      309
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A0A2U381|A0A0A2U3…   29.5    807      507      23     55  2358     67   850 6.47e-95      306
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A0A2HSK1|A0A0A2HS…   29.9    812      497      22     55  2358     67   850 4.21e-93      302
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|K0NCD2|K0NCD2_…   28.5    806      510      20     64  2358     70   850 8.04e-91      296
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|R4KCB7|R4KCB7_…   28.3    805      521      20     55  2358     67   852 1.29e-90      295
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_… tr|A0A562VLI2|A0A562VL…   28.6    809      512      21     55  2358     67   850 1.96e-88      289
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|B9M011|B9M011_…   29.0    806      512      21     55  2358     67   850 3.65e-88      288
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|I6LHT8|I6LHT8_…   28.9    802      512      23     64  2358     72   852 4.98e-87      285
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|B9M021|B9M021_…   28.7    833      520      24     10  2358     42   850 1.06e-85      281
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 33150|contig:c_000000011944|start:301|stop:2677|direction:f|rev_compd… tr|Q39VF1|Q39VF1_…   27.6    841      519      22     10  2358     42   850 2.20e-82      273
# A tibble: 1 x 12
  qseqid                                                                  sseqid            pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                   <chr>              <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_compd… sp|O87943|BSSA_T…   30.3    801      496      21     64  2349     70   847 3.10e-75      253
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|Q5P6A2|Q5P6A2_…   29.4    802      502      20     64  2349     70   847 7.04e-74      249
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A1H5T9P9|A0A1H5T9…   30.0    801      499      21     64  2349     70   847 9.95e-74      248
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|R4KCB7|R4KCB7_…   30.0    833      511      25      1  2349     40   850 1.66e-72      245
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A0A2HSK1|A0A0A2HS…   28.8    806      502      23     64  2349     71   848 4.95e-72      244
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|K0NCD2|K0NCD2_…   28.7    804      505      21     64  2349     71   848 2.08e-71      242
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|I6LHT8|I6LHT8_…   29.2    835      511      27      4  2349     43   850 1.85e-69      236
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A562VLI2|A0A562VL…   27.8    824      537      20      4  2349     41   848 1.92e-69      236
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev… tr|A0A0A2U381|A0A0A2U3…   28.9    750      475      22    217  2352    120   849 9.93e-68      231
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|B9M021|B9M021_…   27.8    836      524      23      4  2352     41   849 1.38e-67      231
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|B9M011|B9M011_…   28.0    832      525      21      4  2349     41   848 2.48e-66      228
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38610|contig:c_000000014013|start:1662|stop:4023|direction:f|rev_comp… tr|Q39VF1|Q39VF1_…   27.7    838      522      23      4  2352     41   849 1.03e-64      223
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|K0NCD2|K0NCD2_…   27.8    654      412      16    793  2703    237   847 1.15e-54      195
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|Q5P6A2|Q5P6A2_…   27.0    652      420      15    793  2703    236   846 2.76e-52      187
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|R4KCB7|R4KCB7_…   26.0    672      437      14    739  2703    221   849 5.18e-51      184
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev… tr|A0A0A2HSK1|A0A0A2HS…   25.6    655      430      14    790  2703    233   847 5.47e-51      184
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev… tr|A0A1H5T9P9|A0A1H5T9…   26.8    654      419      15    793  2703    236   846 5.71e-50      181
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|B9M011|B9M011_…   25.6    655      423      14    796  2703    238   847 1.62e-49      179
# A tibble: 1 x 12
  qseqid                                                            sseqid                  pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                             <chr>                    <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev… tr|A0A562VLI2|A0A562VL…   25.4    705      458      17    655  2703    189   847 3.72e-49      178
# A tibble: 1 x 12
  qseqid                                                                  sseqid            pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                   <chr>              <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_compd… sp|O87943|BSSA_T…   26.6    654      420      15    793  2703    236   846 5.37e-49      177
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|B9M021|B9M021_…   25.7    678      431      17    739  2703    220   847 1.31e-46      170
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|I6LHT8|I6LHT8_…   24.0    654      437      16    793  2703    239   849 2.33e-43      160
# A tibble: 1 x 12
  qseqid                                                                 sseqid             pident length mismatch gapopen qstart  qend sstart  send   evalue bitscore
  <chr>                                                                  <chr>               <dbl>  <dbl>    <dbl>   <dbl>  <dbl> <dbl>  <dbl> <dbl>    <dbl>    <dbl>
1 38815|contig:c_000000014074|start:1450|stop:4168|direction:r|rev_comp… tr|Q39VF1|Q39VF1_…   24.0    858      527      22    220  2703     85   847 3.58e-41      153
```
There is 3 different genes meeting these requirements in mycontigs.db, that are:

- 33150|contig:c_000000011944
- 38610|contig:c_000000014013
- 38815|contig:c_000000014074

### Find where the hits come from 
`anvi-export-collection -p SAMPLES-MERGED/PROFILE.db -C collection1 -O mybins2 --include-unbinned` allows to download all the contigs ID and their bins (if they are binned). 

ctrl+F {contig ID} into mybins2 

- 33150|contig:c\_000000011944: contigs\_Bin_43 -Unrefined bin
- 38610|contig:c\_000000014013: bin\_41_6 -Geobacter 
- 38815|contig:c\_000000014074: contigs\_Bin_43 

#### Look for taxonomy when not avalaible 
- `anvi-export-locus -c contigs.db --gene-caller-ids 33150 -O gene33150 -n 5` allows to get the gene of interest and the 5 genes after and before the sequence of interest, and then it extracts the locus to create a new contigs database. 
- Then, import taxonomy 
	- `centrifuge -f -x /Users/euphrasieservant/zee/bioprogram/centrifuge/p+h+v/p+h+v gene33150-calls.fa -S centrifuge_hits.tsv`
	- `anvi-import-taxonomy-for-genes -c gene33150.db -i centrifuge_report.tsv centrifuge_hits.tsv -p centrifuge`
- Use anvi-interactive `anvi-interactive -p gene33150-PROFILE/PROFILE.db -c gene33150.db`



## PED 





