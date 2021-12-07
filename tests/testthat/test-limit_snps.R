test_that("limit_snps works", {
  
    dat <- echodata::BST1
    max_snps <- 500
    dat2 <- echodata::limit_snps(dat = dat,
                                 max_snps = max_snps)
    testthat::expect_equal(nrow(dat2), max_snps)
    testthat::expect_lte(nrow(dat2), nrow(dat))
})
