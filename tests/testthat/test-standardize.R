test_that("standardize works", {
  
    query <- echodata::BST1
    #### Screw up Freq to see if function can fix it and infer MAF ####
    query$rsid <- query$SNP
    query <- data.frame(query)[,!colnames(query) %in% c("MAF","SNP")]
    query[c(10,30,55),"Freq"] <- 0
    query[c(12,22),"Freq"] <- NA

    subset_path <- file.path(tempdir(),"BST1.tsv")
    data.table::fwrite(query, subset_path)
    query <- echodata:: standardize(
        query = query,
        subset_path = subset_path,
        colmap = echodata::construct_colmap(SNP = "rsid"),
        locus = "BST1")
    final_cols <- c('CHR','POS','P','Effect','StdErr',
    'Freq','N_cases','N_controls','proportion_cases',
    'A1','A2','leadSNP',
    'ABF.CS','ABF.PP','SUSIE.CS','SUSIE.PP',
    'POLYFUN_SUSIE.CS','POLYFUN_SUSIE.PP','FINEMAP.CS',
    'FINEMAP.PP','Support','Consensus_SNP',
    'mean.PP','mean.CS','SNP','MAF','tstat')
    testthat::expect_true(all(final_cols %in% colnames(query)))
    
})
