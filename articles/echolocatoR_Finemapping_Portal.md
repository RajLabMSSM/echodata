# echolocatoR Fine-mapping Portal

``` r

library(echodata)
has_internet <- curl::has_internet()
```

The \*echolocatoR.

The following functions provides API access to the fine-mapping results,
pre-computed LD matrices, and plots available on the [**echolocatoR
Fine-mapping Portal**](https://rajlab.shinyapps.io/Fine_Mapping_Shiny/).

## View metadata

Peruse the metadata to see the available data types (e.g. “GWAS”,
“QTL”), datasets (e.g. “Ripke_2014”, “Wray_2018”), and phenotypes
(e.g. “Schizophrenia”, “Major Depressive Disorder”).

``` r

meta <- echodata::portal_metadata()
knitr::kable(meta)
```

| dataset_type | dataset | phenotype | prop_cases | build | reference |
|:---|:---|:---|---:|:---|:---|
| GWAS | Ripke_2014 | Schizophrenia | 0.2460 | hg19 | <https://www.nature.com/articles/nature13595> |
| GWAS | Wray_2018 | Major Depressive Disorder | 0.2820 | hg19 | <https://www.nature.com/articles/s41588-018-0090-3> |
| GWAS | IMSGC_2019 | Multiple Sclerosis | 0.4090 | hg19 | <https://science.sciencemag.org/content/365/6460/eaav7188> |
| GWAS | Stahl_2019 | Bipolar Disorder | 0.3950 | hg19 | <https://www.nature.com/articles/s41588-019-0397-8> |
| GWAS | Daner_2020 | Bipolar Disorder | 0.1010 | hg19 | <https://www.medrxiv.org/content/10.1101/2020.09.17.20187054v1> |
| GWAS | Nalls23andMe_2019 | Parkinson’s Disease | 0.0386 | hg19 | <https://www.biorxiv.org/content/10.1101/388165v3> |
| GWAS | Lambert_2013 | Alzheimer’s Disease | 0.3450 | hg19 | <https://www.nature.com/articles/ng.2802> |
| GWAS | Marioni_2018 | Alzheimer’s Disease | 0.1740 | hg19 | <https://www.nature.com/articles/s41398-018-0150-6> |
| GWAS | Jansen_2018 | Alzheimer’s Disease | 0.1570 | hg19 | <https://www.nature.com/articles/s41588-018-0311-9> |
| GWAS | Kunkle_2019 | Alzheimer’s Disease | 0.3700 | hg19 | <https://www.nature.com/articles/s41588-019-0358-2> |
| QTL | Microglia_all_regions | eQTL | NA | hg38 | <https://www.biorxiv.org/content/10.1101/2020.10.27.356113v1> |

## Query portal

Query and download data from the [**echolocatoR Fine-mapping
Portal**](https://rajlab.shinyapps.io/Fine_Mapping_Shiny/).

`portal_query` will return a list of paths where each file has been
downloaded locally, in a hierarchical folder structure
(i.e. `dataset_type --> dataset --> locus --> data_types` )

``` r

results_dir <- tempdir()
local_files <- echodata::portal_query(dataset_types="GWAS",
                                      phenotypes = c("schizophrenia",
                                                     "parkinson"),
                                      file_types = c("multi_finemap","LD"),
                                      loci = c("BST1","CHRNB1","LRRK2"),
                                      LD_panels = "UKB",
                                      results_dir = results_dir)
knitr::kable(utils::head(local_files))
```

| path | mode | type | sha | size | url | link | link_raw | file_type | dataset_type | dataset | locus | path_local |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| www/data/GWAS/Nalls23andMe_2019/BST1/multi_finemap/BST1.UKB.multi_finemap.csv.gz | 100644 | blob | fcb1d95f114260462530b77a7cb04de6f8ddb3dd | 224076 | <https://api.github.com/repos/RajLabMSSM/Fine_Mapping_Shiny/git/blobs/fcb1d95f114260462530b77a7cb04de6f8ddb3dd> | <https://github.com/RajLabMSSM/Fine_Mapping_Shiny/blob/master/www/data/GWAS/Nalls23andMe_2019/BST1/multi_finemap/BST1.UKB.multi_finemap.csv.gz> | <https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/BST1/multi_finemap/BST1.UKB.multi_finemap.csv.gz> | multi_finemap | GWAS | Nalls23andMe_2019 | BST1 | /tmp/Rtmpp2Jafz/data/GWAS/Nalls23andMe_2019/BST1/multi_finemap/BST1.UKB.multi_finemap.csv.gz |
| www/data/GWAS/Nalls23andMe_2019/CHRNB1/multi_finemap/CHRNB1.UKB.multi_finemap.csv.gz | 100644 | blob | e08d555ec3d3d409c15f1518955db402c95cc92e | 206438 | <https://api.github.com/repos/RajLabMSSM/Fine_Mapping_Shiny/git/blobs/e08d555ec3d3d409c15f1518955db402c95cc92e> | <https://github.com/RajLabMSSM/Fine_Mapping_Shiny/blob/master/www/data/GWAS/Nalls23andMe_2019/CHRNB1/multi_finemap/CHRNB1.UKB.multi_finemap.csv.gz> | <https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/CHRNB1/multi_finemap/CHRNB1.UKB.multi_finemap.csv.gz> | multi_finemap | GWAS | Nalls23andMe_2019 | CHRNB1 | /tmp/Rtmpp2Jafz/data/GWAS/Nalls23andMe_2019/CHRNB1/multi_finemap/CHRNB1.UKB.multi_finemap.csv.gz |
| www/data/GWAS/Nalls23andMe_2019/LRRK2/multi_finemap/LRRK2.UKB.multi_finemap.csv.gz | 100644 | blob | 5076ae9d6ce536a3e80e8789975faa31dfc95191 | 137919 | <https://api.github.com/repos/RajLabMSSM/Fine_Mapping_Shiny/git/blobs/5076ae9d6ce536a3e80e8789975faa31dfc95191> | <https://github.com/RajLabMSSM/Fine_Mapping_Shiny/blob/master/www/data/GWAS/Nalls23andMe_2019/LRRK2/multi_finemap/LRRK2.UKB.multi_finemap.csv.gz> | <https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/LRRK2/multi_finemap/LRRK2.UKB.multi_finemap.csv.gz> | multi_finemap | GWAS | Nalls23andMe_2019 | LRRK2 | /tmp/Rtmpp2Jafz/data/GWAS/Nalls23andMe_2019/LRRK2/multi_finemap/LRRK2.UKB.multi_finemap.csv.gz |
| www/data/GWAS/Nalls23andMe_2019/BST1/LD/BST1.UKB.LD.csv.gz | 100644 | blob | e7c92d2b9b41d30f454db315acb301be54fd7137 | 98471 | <https://api.github.com/repos/RajLabMSSM/Fine_Mapping_Shiny/git/blobs/e7c92d2b9b41d30f454db315acb301be54fd7137> | <https://github.com/RajLabMSSM/Fine_Mapping_Shiny/blob/master/www/data/GWAS/Nalls23andMe_2019/BST1/LD/BST1.UKB.LD.csv.gz> | <https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/BST1/LD/BST1.UKB.LD.csv.gz> | LD | GWAS | Nalls23andMe_2019 | BST1 | /tmp/Rtmpp2Jafz/data/GWAS/Nalls23andMe_2019/BST1/LD/BST1.UKB.LD.csv.gz |
| www/data/GWAS/Nalls23andMe_2019/CHRNB1/LD/CHRNB1.UKB.LD.csv.gz | 100644 | blob | 198a136e32bd47cd3b5d2927329b29cbc2b052ef | 90115 | <https://api.github.com/repos/RajLabMSSM/Fine_Mapping_Shiny/git/blobs/198a136e32bd47cd3b5d2927329b29cbc2b052ef> | <https://github.com/RajLabMSSM/Fine_Mapping_Shiny/blob/master/www/data/GWAS/Nalls23andMe_2019/CHRNB1/LD/CHRNB1.UKB.LD.csv.gz> | <https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/CHRNB1/LD/CHRNB1.UKB.LD.csv.gz> | LD | GWAS | Nalls23andMe_2019 | CHRNB1 | /tmp/Rtmpp2Jafz/data/GWAS/Nalls23andMe_2019/CHRNB1/LD/CHRNB1.UKB.LD.csv.gz |
| www/data/GWAS/Nalls23andMe_2019/LRRK2/LD/LRRK2.UKB.LD.csv.gz | 100644 | blob | e55f05b6eab492d0cada8466a5d706bdefd48958 | 91751 | <https://api.github.com/repos/RajLabMSSM/Fine_Mapping_Shiny/git/blobs/e55f05b6eab492d0cada8466a5d706bdefd48958> | <https://github.com/RajLabMSSM/Fine_Mapping_Shiny/blob/master/www/data/GWAS/Nalls23andMe_2019/LRRK2/LD/LRRK2.UKB.LD.csv.gz> | <https://raw.githubusercontent.com/RajLabMSSM/Fine_Mapping_Shiny/master/www/data/GWAS/Nalls23andMe_2019/LRRK2/LD/LRRK2.UKB.LD.csv.gz> | LD | GWAS | Nalls23andMe_2019 | LRRK2 | /tmp/Rtmpp2Jafz/data/GWAS/Nalls23andMe_2019/LRRK2/LD/LRRK2.UKB.LD.csv.gz |

#### Merge fine-mapping results

Next, we can gather all of the fine-mapping results generated by
`finemap_loci()` previously. `merge_finemapping_results` recursively
searches for the correct files within a hierarchical folder structure
and imports only the multi-finemap files.

``` r

merged_DT <- echodata::merge_finemapping_results(dataset = results_dir,
                                                 minimum_support = 0,
                                                 include_leadSNPs = TRUE,
                                                 consensus_thresh = 2)
echodata::results_report(merged_DT)
```

``` r

knitr::kable(utils::head(merged_DT))
```

| Dataset | Locus | SNP | CHR | POS | P | Effect | StdErr | A1 | A2 | Freq | MAF | N_cases | N_controls | proportion_cases | N | t_stat | leadSNP | ABF.CS | ABF.PP | SUSIE.CS | SUSIE.PP | POLYFUN_SUSIE.CS | POLYFUN_SUSIE.PP | FINEMAP.CS | FINEMAP.PP | Support | Consensus_SNP | mean.PP | mean.CS | Mb |
|:---|:---|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|---:|---:|---:|---:|---:|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|:---|---:|---:|---:|
| Nalls23andMe_2019 | BST1 | rs4541502 | 4 | 15712787 | 0 | -0.0897 | 0.0093 | T | G | 0.4749 | 0.4749 | 56306 | 1417791 | 0.0382 | 216621 | -9.645161 | FALSE | NA | NA | 2 | 1 | 2 | 1 | 1 | 1 | 3 | TRUE | 0.75 | 0 | 15.712787 |
| Nalls23andMe_2019 | CHRNB1 | rs12600861 | 17 | 7355621 | 0 | -0.0565 | 0.0099 | A | C | 0.6484 | 0.3516 | 56306 | 1417791 | 0.0382 | 216621 | -5.707071 | TRUE | NA | NA | 3 | 1 | 2 | 1 | 1 | 1 | 3 | TRUE | 0.75 | 0 | 7.355621 |
| Nalls23andMe_2019 | LRRK2 | rs7294619 | 12 | 40617202 | 0 | -0.1276 | 0.0140 | T | C | 0.8783 | 0.1217 | 56306 | 1417791 | 0.0382 | 216621 | -9.114286 | FALSE | NA | NA | 2 | 1 | 2 | 1 | 1 | 1 | 3 | TRUE | 0.75 | 0 | 40.617202 |
| Nalls23andMe_2019 | LRRK2 | rs76904798 | 12 | 40614434 | 0 | 0.1439 | 0.0130 | T | C | 0.1444 | 0.1444 | 56306 | 1417791 | 0.0382 | 216621 | 11.069231 | TRUE | NA | NA | 1 | 1 | 1 | 1 | 1 | 1 | 3 | TRUE | 0.75 | 0 | 40.614434 |
| Nalls23andMe_2019 | BST1 | rs34559912 | 4 | 15730146 | 0 | 0.1030 | 0.0095 | T | G | 0.5526 | 0.4474 | 56306 | 1417791 | 0.0382 | 216621 | 10.842105 | FALSE | NA | NA | 3 | 1 | 3 | 1 | NA | NA | 2 | TRUE | 0.50 | 0 | 15.730146 |
| Nalls23andMe_2019 | BST1 | rs4389574 | 4 | 15730398 | 0 | -0.0977 | 0.0116 | A | G | 0.4443 | 0.4443 | 42598 | 1322509 | 0.0312 | 165075 | -8.422414 | FALSE | NA | NA | 1 | 1 | 1 | 1 | NA | NA | 2 | TRUE | 0.50 | 0 | 15.730398 |

### Import LD

Next, we import the a subset of the LD matrices for only the lead SNP.

``` r

ld_files <- local_files[file_type=="LD",]
ld_matrices <- lapply(stats::setNames(ld_files$path_local,
                                      ld_files$locus),
                      function(x){
  data.table::fread(x)
})
knitr::kable(utils::head(ld_matrices[[1]]))
```

| SNP         |  rs4698412 | rs4698412.1 |
|:------------|-----------:|------------:|
| rs61337515  |  0.0022108 |   0.0022108 |
| rs58950976  |  0.0149364 |   0.0149364 |
| rs13152654  | -0.0047314 |  -0.0047314 |
| rs13103770  | -0.0037451 |  -0.0037451 |
| rs6837632   |  0.0061673 |   0.0061673 |
| rs114563990 | -0.0004498 |  -0.0004498 |

## Session Info

``` r

utils::sessionInfo()
```

    ## R Under development (unstable) (2026-03-12 r89607)
    ## Platform: x86_64-pc-linux-gnu
    ## Running under: Ubuntu 24.04.4 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
    ## LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.26.so;  LAPACK version 3.12.0
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## time zone: UTC
    ## tzcode source: system (glibc)
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] echodata_1.0.0   BiocStyle_2.39.0
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] gtable_0.3.6        httr2_1.2.2         xfun_0.56          
    ##  [4] bslib_0.10.0        ggplot2_4.0.2       htmlwidgets_1.6.4  
    ##  [7] gh_1.5.0            tzdb_0.5.0          vctrs_0.7.1        
    ## [10] tools_4.6.0         bitops_1.0-9        generics_0.1.4     
    ## [13] yulab.utils_0.2.4   curl_7.0.0          parallel_4.6.0     
    ## [16] tibble_3.3.1        pkgconfig_2.0.3     R.oo_1.27.1        
    ## [19] data.table_1.18.2.1 RColorBrewer_1.1-3  S7_0.2.1           
    ## [22] desc_1.4.3          lifecycle_1.0.5     stringr_1.6.0      
    ## [25] compiler_4.6.0      farver_2.1.2        dlstats_0.1.7      
    ## [28] textshaping_1.0.5   htmltools_0.5.9     sass_0.4.10        
    ## [31] RCurl_1.98-1.17     yaml_2.3.12         pillar_1.11.1      
    ## [34] pkgdown_2.2.0       jquerylib_0.1.4     tidyr_1.3.2        
    ## [37] R.utils_2.13.0      DT_0.34.0           cachem_1.1.0       
    ## [40] tidyselect_1.2.1    zip_2.3.3           digest_0.6.39      
    ## [43] stringi_1.8.7       dplyr_1.2.0         purrr_1.2.1        
    ## [46] bookdown_0.46       rprojroot_2.1.1     fastmap_1.2.0      
    ## [49] grid_4.6.0          here_1.0.2          cli_3.6.5          
    ## [52] magrittr_2.0.4      piggyback_0.1.5     withr_3.0.2        
    ## [55] readr_2.2.0         rappdirs_0.3.4      scales_1.4.0       
    ## [58] rmarkdown_2.30      gitcreds_0.1.2      rvcheck_0.2.1      
    ## [61] otel_0.2.0          ragg_1.5.1          R.methodsS3_1.8.2  
    ## [64] hms_1.1.4           openxlsx_4.2.8.1    memoise_2.0.1      
    ## [67] evaluate_1.0.5      echogithub_1.0.0    knitr_1.51         
    ## [70] rworkflows_1.0.8    rlang_1.1.7         Rcpp_1.1.1         
    ## [73] glue_1.8.0          renv_1.1.8          BiocManager_1.30.27
    ## [76] jsonlite_2.0.0      R6_2.6.1            badger_0.2.5       
    ## [79] systemfonts_1.3.2   fs_1.6.7
