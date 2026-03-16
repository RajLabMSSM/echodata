# Get Credible Set bins

Count bins of tool-specific and union Credible Set sizes.

## Usage

``` r
get_CS_bins(merged_DT)
```

## Arguments

- merged_DT:

  Merged data.table of fine-mapped summary statistics.

## See also

Other summarise:
[`get_CS_counts()`](https://rajlabmssm.github.io/echodata/reference/get_CS_counts.md),
[`get_SNPgroup_counts()`](https://rajlabmssm.github.io/echodata/reference/get_SNPgroup_counts.md),
[`results_report()`](https://rajlabmssm.github.io/echodata/reference/results_report.md)

## Examples

``` r
merged_DT <- echodata::get_Nalls2019_merged()
bin_counts <- get_CS_bins(merged_DT = merged_DT) 
```
