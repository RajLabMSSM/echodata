# echodata 0.99.7 

## New features

* New functions: 
    - `preview`
    - `is_local`
    - `is_url`
* Increased test coverage to >88%.
* Removed `standardise_sumstats_column_headers_crossplatform` to use
directly from `MungeSumstats`. 

## Bug fixes 

* `import_topSNPs`: 
    - Now uses `standardise_sumstats_column_headers_crossplatform`
exported function when `munge=TRUE`. 
    - Both standardisation strategies no longer interfere with one another when used at the same time. 


# echodata 0.99.6

## New features

* Added .zzz file with `.datatable.aware <- TRUE`
* Added new function `merge_robust` to address issues with `data.table`. 
    + See here for Issues: https://github.com/RajLabMSSM/echolocatoR/issues/72#issuecomment-1059423642
* `import_topSNPs`: Added example and documented all params. 
* Rename `MUNGESUMSTATS.*` functions to `mungesumstats_`. 
* `get_sample_size`: Add unit tests and new `return_only` function for min/max.  

# echodata 0.99.5

## New features 

* Added new functions (with unit tests):
    - `snp_group_colorDict` 
    - `read_parquet`
    - `write_parquet`

## Bug fixes

* `reassign_lead_snps`: Handle situations where none of 
the `grouping_vars` are available. 
* Fix error in reporting number of Consensus_SNPs in `find_consensus_snps` 
(only affected console message, not the actual data).  


# echodata 0.99.4

## New features 

* Added new functions (with unit tests):
    - `snp_group_filters`
    - `find_consensus_SNPs`
    - `find_consensus_SNPs_no_PolyFun`
    - `filter_snps` 
    - `limit_SNPs`
    - `gene_trimmer` 
    - `fillNA_CS_PP`
    - `determine_chrom_type`
    - `check_if_empty`
    - `column_dictionary`
    - `get_header`
    - `melt_finemapping_results`
    - `update_cols`
    - `biomart_geneInfo`
    - `find_top_consensus`
    - `dt_to_granges`
    - `is_granges`
    - `is_ggplot`
    - `is_ggbio`
    - `granges_to_bed`
    - `reassign_lead_snps`
    
# echodata 0.99.3

## New features

* Added new function `coords_to_rsids`, copied over from `catalogueR`. 

# echodata 0.99.2

## New features 

* Added a `NEWS.md` file to track changes to the package.
* Added new function `assign_lead_SNP` with unit tests.
* Added unit tests for `createDT` and `MUNGESUMSTATS.*` functions. 
* Removed unused functions. 
* Added dynamic badges to README.

## Bug fixes

* Updated GHA workflow. 
* Added GH token to Secrets. 

# echodata 0.99.0

## New features 

* Large datasets uploaded/downloaded via `piggyback`. 

# echodata 0.99.0

## New features 

* Functions extracted from `echolocatoR` to create `echodata`. 