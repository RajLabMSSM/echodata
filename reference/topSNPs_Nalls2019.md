# TopSS example file (processed): Nalls2019

Summary stats of the top SNP(s) per locus. Used to query locus
subsets.for fine-mapping.

## Usage

``` r
data("topSNPs_Nalls2019")
```

## Format

An object of class `data.table` (inherits from `data.frame`) with 97
rows and 7 columns.

## Source

` topSS <- echodata::topSNPs_Nalls2019_raw topSNPs_Nalls2019 <- echodata::import_topSNPs(topSS=topSS, CHR="CHR", POS="BP", SNP="SNP", P="P, all studies", Effect="Beta, all studies", Gene="Nearest Gene", Locus="Nearest Gene", remove_variants="rs34637584") usethis::use_data(topSNPs_Nalls2019, overwrite=TRUE) `

## Details

Formerly `topSNPs`.
