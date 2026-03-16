# Get RSIDS from SNP coordinates

Get RSIDS from SNP coordinates using Bioconductor genome references.

## Usage

``` r
coords_to_rsids(
  dat,
  genome_build = "hg19",
  drop_unannotated = TRUE,
  drop_duplicates = TRUE,
  SNPname = "SNP",
  verbose = TRUE
)
```

## Arguments

- dat:

  [data.table](https://rdrr.io/pkg/data.table/man/data.table.html) or
  [data.frame](https://rdrr.io/r/base/data.frame.html) with SNP
  positions in the columns `CHR` and `POS`. Extra columns are allowed.

- genome_build:

  Which genome build `dat` is in (e.g. "hg19" or "hg38").

- drop_unannotated:

  Drop SNPs that RSIDs couldn't be found for.

- drop_duplicates:

  Drop any duplicate SNPs rows.

- SNPname:

  Name of the new column with RSIDs.

- verbose:

  Print messages.

## Value

[data.table](https://rdrr.io/pkg/data.table/man/data.table.html) with
new columns for RSIDs.

## Examples

``` r
# \donttest{
dat <- echodata::BST1[seq(5),]
data.table::setnames(dat,"SNP","SNP_old")
dat_annot <- coords_to_rsids(dat = dat)
#> Searching for RSIDs using: hg19
#> Loading required namespace: SNPlocs.Hsapiens.dbSNP144.GRCh37
#> Warning: replacing previous import ‘utils::findMatches’ by ‘S4Vectors::findMatches’ when loading ‘SNPlocs.Hsapiens.dbSNP144.GRCh37’
#> 5 / 5 SNPs annotated with RSIDs.
# }
```
