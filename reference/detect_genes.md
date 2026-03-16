# Detect QTL genes in full summary stats file

Allows summary stats from different genes to be fine-mapped separately.

## Usage

``` r
detect_genes(loci, verbose = FALSE)
```

## Arguments

- loci:

  (Named) character vector of locus names.

- verbose:

  Print messages.

## Examples

``` r
#### No genes (names) ####
loci <- c("BST1","LRKR2","MEX3C")
detect_genes(loci)
#> [1] FALSE

#### Genes (names) ####
loci <- c(BST1="BST1", LRRK2="LRRK2", MEX3C="MEX3C")
echodata::detect_genes(loci)
#> [1] TRUE
```
