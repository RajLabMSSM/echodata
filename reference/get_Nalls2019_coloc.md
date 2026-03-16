# Get colocalization results with Nalls2019 GWAS

Get colocalization results computed by Schilder et al. 2022
([doi:10.1093/hmg/ddab294](https://doi.org/10.1093/hmg/ddab294) )
between the Nalls2019 Parkinson's disease GWAS
([doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)
) and all eQTL datasets in the [eQTL
Catalogue](https://www.ebi.ac.uk/eqtl/).

## Usage

``` r
get_Nalls2019_coloc()
```

## Source

` URL <- paste("https://github.com/RajLabMSSM/Fine_Mapping_Shiny/raw", "master/www/data/GWAS/Nalls23andMe_2019/_genome_wide/COLOC", "coloc.eQTL_Catalogue_ALL.csv.gz", sep="/") tmp <- file.path(tempdir(), basename(URL)) utils::download.file(URL, tmp) piggyback::pb_upload(file = tmp, repo = "RajLabMSSM/echodata") `

## Examples

``` r
coloc_res <- get_Nalls2019_coloc()
```
