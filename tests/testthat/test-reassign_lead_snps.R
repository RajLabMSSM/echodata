test_that("reassign_lead_snps works", {
  
    merged_dat <- echodata::get_Nalls2019_merged()
    lead_snps1 <- sum(merged_dat$leadSNP)
    merged_dat$leadSNP <- NULL
    merged_dat2 <- echodata::reassign_lead_snps(merged_dat = merged_dat)
    lead_snps2 <- sum(merged_dat2$leadSNP)
    testthat::expect_true(!"leadSNP" %in% colnames(merged_dat))
    testthat::expect_true("leadSNP" %in% colnames(merged_dat2))
    testthat::expect_equal(lead_snps1, lead_snps2)
})
