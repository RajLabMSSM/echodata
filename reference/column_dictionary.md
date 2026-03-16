# Map column names to positions.

Useful in situations where you need to specify columns by index instead
of name (e.g. awk queries).

## Usage

``` r
column_dictionary(path)
```

## Arguments

- path:

  Path to full summary stats file (or any really file you want to make a
  column dictionary for).

## Value

Named list of column positions.

## Examples

``` r
tmp <- tempfile()
data.table::fwrite(echodata::BST1, tmp)
cdict <- echodata::column_dictionary(path = tmp)
```
