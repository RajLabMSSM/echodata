# Convert from GRanges to BED format

Convert
[GRanges](https://rdrr.io/pkg/GenomicRanges/man/GRanges-class.html)
object to BED format and save as a text file.

## Usage

``` r
granges_to_bed(
  grlist,
  save_dir = tempdir(),
  sep = "\t",
  nThread = 1,
  gzip = FALSE,
  verbose = TRUE
)
```

## Arguments

- grlist:

  A list of
  [GRanges](https://rdrr.io/pkg/GenomicRanges/man/GRanges-class.html)
  objects. Can also be a single non-list
  [GRanges](https://rdrr.io/pkg/GenomicRanges/man/GRanges-class.html)
  object.

- save_dir:

  Where to save the BED file.

- sep:

  The separator between columns. Default is `","`.

- nThread:

  The number of threads to use. Experiment to see what works best for
  your data on your hardware.

- gzip:

  Whether the BED file should be gzip compressed.

- verbose:

  Print messages.

## Examples

``` r
gr <- echodata::dt_to_granges(dat = echodata::BST1)
#> Converting dat to GRanges object.
bed_path <- echodata::granges_to_bed(grlist = gr)
#> Converting 1 GRanges object to separate BED files.
#> Saving BED file ==> /tmp/RtmpIRVypB/granges1.bed.txt
```
