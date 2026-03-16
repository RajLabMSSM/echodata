# Get SNP group filters

Returns a character vector of filtering arguments for different SNP
groups.

## Usage

``` r
snp_group_filters(invert = FALSE, random_sample_size = 20)
```

## Arguments

- invert:

  Reverse the list.

- random_sample_size:

  Sample size for random SNP subset ("Random").

## Examples

``` r
filts <- echodata::snp_group_filters()
```
