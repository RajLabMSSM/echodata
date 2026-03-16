# Find Consensus SNPs: without PolyFun

Find Consensus SNPs in finemap_loci output, without using any results
from the functional fine-mapping tool PolyFun (in a new column
"Consensus_SNP_noPF"). This helps to avoid any circularity when
validating results with functional annotation that PolyFun may have been
trained on.

## Usage

``` r
find_consensus_snps_no_polyfun(dat, verbose = TRUE)
```

## Arguments

- dat:

  Fine-mapping results data.

- verbose:

  Print messages.

## Examples

``` r
BST1 <- echodata::find_consensus_snps_no_polyfun(dat = echodata::BST1)
#> Identifying UCS and Consensus SNPs without PolyFun
#> Identifying Consensus SNPs...
#> + support_thresh = 2
#> + Calculating mean Posterior Probability (mean.PP)...
#> + 3 fine-mapping methods used.
#> + 7 Credible Set SNPs identified.
#> + 1 Consensus SNPs identified.
```
