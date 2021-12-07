# echodata 0.99.4

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