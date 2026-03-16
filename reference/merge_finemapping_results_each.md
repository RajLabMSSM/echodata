# Create full cross-locus merged files for each dataset, then return a subset of those files as one super-merged table.

Create full cross-locus merged files for each dataset, then return a
subset of those files as one super-merged table.

## Usage

``` r
merge_finemapping_results_each(
  study_dirs,
  LD_reference = "1KGphase3",
  minimum_support = 1,
  include_leadSNPs = TRUE,
  return_filter = "!is.na(SNP)",
  merged_path = "merged_DT.csv.gz",
  force_new_merge = FALSE,
  nThread = 1,
  verbose = TRUE
)
```
