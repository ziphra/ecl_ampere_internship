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