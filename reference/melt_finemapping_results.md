# Melt fine-mapping results

Melt fine-mapping results into long format such that "\\.CS" and "\\.PP"
columns from multiple methods are now in a single column.

## Usage

``` r
melt_finemapping_results(dat, verbose = TRUE)
```

## Arguments

- dat:

  Fine-mapping results data.

- verbose:

  Print messages.

## Value

Modified
[data.table](https://rdrr.io/pkg/data.table/man/data.table.html) with
the new columns "Method","PP", and "CS".

## Examples

``` r
finemap_melt <- echodata::melt_finemapping_results(dat = echodata::BST1)
#> Melting PP and CS from 5 fine-mapping methods.
```
