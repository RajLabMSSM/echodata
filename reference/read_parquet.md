# Read parquet file

Import a file in parquet format as a
[data.table](https://rdrr.io/pkg/data.table/man/data.table.html).

## Usage

``` r
read_parquet(path, verbose = TRUE, ...)
```

## Arguments

- path:

  Path to parquet file.

- verbose:

  Print messages.

- ...:

  Arguments passed on to
  [`arrow::read_parquet`](https://arrow.apache.org/docs/r/reference/read_parquet.html)

  `file`

  :   A character file name or URI, connection, `raw` vector, an Arrow
      input stream, or a `FileSystem` with path (`SubTreeFileSystem`).
      If a file name or URI, an Arrow
      [InputStream](https://arrow.apache.org/docs/r/reference/InputStream.html)
      will be opened and closed when finished. If an input stream is
      provided, it will be left open.

  `col_select`

  :   A character vector of column names to keep, as in the "select"
      argument to
      [`data.table::fread()`](https://rdrr.io/pkg/data.table/man/fread.html),
      or a [tidy selection
      specification](https://tidyselect.r-lib.org/reference/eval_select.html)
      of columns, as used in
      [`dplyr::select()`](https://dplyr.tidyverse.org/reference/select.html).

  `as_data_frame`

  :   Should the function return a `tibble` (default) or an Arrow
      [Table](https://arrow.apache.org/docs/r/reference/Table-class.html)?

  `props`

  :   [ParquetArrowReaderProperties](https://arrow.apache.org/docs/r/reference/ParquetArrowReaderProperties.html)

  `mmap`

  :   Use TRUE to use memory mapping where possible

## Examples

``` r
 
#### Write a parquet file ####
dat <- echodata::BST1
path <- echodata::write_parquet(dat)
#> Writing parquet file ==> /tmp/RtmpIRVypB/file100559fe0274.parquet
#### Read the parquet file back into R ####
dat2 <- echodata::read_parquet(path=path)
#> Reading parquet file.
```
