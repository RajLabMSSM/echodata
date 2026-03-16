# Convert from MungeSumstats to echolocatoR format

Convert column names between package-specific formats. Optionally, can
also be used to first automatically standardise column names by setting
`standardise_colnames=TRUE` before converting to echolocatoR format.

## Usage

``` r
mungesumstats_to_echolocatoR(dat, standardise_colnames = FALSE, verbose = TRUE)
```

## Arguments

- dat:

  A [data.table](https://rdrr.io/pkg/data.table/man/data.table.html) of
  SNP-level summary statistics.

- standardise_colnames:

  Automatically rename all columns to a standard nomenclature using
  [standardise_header](https://al-murphy.github.io/MungeSumstats/reference/standardise_header.html).

- verbose:

  Print messages.

## Examples

``` r
 
dat <- dplyr::rename(echodata::BST1, BPOS=POS, SEBETA=StdErr, B=Effect)
dat_echoR <- echodata::mungesumstats_to_echolocatoR(
    dat=dat,
    standardise_colnames=TRUE)
#> + Mapping colnames from MungeSumstats ==> echolocatoR
#> Standardising column headers.
#> First line of summary statistics file: 
#> SNP  CHR BPOS    P   B   SEBETA  Freq    MAF N_cases N_controls  proportion_cases    A1  A2  leadSNP ABF.CS  ABF.PP  SUSIE.CS    SUSIE.PP    POLYFUN_SUSIE.CS    POLYFUN_SUSIE.PP    FINEMAP.CS  FINEMAP.PP  Support Consensus_SNP   mean.PP mean.CS 
```
