# proteins curated database 
- InterproScan 
- BLAST the trusted sequences (Swiss-Prot, manually annotated sequence)
- Choose sequences with high similarity (~70%)
- Download and import to Jalview
- Alignment with muscle, in Jalview
- Recover and save the alignemnt
- Search proteins homologs with HMM

## HMM

### 1. hmmbuild
Build a profile from input alignment in Stockholm format.

```
# idx name                  nseq  alen  mlen eff_nseq re/pos description
#---- -------------------- ----- ----- ----- -------- ------ -----------
1     BSSA_alignment          12   868   862     0.48  0.590
```

### 2. hmmsearch search profile against sequence database. 
Database : downloaded uniprot_trembl.fasta, a complete UniProtKB/TrEMBL data set in FASTA format. 

- sequence E-value:  It is the expected number of false positives (non homologous sequences) that scored this well or better. the lower the better. 

```
Query:       BSSA_alignment  [M=862]
Scores for complete sequences (score includes all domains):
   --- full sequence ---   --- best 1 domain ---    -#dom-
    E-value  score  bias    E-value  score  bias    exp  N  Sequence                 Description
    ------- ------ -----    ------- ------ -----   ---- --  --------                 -----------
          0 1854.1   0.1          0 1853.9   0.1    1.0  1  sp|O87943|BSSA_THAAR      Benzylsuccinate synthase alpha subu
   1.2e-102  349.2   0.6   1.5e-102  348.8   0.6    1.1  1  sp|A0A031WDE4|HYPD_CLODI  Trans-4-hydroxy-L-proline dehydrata
    1.7e-94  322.3   0.1    2.2e-94  321.8   0.1    1.0  1  sp|Q30W70|CUTC_DESAG      Choline trimethylamine-lyase OS=Des
    2.1e-83  285.5   0.0    2.7e-83  285.2   0.0    1.0  1  sp|P75793|GRE2_ECOLI      Probable dehydratase YbiW OS=Escher
```
- Wrong number of domains, no expected sequences


## HMM online interactive search
- Search of proteins homologues with the original alignment 
- use the profile build hmmbuild
- Only the sequences with PFL-like and glycine radical domain were recovered
- Downloaded and imported to Jalview
- Redid the alignment, and calculated the tree 



## BSSA 

## Phenylethanol Dehydrogenase
- first blast result with only 52.5 % identity 

## Acetophenone Carboxylase apc3 subunit gamma
- 2 domains: hydant\_a_n and hydantoinase
- different names, for different fonctions...
- Many different outputs with different domains architectures
- hmm profile seemed to have beffed up the db 

## p-Cresol Methylhydroxylase













