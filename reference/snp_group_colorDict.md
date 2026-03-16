# Assign colors to each SNP group

Assign colors to each SNP group as defined in
[snp_group_filters](https://rajlabmssm.github.io/echodata/reference/snp_group_filters.md).

## Usage

``` r
snp_group_colorDict(invert = FALSE)
```

## Arguments

- invert:

  Whether to invert the order of the dictionary.

## Value

A named list (*group_key:color_value*).

## Examples

``` r
colorDict <- echodata::snp_group_colorDict()
```
