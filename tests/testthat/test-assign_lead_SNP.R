test_that("assign_lead_SNP works", {
    
    dat <- echodata::BST1
    dat$leadSNP <- NULL
    
    dat2 <- echodata::assign_lead_SNP(dat = dat)
    testthat::expect_true(methods::is(dat2,"data.table"))
    testthat::expect_false("leadSNP" %in% colnames(dat))
    testthat::expect_true("leadSNP" %in% colnames(dat2))
    testthat::expect_equal(sum(dat2$leadSNP), 1)
})
