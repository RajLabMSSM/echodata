# Get Credible Set SNP counts

Tally tool-specific and Union Credible Set sizes across fine-mapping
methods and across loci.

## Usage

``` r
get_CS_counts(merged_DT, top_CS_only = FALSE)
```

## Arguments

- merged_DT:

  Merged data.table of fine-mapped summary statistics.

- top_CS_only:

  If a given method contains multiple Credible Sets, only choose one.

## See also

Other summarise:
[`get_CS_bins()`](https://rajlabmssm.github.io/echodata/reference/get_CS_bins.md),
[`get_SNPgroup_counts()`](https://rajlabmssm.github.io/echodata/reference/get_SNPgroup_counts.md),
[`results_report()`](https://rajlabmssm.github.io/echodata/reference/results_report.md)

## Examples

``` r
merged_DT <- echodata::get_Nalls2019_merged()
locus_order <- get_CS_counts(merged_DT = merged_DT) 
```
