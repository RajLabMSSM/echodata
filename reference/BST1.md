# echolocatoR output example: BST1 locus

An example results file after running finemap_loci.

## Usage

``` r
data("BST1")
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
BST1 <- echolocatoR::BST1
usethis::use_data(BST1, overwrite = TRUE)
} # }
```
