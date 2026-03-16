# Preview formatted sum stats saved to disk

Prints the first `nrows` lines of the sum stats.

## Usage

``` r
preview(path, nrows = 5L, nThread = 1L)
```

## Arguments

- path:

  Path to local file or remote URL. Alternatively, can pass in a
  data.frame to be used directly.

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

## Value

No return
