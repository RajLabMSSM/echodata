# Impute t-stat

If **tstat** column is missing, compute t-statistic from:
`Effect / StdErr`.

## Usage

``` r
calculate_tstat(dat, colmap = construct_colmap(), verbose = TRUE)
```

## See also

Other standardization functions:
[`auto_topSNPs_sub()`](https://rajlabmssm.github.io/echodata/reference/auto_topSNPs_sub.md)
