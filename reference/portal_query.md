# Search and download fine-mapping files

Search the [echolocatoR Fine-mapping
Portal](https://github.com/RajLabMSSM/Fine_Mapping_Shiny) for
fine-mapping results, LD, and locus plots.

## Usage

``` r
portal_query(
  dataset_types = NULL,
  datasets = NULL,
  phenotypes = NULL,
  file_types = c("multi_finemap", "LD", "plot"),
  loci = NULL,
  LD_panels = c("UKB", "1KGphase1", "1KGphase3"),
  results_dir = tempdir(),
  overwrite = FALSE,
  as_datatable = FALSE,
  nThread = 1,
  verbose = TRUE
)
```

## Arguments

- dataset_types:

  Dataset types to search for (e.g. "GWAS", "QTL").

- datasets:

  Dataset names to search for (e.g. "Ripke_2014", "Wray_2018").

- phenotypes:

  Phenotypes to search for (e.g. "Schizophrenia", "Major Depressive
  Disorder").

- file_types:

  File types to search for:

  "multi_finemap":

  :   Fine-mapping results merged with GWAS/QTL summary statistics.

  "LD":

  :   Linkage Disequilibrium with the lead SNP in each locus.

  "plot" :

  :   Locus plots of fine-mapped results.

- loci:

  Locus names to search for (e.g. "BST1", "CHRNB1", "LRRK2").

- LD_panels:

  LD panels to search for, or results generated using different LD
  panels (e.g. "UKB", "1KGphase1", "1KGphase3").

- results_dir:

  Where to save the matching queries.

- overwrite:

  Whether to overwrite previously saved queries with the same names.

- as_datatable:

  Return results organized in a
  [data.table](https://rdrr.io/pkg/data.table/man/data.table.html).
  Otherwise, will return a list of local file paths.

- nThread:

  Number of threads to parallelise downloads across.

- verbose:

  Print messages.

## Value

List of local paths where the requested files were downloaded to.

## Examples

``` r
local_finemap <- portal_query(
    dataset_types = "GWAS",
    phenotypes = c("schizophrenia", "parkinson"),
    file_types = "multi_finemap",
    loci = c("BST1", "CHRNB1", "LRRK2"),
    LD_panels="1KGphase3") 
#> Loading required namespace: echogithub
#> Fetching echolocatoR Fine-mapping Portal study metadata.
#> + 2 dataset(s) remain after filtering.
#> + Searching for multi_finemap files...
#> Searching for all branches in: RajLabMSSM/Fine_Mapping_Shiny
#> 1 matching branch(es) found: 
#>  - master
#> 6,529 files found in GitHub repo: RajLabMSSM/Fine_Mapping_Shiny
#> 801 file(s) found matching query.
#> + 6 unique files identified.
#> + Downloading 3 files.
#> Downloading: https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/BST1/multi_finemap/BST1.1KGphase3.multi_finemap.csv.gz
#> Downloading: https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/CHRNB1/multi_finemap/CHRNB1.1KGphase3.multi_finemap.csv.gz
#> Downloading: https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/LRRK2/multi_finemap/LRRK2.1KGphase3.multi_finemap.csv.gz
```
