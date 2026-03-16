# Merge fine-mapping results from all loci

Gather fine-mapping results from echolocatoR across all loci and merge
into a single data.frame.

## Usage

``` r
merge_finemapping_results(
  dataset = file.path(tempdir(), "Data/GWAS"),
  minimum_support = 1,
  include_leadSNPs = TRUE,
  LD_reference = NULL,
  save_path = tempfile(fileext = "merged_results.csv.gz"),
  from_storage = TRUE,
  credset_thresh = 0.95,
  consensus_thresh = 2,
  exclude_methods = NULL,
  top_CS_only = FALSE,
  verbose = TRUE,
  nThread = 1
)
```

## Arguments

- dataset:

  Path to the folder you want to recursively search for results files
  within (e.g. `"Data/GWAS/Nalls23andMe_2019"`). Set this to a path that
  includes multiple subfolders if you want to gather results from
  multiple studies at once (e.g. `"Data/GWAS"`).

- minimum_support:

  Filter SNPs by the minimum number of fine-mapping tools that contained
  the SNP in their Credible Set.

- include_leadSNPs:

  Include lead GWAS/QTL SNPs per locus (regardless of other filtering
  criterion).

- LD_reference:

  LD reference to use:

  1KGphase1

  :   1000 Genomes Project Phase 1 (genome build: hg19).

  1KGphase3

  :   1000 Genomes Project Phase 3 (genome build: hg19).

  UKB

  :   Pre-computed LD from a British European-decent subset of UK
      Biobank. *Genome build* : hg19

  \<vcf_path\>

  :   User-supplied path to a custom VCF file to compute LD matrix
      from.\
      *Accepted formats*: *.vcf* / *.vcf.gz* / *.vcf.bgz*\
      *Genome build* : defined by user with `target_genome`.

  \<matrix_path\>

  :   User-supplied path to a pre-computed LD matrix. *Accepted
      formats*: *.rds* / *.rda* / *.csv* / *.tsv* / *.txt*\
      *Genome build* : defined by user with `target_genome`.

- save_path:

  Path to save merged table to.

- from_storage:

  Search for stored results files.

- credset_thresh:

  The minimum mean Posterior Probability (across all fine-mapping
  methods used) of SNPs to be included in the "mean.CS" column.

- consensus_thresh:

  The minimum number of fine-mapping tools in which a SNP is in the
  Credible Set in order to be included in the "Consensus_SNP" column.

- exclude_methods:

  Exclude certain fine-mapping methods when estimating **mean.CS** and
  **Consensus_SNP**.

- top_CS_only:

  Only include the top 1 CS per fine-mapping method.

- verbose:

  Print messages.

- nThread:

  Number of threads to parallelise across.

## Examples

``` r
dataset <- get_Nalls2019_loci(return_dir = TRUE)
merged_DT <- merge_finemapping_results(dataset = dataset)
#> + Gathering all fine-mapping results from storage...
#> + 3 multi-finemap files found.
#> + Removing duplicate Multi-finemap files per locus.
#> + Importing results... RtmpIRVypB
#> + Importing results... RtmpIRVypB
#> + Importing results... RtmpIRVypB
#> Identifying Consensus SNPs...
#> + support_thresh = 2
#> + Calculating mean Posterior Probability (mean.PP)...
#> + 4 fine-mapping methods used.
#> + 20 Credible Set SNPs identified.
#> + 9 Consensus SNPs identified.
#> + Saving merged results ==> /tmp/RtmpIRVypB/file100572a9a7d3merged_results.csv.gz
```
