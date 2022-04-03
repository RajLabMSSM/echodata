test_that("standardize works", {
  
    dat <- echodata::BST1
    #### Screw up Freq to see if function can fix it and infer MAF ####
    dat$rsid <- dat$SNP
    dat <- data.frame(dat)[,!colnames(dat) %in% c("MAF","SNP")]
    dat[c(10,30,55),"Freq"] <- 0
    dat[c(12,22),"Freq"] <- NA
    subset_path <- file.path(tempdir(),"BST1.tsv")
    data.table::fwrite(dat, subset_path)
    
    query <- echodata::standardize(
        query = dat,
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
