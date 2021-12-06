test_that("find_consensus_snps_no_polyfun works", {
    
    dat <- echodata::BST1
    dat2 <- echodata::find_consensus_snps_no_polyfun(dat = dat)
    
    testthat::expect_true(!"Consensus_SNP_noPF" %in% colnames(dat))
    testthat::expect_true("Consensus_SNP_noPF" %in% colnames(dat2))
    testthat::expect_lte(sum(dat2$Consensus_SNP_noPF),
                         sum(dat2$Consensus_SNP))
})
