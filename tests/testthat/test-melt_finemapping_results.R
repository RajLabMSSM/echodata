test_that("melt_finemapping_results works", {
    
    dat <- echodata::BST1 
    finemap_melt <- echodata::melt_finemapping_results(dat = dat)
    
    CS_cols <- grep("*.CS",colnames(dat), value = TRUE)
    PP_cols <- grep("*.PP",colnames(dat), value = TRUE)
    testthat::expect_equal(length(CS_cols), 
                           length(unique(finemap_melt$Method)))
    testthat::expect_equal(length(PP_cols), 
                           length(unique(finemap_melt$Method)))
    testthat::expect_true(is.numeric(finemap_melt$CS))
    testthat::expect_true(is.numeric(finemap_melt$PP))
})
