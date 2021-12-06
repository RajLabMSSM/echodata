test_that("multiplication works", {
  
    dat <- echodata::BST1
    
    
    dat2 <- echodata::filter_snps(dat = dat)
    testthat::expect_equal(nrow(dat2), 2913)
    
    
    dat3 <- echodata::filter_snps(dat = dat, 
                                  bp_distance = 5e+08)
    testthat::expect_equal(nrow(dat3), 6216)
    
    dat4 <- echodata::filter_snps(dat = dat, 
                                  remove_variants = dat$SNP[seq_len(5)])
    testthat::expect_equal(nrow(dat4), 2908)
    
    
    dat_lrrk2 <- echodata::LRRK2
    
    dat5 <- echodata::filter_snps(dat = dat, 
                                  min_POS = min(dat$POS)+500, 
                                  max_POS = max(dat$POS)-500)
    testthat::expect_equal(nrow(dat5), 2913)
    
    dat6 <- echodata::filter_snps(dat = dat,  
                                  trim_gene_limits = "BST1")
    testthat::expect_equal(nrow(dat6), 1610)
    
    dat7 <- echodata::filter_snps(dat = dat,  
                                  trim_gene_limits = "LRRK2")
    testthat::expect_equal(nrow(dat7), 0)
    
    dat8 <- echodata::filter_snps(dat = dat,  
                                  trim_gene_limits = "BST1",
                                  min_POS = min(dat$POS), 
                                  max_POS = max(dat$POS))
    testthat::expect_equal(nrow(dat8), 1727)
})
