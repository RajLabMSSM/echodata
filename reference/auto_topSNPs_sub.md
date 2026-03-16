# Automatically identify top SNP per locus

If no `topSNPs` dataframe is supplied, this function will sort by
p-value and then effect size, and use the SNP in the first row.

## Usage

``` r
auto_topSNPs_sub(topSNPs, query, locus)
```

## Arguments

- topSNPs:

  Output of
  [import_topSNPs](https://rajlabmssm.github.io/echodata/reference/import_topSNPs.md).

- query:

  Summary stats subset.

- locus:

  Locus name.

## See also

Other standardization functions:
[`calculate_tstat()`](https://rajlabmssm.github.io/echodata/reference/calculate_tstat.md)
