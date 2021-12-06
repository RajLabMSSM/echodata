test_that("find_consensus_snps works", {
    
    dat <- echodata::BST1
    dat$Consensus_SNP <- NULL
    dat2 <- echodata::find_consensus_snps(dat = dat)
    
    testthat::expect_true(!"Consensus_SNP" %in% colnames(dat))
    testthat::expect_true("Consensus_SNP" %in% colnames(dat2))
})
