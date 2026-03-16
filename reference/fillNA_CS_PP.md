# Fill NAs in PP and CS columns

Fill NAs in columns with fine-mapping Posterior Probabilities (ending in
".PP") and and columns with Credible Set assignments (ending in ".CS").

## Usage

``` r
fillNA_CS_PP(dat, fillNA_CS = 0, fillNA_PP = 0, verbose = TRUE)
```

## Arguments

- dat:

  Fine-mapping results data.

- fillNA_CS:

  What to fill NA values in Credible Set ("\*.CS") columns with.

- fillNA_PP:

  What to fill NA values in Posterior Probability ("\*.PP") columns
  with.

- verbose:

  Print messages.

## Value

Modified
[data.table](https://rdrr.io/pkg/data.table/man/data.table.html)

## See also

Other general:
[`createDT()`](https://rajlabmssm.github.io/echodata/reference/createDT.md),
[`get_nrows()`](https://rajlabmssm.github.io/echodata/reference/get_nrows.md),
[`get_os()`](https://rajlabmssm.github.io/echodata/reference/get_os.md),
[`is_empty()`](https://rajlabmssm.github.io/echodata/reference/is_empty.md)

## Examples

``` r
dat <- echodata::BST1 
dat <- echodata::fillNA_CS_PP(dat = dat)
#> + Filling NAs in CS cols with 0.
#> + Filling NAs in PP cols with 0.
```
