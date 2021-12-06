test_that("update_cols works", {
    
    dat <- echodata::BST1
    colnames(dat) <- gsub(".CS","\\.Credible_Set",colnames(dat)) 
    colnames(dat) <- gsub(".PP","\\.Probability",colnames(dat)) 
    dat2 <- echodata::update_cols(dat = dat)
    testthat::expect_true("mean.Probability" %in% colnames(dat))
    testthat::expect_true(!"mean.Probability" %in% colnames(dat2))
    testthat::expect_true("mean.PP" %in% colnames(dat2))
})
