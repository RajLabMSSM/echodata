test_that("fillNA_CS_PP works", {
    
    dat <- echodata::BST1
    dat[seq_len(5),"FINEMAP.CS"] <- NA
    dat[seq_len(10),"FINEMAP.PP"] <- NA
    
    dat2 <- echodata::fillNA_CS_PP(dat = dat)
    testthat::expect_true(sum(is.na(dat$FINEMAP.CS))==5)
    testthat::expect_true(sum(is.na(dat2$FINEMAP.CS))==0)
    testthat::expect_true(sum(is.na(dat$FINEMAP.PP))==10)
    testthat::expect_true(sum(is.na(dat2$FINEMAP.PP))==0)
})
