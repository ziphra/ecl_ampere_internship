# anvi'o first use 
## after sequencing 
### demultiplexing
I assumed the sequences were demultiplexed 

### quality filtering 
Sample_01

```
number of pairs analyzed      : 123144
total pairs passed            : 113724 (%92.35 of all pairs)
  total pair_1 trimmed        : 0 (%0.00 of all passed pairs)
  total pair_2 trimmed        : 0 (%0.00 of all passed pairs)
total pairs failed            : 9420 (%7.65 of all pairs)
  pairs failed due to pair_1  : 1887 (%20.03 of all failed pairs)
  pairs failed due to pair_2  : 6238 (%66.22 of all failed pairs)
  pairs failed due to both    : 1295 (%13.75 of all failed pairs)
``` 

Sample_02
 
```
number of pairs analyzed      : 54290
total pairs passed            : 50222 (%92.51 of all pairs)
  total pair_1 trimmed        : 0 (%0.00 of all passed pairs)
  total pair_2 trimmed        : 0 (%0.00 of all passed pairs)
total pairs failed            : 4068 (%7.49 of all pairs)
  pairs failed due to pair_1  : 483 (%11.87 of all failed pairs)
  pairs failed due to pair_2  : 2943 (%72.35 of all failed pairs)
  pairs failed due to both    : 642 (%15.78 of all failed pairs)
```
  
Sample_03

```
number of pairs analyzed      : 184786
total pairs passed            : 173024 (%93.63 of all pairs)
  total pair_1 trimmed        : 0 (%0.00 of all passed pairs)
  total pair_2 trimmed        : 0 (%0.00 of all passed pairs)
total pairs failed            : 11762 (%6.37 of all pairs)
  pairs failed due to pair_1  : 2234 (%18.99 of all failed pairs)
  pairs failed due to pair_2  : 8059 (%68.52 of all failed pairs)
  pairs failed due to both    : 1469 (%12.49 of all failed pairs)
```
### co-assembly with MEGAHIT
The syntax for environment variables is  ``` R1s= `ls 01_QC/*QUALITY_PASSED_R1* | python -c 'import sys; print (",".join([x.strip() for x in sys.stdin.readlines()]))'` ```: missing parentheses in the tutorial)

**to run:** `megahit -1 $R1s -2 $R2s --min-contig-len $MIN_CONTIG_SIZE -m 0.85 -o 02_ASSEMBLY/ -t $NUM_THREADS`
with MIN\_CONTIG\_SIZE = 1000 and NUM\_THREADS = 40   
(how to choose -m ?)

some stats from the log file:

```
2020-04-28 03:09:20 - b'INFO  main_assemble.cpp             :  211 - Number of complex bubbles removed: 0, Time elapsed(sec): 0.006886'
2020-04-28 03:09:20 - b'INFO  main_assemble.cpp             :  222 - Number unitigs disconnected: 0, time: 0.007'
2020-04-28 03:09:20 - b'INFO  main_assemble.cpp             :  246 - Unitigs removed in excessive pruning: 0, time: 0.000'
2020-04-28 03:09:20 - b'INFO  assembly/contig_stat.h        :   40 - Max: 10063, Min: 142, N50: 686, number contigs: 17868, number isolated: 17600, number looped: 42, total size: 12860989,'
2020-04-28 03:09:20 - b'INFO  main_assemble.cpp             :  289 - Number of local low depth unitigs removed: 8, complex bubbles removed: 0, time: 0.011086'
2020-04-28 03:09:20 - b'INFO  assembly/contig_stat.h        :   40 - Max: 10063, Min: 142, N50: 686, number contigs: 17846, number isolated: 17605, number looped: 42, total size: 12856876,'
2020-04-28 03:09:22 - b'INFO  utils/utils.h                 :  152 - Real: 22.7105\tuser: 72.4127\tsys: 0.4891\tmaxrss: 78999552'
2020-04-28 03:09:22 - Merging to output final contigs 
2020-04-28 03:09:22 - 2052 contigs, total 3601872 bp, min 1000 bp, max 10063 bp, avg 1755 bp, N50 1756 bp
2020-04-28 03:09:22 - ALL DONE. Time elapsed: 793.728498 seconds 

```

### mapping
very low overall alignment  
Sample_01

```
113724 reads; of these:
  113724 (100.00%) were paired; of these:
    107182 (94.25%) aligned concordantly 0 times
    6538 (5.75%) aligned concordantly exactly 1 time
    4 (0.00%) aligned concordantly >1 times
    ----
    107182 pairs aligned concordantly 0 times; of these:
      730 (0.68%) aligned discordantly 1 time
    ----
    106452 pairs aligned 0 times concordantly or discordantly; of these:
      212904 mates make up the pairs; of these:
        212602 (99.86%) aligned 0 times
        294 (0.14%) aligned exactly 1 time
        8 (0.00%) aligned >1 times
6.53% overall alignment rate
```

Sample_02

```
50222 reads; of these:
  50222 (100.00%) were paired; of these:
    49361 (98.29%) aligned concordantly 0 times
    861 (1.71%) aligned concordantly exactly 1 time
    0 (0.00%) aligned concordantly >1 times
    ----
    49361 pairs aligned concordantly 0 times; of these:
      211 (0.43%) aligned discordantly 1 time
    ----
    49150 pairs aligned 0 times concordantly or discordantly; of these:
      98300 mates make up the pairs; of these:
        98232 (99.93%) aligned 0 times
        68 (0.07%) aligned exactly 1 time
        0 (0.00%) aligned >1 times
2.20% overall alignment rate
```

Sample_03 
 
```
173024 reads; of these:
  173024 (100.00%) were paired; of these:
    167900 (97.04%) aligned concordantly 0 times
    5115 (2.96%) aligned concordantly exactly 1 time
    9 (0.01%) aligned concordantly >1 times
    ----
    167900 pairs aligned concordantly 0 times; of these:
      437 (0.26%) aligned discordantly 1 time
    ----
    167463 pairs aligned 0 times concordantly or discordantly; of these:
      334926 mates make up the pairs; of these:
        334746 (99.95%) aligned 0 times
        177 (0.05%) aligned exactly 1 time
        3 (0.00%) aligned >1 times
3.27% overall alignment rate
```
## Anvi'o User Tutorial for Metagenomic Workflow
