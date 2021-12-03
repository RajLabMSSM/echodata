test_that("coords_to_rsids works", {
  
    dat <- dplyr::rename(echodata::BST1, SNP_old=SNP)
    dat_annot <- echodata::coords_to_rsids(dat = dat,
                                           snp_colname = "SNP")
    
    testthat::expect_true(methods::is(dat_annot,"data.table"))
    testthat::expect_true(!"SNP" %in% colnames(dat))
    testthat::expect_true("SNP" %in% colnames(dat_annot))
    #### Expect >95% matches ####
    testthat::expect_gte(
        sum(dat_annot$SNP_old==dat_annot$SNP)/nrow(dat_annot),
        .95)
    
    testthat::expect_error(
      echodata::coords_to_rsids(dat = dat_annot,
                                snp_colname = "SNP")
    )
})
