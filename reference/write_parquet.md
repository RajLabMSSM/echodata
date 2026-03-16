# Write parquet file

Export a [data.frame](https://rdrr.io/r/base/data.frame.html) to parquet
format.

## Usage

``` r
write_parquet(dat, path = tempfile(fileext = ".parquet"), verbose = TRUE)
```

## Arguments

- dat:

  [data.frame](https://rdrr.io/r/base/data.frame.html).

- path:

  Path to write parquet file to.

- verbose:

  Print messages.

## Examples

``` r
dat <- echodata::BST1
path <- echodata::write_parquet(dat = dat) 
#> Writing parquet file ==> /tmp/RtmpIRVypB/file100554140c46.parquet
```
