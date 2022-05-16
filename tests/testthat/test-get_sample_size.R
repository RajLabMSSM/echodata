test_that("get_sample_size works", {
  
    dat <- echodata::BST1
    
    dat2 <- echodata::get_sample_size(dat = dat)
    testthat::expect_equal(nrow(dat2),nrow(dat))
    testthat::expect_false("N" %in% colnames(dat))
    testthat::expect_true("N" %in% colnames(dat2))
    
    #### Return only: max ####
    dat3 <- echodata::get_sample_size(dat = dat, 
                                      return_only = max)
    testthat::expect_equal(dat3, max(dat2$N))
    #### Return only: min ####
    dat4 <- echodata::get_sample_size(dat = dat, 
                                      return_only = min)
    testthat::expect_equal(dat4, min(dat2$N))
    #### Return only: min with NA ####
    dat$N_cases[1] <- NA
    dat5 <- echodata::get_sample_size(dat = dat, 
                                      return_only = min)
    testthat::expect_true(is.na(dat5))
    #### Return only: min without NA #### 
    dat6 <- echodata::get_sample_size(dat = dat, 
                                      return_only = min, 
                                      na.rm=TRUE)
    testthat::expect_equal(dat6, min(dat2$N))
    
    #### compute_n: giant ####
    dat7 <- echodata::get_sample_size(dat = dat,
                                      compute_n = "giant",
                                      return_only = max)
    testthat::expect_equal(dat7, 108310)
    #### compute_n: metal ####
    dat8 <- echodata::get_sample_size(dat = dat,
                                      compute_n = "metal",
                                      return_only = max)
    testthat::expect_equal(dat8, 216621)
    #### compute_n: sum ####
    dat9 <- echodata::get_sample_size(dat = dat,
                                      compute_n = "sum",
                                      return_only = max)
    testthat::expect_equal(dat9, 1474097)
    #### compute_n: number ####
    dat10 <- echodata:: get_sample_size(dat = dat,
                                      compute_n = 10000,
                                      return_only = max)
    testthat::expect_equal(dat9, 1474097)
    
})
