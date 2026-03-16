# Get file header

Reading in this way is more robust and able to handle bgz format.

## Usage

``` r
get_header(
  path,
  colnames_only = TRUE,
  nrows = 2L,
  nThread = 1L,
  verbose = TRUE
)
```

## Arguments

- path:

  Path to local file or remote URL.

- colnames_only:

  Whether to return only column names (default: `TRUE`), or the first
  `n` rows as well.

- nrows:

  The maximum number of rows to read. Unlike `read.table`, you do not
  need to set this to an estimate of the number of rows in the file for
  better speed because that is already automatically determined by
  `fread` almost instantly using the large sample of lines. `nrows=0`
  returns the column names and typed empty columns determined by the
  large sample; useful for a dry run of a large file or to quickly check
  format consistency of a set of files before starting to read any of
  them.

- nThread:

  The number of threads to use. Experiment to see what works best for
  your data on your hardware.

- verbose:

  Print messages.

## Examples

``` r
tmp <- tempfile(fileext = ".tsv.gz")
data.table::fwrite(echodata::BST1, file = tmp, sep = "\t") 
header <- echodata::get_header(path=tmp)
```
