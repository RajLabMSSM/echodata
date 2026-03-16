# Get colocalization results with Kunkle2019 GWAS

Get colocalization results computed by Lopes et al. 2022
([doi:10.1038/s41588-021-00976-y](https://doi.org/10.1038/s41588-021-00976-y)
) between the Kunkle2019 Alzheimer's disease GWAS
([doi:10.1038/s41588-019-0358-2](https://doi.org/10.1038/s41588-019-0358-2)
) and microglia eQTL datasets.

## Usage

``` r
get_Kunkle2019_coloc(return_path = FALSE)
```

## Source

` URL <- paste( "https://github.com/RajLabMSSM", "Fine_Mapping_Shiny/raw/master/www", "Microglia_all_regions_Kunkle_2019_COLOC.snp-level_select.tsv.gz", sep="/") tmp <- file.path(tempdir(), basename(URL)) utils::download.file(URL, tmp) piggyback::pb_upload(file = tmp, repo = "RajLabMSSM/echodata") `

## Arguments

- return_path:

  If `TRUE`, return a named list containing both the imported data and
  the path where it has been saved. Default: `FALSE`.

## Value

[data.table](https://rdrr.io/pkg/data.table/man/data.table.html).

## Examples

``` r
coloc_res <- get_Kunkle2019_coloc()
```
