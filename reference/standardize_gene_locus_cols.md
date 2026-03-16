# Standardizse gene/locus columns

Standardizse Gene and Locus columns in `topSNPs`.

## Usage

``` r
standardize_gene_locus_cols(
  topSNPs,
  Locus = "Locus",
  Gene = "Gene",
  grouping_vars = Locus,
  verbose = TRUE
)
```

## Arguments

- Locus:

  Column containing unique locus name.

- grouping_vars:

  The variables that you want to group by such that each grouping_var
  combination has its own index SNP. For example, if you want one index
  SNP per QTL eGene - GWAS locus pair, you could supply:
  `grouping_vars=c("Locus","Gene")`.

- verbose:

  Print messages.

## Value

topSNPs
