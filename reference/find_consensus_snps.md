# Find Consensus SNPs

Find Consensus SNPs in finemap_loci output.

## Usage

``` r
find_consensus_snps(
  dat,
  credset_thresh = 0.95,
  consensus_thresh = 2,
  sort_by_support = TRUE,
  exclude_methods = NULL,
  verbose = TRUE
)
```

## Arguments

- dat:

  Fine-mapping results data.

- credset_thresh:

  The minimum mean Posterior Probability (across all fine-mapping
  methods used) of SNPs to be included in the "mean.CS" column.

- consensus_thresh:

  The minimum number of fine-mapping tools in which a SNP is in the
  Credible Set in order to be included in the "Consensus_SNP" column.

- sort_by_support:

  Whether to sort SNPs by the "Support" column.

- exclude_methods:

  Whether to exclude results from certain fine-mapping methods when
  mean/consensus columns.

- verbose:

  Print messages.

## Examples

``` r
BST1 <- echodata::find_consensus_snps(dat = echodata::BST1)
#> Identifying Consensus SNPs...
#> + support_thresh = 2
#> + Calculating mean Posterior Probability (mean.PP)...
#> + 4 fine-mapping methods used.
#> + 7 Credible Set SNPs identified.
#> + 3 Consensus SNPs identified.
```
