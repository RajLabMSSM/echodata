# TopSS example file: Nalls2019

Summary stats of the top SNP(s) per locus. Used to query locus
subsets.for fine-mapping.

## Usage

``` r
data("topSNPs_Nalls2019_raw")
```

## Format

An object of class `data.table` (inherits from `data.frame`) with 107
rows and 31 columns.

## Source

<https://github.com/RajLabMSSM/Fine_Mapping/raw/master/Data/GWAS/Nalls23andMe_2019/Nalls2019_TableS2.xlsx>
` local <- file.path(tempdir(),"Nalls2019_TableS2.xlsx") utils::download.file( paste("https://github.com/RajLabMSSM/Fine_Mapping", "raw/master/Data/GWAS/Nalls23andMe_2019", "Nalls2019_TableS2.xlsx"), local, sep="/") topSNPs_Nalls2019_raw <- data.table::data.table(readxl::read_excel(local)) usethis::use_data(topSNPs_Nalls2019_raw, overwrite=TRUE) `

## Details

Formerly `topSNPs_Nalls2019`.

Data from Nalls et al. (bioRxiv)
([doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)
), Table S2.
