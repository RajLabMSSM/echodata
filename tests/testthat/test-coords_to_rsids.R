test_that("coords_to_rsids works", {
  
    dat <- echodata::BST1[seq(5),]
    data.table::setnames(dat,"SNP","SNP_old")
    dat_annot <- suppressWarnings(
       coords_to_rsids(dat = dat,
                       SNPname = "SNP")
    )
    testthat::expect_true(methods::is(dat_annot,"data.table"))
    testthat::expect_true(!"SNP" %in% colnames(dat))
    testthat::expect_true("SNP" %in% colnames(dat_annot))
    #### Expect >95% matches ####
    testthat::expect_gte(
        sum(dat_annot$SNP_old==dat_annot$SNP)/nrow(dat_annot),
        .95)
    
    testthat::expect_error(
      echodata::coords_to_rsids(dat = dat_annot,
                                SNPname = "SNP")
    )
})
