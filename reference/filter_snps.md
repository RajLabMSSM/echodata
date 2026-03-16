# Filter SNPs

Filter SNPs by MAF, window size, min/max position, maximum number of
SNPs, or gene coordinates. You can also explicitly remove certain
variants.

## Usage

``` r
filter_snps(
  dat,
  bp_distance = 5e+05,
  remove_variants = FALSE,
  min_POS = NA,
  max_POS = NA,
  max_snps = NULL,
  min_MAF = NULL,
  trim_gene_limits = FALSE,
  verbose = TRUE
)
```

## Arguments

- dat:

  Fine-mapping results data.

- bp_distance:

  Distance around the lead SNP to include.

- remove_variants:

  A list of SNP RSIDs to remove.

- min_POS:

  Minimum genomic position to include.

- max_POS:

  Maximum genomic position to include.

- max_snps:

  Maximum number of SNPs to include.

- min_MAF:

  Minimum Minor Allele Frequency (MAF) of SNPs to include.

- trim_gene_limits:

  If a gene name is supplied to this argument (e.g.
  `trim_gene_limits="BST"`), only SNPs within the gene body will be
  included.

- verbose:

  Print messages.

## See also

Other SNP filters:
[`gene_trimmer()`](https://rajlabmssm.github.io/echodata/reference/gene_trimmer.md),
[`limit_snps()`](https://rajlabmssm.github.io/echodata/reference/limit_snps.md)

## Examples

``` r
dat <- echodata::filter_snps(dat = echodata::BST1)
#> FILTER:: Filtering by SNP features.
#> + FILTER:: Post-filtered data: 2913 x 26
```
