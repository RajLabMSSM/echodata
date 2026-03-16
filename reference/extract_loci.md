# Extract loci from GWAS/QTL summary statistics

Extract loci from GWAS/QTL summary statistics

## Usage

``` r
extract_loci(topSNPs, fullSS, bp_distance = 5e+05, munged = TRUE)
```

## Arguments

- topSNPs:

  Positions of the top SNPs prepare using
  [import_topSNPs](https://rajlabmssm.github.io/echodata/reference/import_topSNPs.md).

- fullSS:

  [data.table](https://rdrr.io/pkg/data.table/man/data.table.html) of
  the full GWAS/QTL summary statistics.

- bp_distance:

  The basepair distance upstream/downstream of the proxy SNP (in
  `topSNPs`) to extract.

- munged:

  Whether `fullSS` was previously munged with
  [format_sumstats](https://al-murphy.github.io/MungeSumstats/reference/format_sumstats.html).
