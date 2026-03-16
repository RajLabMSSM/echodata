# Merge robust

Ensure two
[data.table](https://rdrr.io/pkg/data.table/man/data.table.html) are
merged properly. Necessary due to inconsistencies with how
[data.table](https://rdrr.io/pkg/data.table/man/data.table.html) are
evaluated in different scopes.

## Usage

``` r
merge_robust(x, y, by = NULL, dup_stop = TRUE, na_stop = TRUE, ...)
```

## Source

[data.table
docs](https://rdatatable.gitlab.io/data.table/articles/datatable-importing.html#optionally-import-data-table-suggests)

## Arguments

- x, y:

  `data table`s. `y` is coerced to a `data.table` if it isn't one
  already.

- by:

  A vector of shared column names in `x` and `y` to merge on. This
  defaults to the shared key columns between the two tables. If `y` has
  no key columns, this defaults to the key of `x`.

- dup_stop:

  Throw an error if duplicates of the `by` column are detected after
  merging.

- na_stop:

  Throw an error if all of the data from `y` has been converted to NAs
  (unless they were all NAs before merging).

- ...:

  Additional arguments passed to
  [merge.data.table](https://rdrr.io/pkg/data.table/man/merge.html).

## Examples

``` r
dat <- echodata::BST1
x <- dat[,c("SNP","CHR","POS")]
y <- dat[,c("SNP","Support","leadSNP")]
z <- merge_robust(x=x, y=y, by="SNP")
```
