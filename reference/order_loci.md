# Order loci

Order loci by UCS size, or alphabetically.

## Usage

``` r
order_loci(dat, by_ucs_size = FALSE, descending = TRUE, verbose = FALSE)
```

## Arguments

- dat:

  Fine-mapped summary statistics data.

- by_ucs_size:

  Sort by Union Credible Set (UCS) size.

- descending:

  Sort `by_ucs_size` in descending order.

- verbose:

  Print messages.

## Examples

``` r
merged_DT <- echodata::get_Nalls2019_merged()
merged_DT2 <- echodata::order_loci(dat=merged_DT)
```
