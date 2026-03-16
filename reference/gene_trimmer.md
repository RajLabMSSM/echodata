# Remove all SNPs outside of of a given gene.

Get the min/max coordinates of a given gene (including known regulatory
regions, introns, and exons). Remove any SNPs from the data.frame that
fall outside these coordinates.

## Usage

``` r
gene_trimmer(dat, gene, min_POS = NA, max_POS = NA)
```

## See also

Other SNP filters:
[`filter_snps()`](https://rajlabmssm.github.io/echodata/reference/filter_snps.md),
[`limit_snps()`](https://rajlabmssm.github.io/echodata/reference/limit_snps.md)
