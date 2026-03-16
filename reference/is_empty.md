# Check if a file is empty

Check if a summary statistics file subset is empty.

## Usage

``` r
is_empty(path, error = TRUE, verbose = TRUE)
```

## Arguments

- path:

  File path.

- error:

  Throw an error if the file is empty.

- verbose:

  Print messages.

## Value

Boolean.

## See also

Other general:
[`createDT()`](https://rajlabmssm.github.io/echodata/reference/createDT.md),
[`fillNA_CS_PP()`](https://rajlabmssm.github.io/echodata/reference/fillNA_CS_PP.md),
[`get_nrows()`](https://rajlabmssm.github.io/echodata/reference/get_nrows.md),
[`get_os()`](https://rajlabmssm.github.io/echodata/reference/get_os.md)

## Examples

``` r
tmp <- tempfile()
data.table::fwrite(echodata::BST1, tmp)
empty <- echodata::is_empty(path = tmp)
#> Subset file looks good.
```
