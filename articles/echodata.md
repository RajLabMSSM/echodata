# echodata: Getting Started

``` r

library(echodata)
has_internet <- curl::has_internet()
```

## Example full SS

Example full GWAS summary statistics.

### Nalls 2019

Parkinson’s Disease GWAS from [Nalls et al.,
2019](https://doi.org/10.1016/S1474-4422(19)30320-5).

``` r

fullSS_Nalls2019 <- echodata::example_fullSS(dataset = "Nalls2019")
```

    ## Writing file to ==> /tmp/RtmpK6ipbh/nalls2019.fullSS_subset.tsv

### Kunkle 2019

Alzheimer’s Disease GWAS from [Kunkle et al.,
2019](https://www.nature.com/articles/s41588-019-0358-2).

``` r

fullSS_Kunkle2019 <- echodata::example_fullSS(dataset = "Kunkle2019")
```

    ## Writing file to ==> /tmp/RtmpK6ipbh/kunkle2019.fullSS_subset.tsv

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
    ##  [1] sass_0.4.10         generics_0.1.4      tidyr_1.3.2        
    ##  [4] stringi_1.8.7       hms_1.1.4           digest_0.6.39      
    ##  [7] magrittr_2.0.4      evaluate_1.0.5      bookdown_0.46      
    ## [10] fastmap_1.2.0       R.oo_1.27.1         jsonlite_2.0.0     
    ## [13] R.utils_2.13.0      zip_2.3.3           BiocManager_1.30.27
    ## [16] purrr_1.2.1         textshaping_1.0.5   jquerylib_0.1.4    
    ## [19] cli_3.6.5           rlang_1.1.7         R.methodsS3_1.8.2  
    ## [22] cachem_1.1.0        yaml_2.3.12         otel_0.2.0         
    ## [25] tools_4.6.0         parallel_4.6.0      tzdb_0.5.0         
    ## [28] memoise_2.0.1       dplyr_1.2.0         DT_0.34.0          
    ## [31] curl_7.0.0          vctrs_0.7.1         R6_2.6.1           
    ## [34] lifecycle_1.0.5     fs_1.6.7            htmlwidgets_1.6.4  
    ## [37] ragg_1.5.1          pkgconfig_2.0.3     desc_1.4.3         
    ## [40] pkgdown_2.2.0       pillar_1.11.1       bslib_0.10.0       
    ## [43] openxlsx_4.2.8.1    data.table_1.18.2.1 glue_1.8.0         
    ## [46] Rcpp_1.1.1          systemfonts_1.3.2   xfun_0.56          
    ## [49] tibble_3.3.1        tidyselect_1.2.1    knitr_1.51         
    ## [52] htmltools_0.5.9     rmarkdown_2.30      piggyback_0.1.5    
    ## [55] readr_2.2.0         compiler_4.6.0
