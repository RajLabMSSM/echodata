# Limit the number of SNPs per locus.

Start with the lead SNP and keep expanding the window until you reach
the desired number of SNPs. `dat` should only contain one locus from one
chromosome.

## Usage

``` r
limit_snps(dat, max_snps = 500, verbose = TRUE)
```

## Arguments

- dat:

  A data.frame that contains at least the following columns:

  SNP

  :   RSID for each SNP.

  POS

  :   Each SNP's genomic position (in basepairs).

- max_snps:

  The maximum number of SNPs to keep in the resulting
  [data.table](https://rdrr.io/pkg/data.table/man/data.table.html).

- verbose:

  Print messages.

## Value

A filtered
[data.table](https://rdrr.io/pkg/data.table/man/data.table.html).

## See also

Other SNP filters:
[`filter_snps()`](https://rajlabmssm.github.io/echodata/reference/filter_snps.md),
[`gene_trimmer()`](https://rajlabmssm.github.io/echodata/reference/gene_trimmer.md)

## Examples

``` r
dat2 <- echodata::limit_snps(dat = echodata::BST1)
#> Limiting to only 500 SNPs.
#> + Reduced number of SNPs: 6,216 ==> 500
```
