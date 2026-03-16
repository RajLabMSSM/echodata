# Reassign lead SNPs

Reassign lead SNPs per group.

## Usage

``` r
reassign_lead_snps(
  merged_dat,
  SNP = "SNP",
  P = "P",
  Effect = "Effect",
  grouping_vars = c("Dataset", "Locus"),
  nThread = 1,
  verbose = TRUE
)
```

## Arguments

- merged_dat:

  Merged, multi-locus fine-mapping results data.

- SNP:

  Name of the SNP column.

- P:

  Name of the p-value column.

- Effect:

  Name of the Effect column.

- grouping_vars:

  Column names to group by when assigning lead SNPs.

- nThread:

  Number of threads to parallelise across.

- verbose:

  Print messages.

## Examples

``` r
 
merged_dat <- get_Nalls2019_merged()
merged_dat2 <- reassign_lead_snps(merged_dat = merged_dat)
#> Reassigning lead SNPs by: Dataset, Locus
```
