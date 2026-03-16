# Find the top Consensus SNP

Identify the `n_top` Consensus SNP(s) per Locus, defined as the
Consensus SNPs with the highest mean PP across all fine-mapping tools
used.

## Usage

``` r
find_top_consensus(dat, n_top = 1, grouping_vars = c("Locus"))
```

## Arguments

- dat:

  Fine-mapping results data.

- n_top:

  Number of top SNPs per locus to include.

- grouping_vars:

  Variables to group by when selecting top N rows.

## Examples

``` r
dat <- echodata::find_top_consensus(dat = echodata::BST1)
```
