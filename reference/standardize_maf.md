# Standardize MAF

Standardize Minor Allele Frequency column. Will infer MAF from frequency
column, assuming that MAF is always less than 0.5 and that all SNPs are
biallelic

## Usage

``` r
standardize_maf(query, colmap, verbose = TRUE)
```

## Arguments

- query:

  data.frame of summary stat.

- colmap:

  Column mapping object created using
  [construct_colmap](https://rajlabmssm.github.io/echodata/reference/construct_colmap.md).

- verbose:

  Print messages.
