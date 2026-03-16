# echolocatoR output example: MEX3C locus

An example results file after running finemap_loci.

## Usage

``` r
data("MEX3C")
```

## Format

data.table

- SNP:

  SNP RSID

- CHR:

  Chromosome

- POS:

  Genomic position (in basepairs)

- ...:

  Optional: extra columns

## Source

[doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)

## Details

Data originally comes from the Parkinson's disease GWAS by Nalls et al.
(The Lancet Neurology)
([doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)
).

## Examples

``` r
if (FALSE) { # \dontrun{
library(echodata)
data("Nalls2019_merged")
MEX3C <- subset(Nalls2019_merged, Locus=="MEX3C")
MEX3C <- echodata::assign_lead_snp(MEX3C)
usethis::use_data(MEX3C, overwrite = TRUE)
} # }
```
