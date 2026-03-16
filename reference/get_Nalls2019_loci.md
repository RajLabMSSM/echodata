# echolocatoR output example: select loci

An example results file after running `finemap_loci` on 3 Parkinson's
disease (PD)-associated loci (BST1, LRRK2, and MEX3C).

Data originally comes from the PD GWAS by Nalls et al. (The Lancet
Neurology)
([doi:10.1016/S1474-4422(19)30320-5](https://doi.org/10.1016/S1474-4422%2819%2930320-5)
).

## Usage

``` r
get_Nalls2019_loci(
  save_dir = tempdir(),
  return_paths = TRUE,
  return_dir = FALSE,
  limit_snps = NULL,
  force_new = FALSE,
  verbose = TRUE
)
```

## Arguments

- save_dir:

  Local directory to cache data in.

- return_paths:

  Returns local paths to cached fine-mapping results (default: `TRUE`),
  or the data itself as a named list (`FALSE`).

- return_dir:

  Return the directory name instead of the individual file paths.

- limit_snps:

  Limit the number of SNPs saved in each file.

- force_new:

  Force the creation of new files even if old ones exists.

- verbose:

  Print messages.

## Value

File paths

## Examples

``` r
files <- get_Nalls2019_loci()
#> Writing fine-mapped locus data ==> /tmp/RtmpIRVypB/Nalls23andMe_2019/BST1.multi_finemap.csv.gz
#> Writing fine-mapped locus data ==> /tmp/RtmpIRVypB/Nalls23andMe_2019/LRRK2.multi_finemap.csv.gz
#> Writing fine-mapped locus data ==> /tmp/RtmpIRVypB/Nalls23andMe_2019/MEX3C.multi_finemap.csv.gz
```
