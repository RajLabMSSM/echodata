test_that("merge_robust works", {
  
    dat <- echodata::BST1
    x <- dat[,c("SNP","CHR","POS")]
    y <- dat[,c("SNP","Support","leadSNP")]
    z <- merge_robust(x=x, y=y, by="SNP")
    testthat::expect_true(sum(duplicated(z$SNP))==0)
    testthat::expect_true(is.character(z$SNP))
    testthat::expect_true(sum(is.na(z$Support))==0)
    
    #### 1 NA####
    y$Support[1] <- NA
    z <- merge_robust(x=x, y=y, by="SNP")
    testthat::expect_true(sum(is.na(z$Support))==1) 
    
    #### All NAs ####
    y$Support <- NA
    z <- merge_robust(x=x, y=y, by="SNP")
    testthat::expect_true(sum(!is.na(z$Support))==0) 
})
