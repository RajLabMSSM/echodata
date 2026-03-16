# Convert data.table to GRanges object

Convert
[data.table](https://rdrr.io/pkg/data.table/man/data.table.html)/[data.frame](https://rdrr.io/r/base/data.frame.html)
to a [GRanges](https://rdrr.io/pkg/GenomicRanges/man/GRanges-class.html)
object.

## Usage

``` r
dt_to_granges(
  dat,
  chrom_col = "CHR",
  start_col = "POS",
  end_col = start_col,
  style = "NCBI",
  verbose = TRUE
)
```

## Arguments

- dat:

  Data.

- chrom_col:

  Chromosome column name.

- start_col:

  Genomic start position column name.

- end_col:

  Genomic end position column name.

- style:

  GRanges style (e.g. "NCBI, "UCSC") set by
  [seqlevelsStyle](https://rdrr.io/pkg/GenomeInfoDb/man/seqlevelsStyle.html).

- verbose:

  Print messages.

## Examples

``` r
gr <- echodata::dt_to_granges(dat = echodata::BST1)
#> Converting dat to GRanges object.
```
