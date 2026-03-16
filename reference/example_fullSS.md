# Store `fullSS_dat`

Save downsampled genome-wide summary statistics from different GWAS to
disk.

## Usage

``` r
example_fullSS(
  save_dir = tempdir(),
  dataset = c("Nalls2019", "Kunkle2019"),
  nThread = 1,
  verbose = TRUE
)
```

## Arguments

- save_dir:

  Path to save the example summary statistics to. It is usually best to
  provide the absolute path rather than the relative path.

- dataset:

  Name of the example GWAS dataset to use.

- nThread:

  Number of threads to use.

- verbose:

  Print messages.

## Value

Path to saved summary statistics file.

## Details

- Nalls2019:

  Parkinson's Disease GWAS from Nalls et al. 2019
  ([doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)
  ), excluding 23andMe data.

- Kunkle2019:

  Alzheimer's Disease GWAS from Kunkle et al. 2019
  ([doi:10.1038/s41588-019-0358-2](https://doi.org/10.1038/s41588-019-0358-2)
  ).

## Examples

``` r
fullSS_path <- example_fullSS()
#> Writing file to ==> /tmp/RtmpIRVypB/nalls2019.fullSS_subset.tsv
```
