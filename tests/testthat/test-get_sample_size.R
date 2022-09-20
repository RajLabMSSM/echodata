test_that("get_sample_size works", {
  
    dat <- echodata::BST1
    
    #### defalts ####
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
                                      return_only = max, 
                                      na.rm=TRUE)
    testthat::expect_equal(dat7, 108310)
    #### compute_n: metal ####
    dat8 <- echodata::get_sample_size(dat = dat,
                                      compute_n = "metal",
                                      return_only = max,
                                      na.rm=TRUE)
    testthat::expect_equal(dat8, 216621)
    #### compute_n: sum ####
    dat9 <- echodata::get_sample_size(dat = dat,
                                      compute_n = "sum",
                                      return_only = max,
                                      na.rm=TRUE)
    testthat::expect_equal(dat9, 1474097)
    #### compute_n: number ####
    dat10 <- echodata::get_sample_size(dat = dat,
                                       compute_n = 10000,
                                       return_only = max,
                                       na.rm=TRUE)
    testthat::expect_equal(dat10, 10000)
    #### compute_n: vector of numbers (correct length) ####
    compute_n_vec <- rep(c(10000,10010),nrow(dat)/2)
    dat11 <- echodata::get_sample_size(dat = dat,
                                       compute_n = compute_n_vec, 
                                       na.rm=TRUE)
    testthat::expect_equal(dat11$N, compute_n_vec)
    
    #### compute_n: vector of numbers (correct length) ####
    testthat::expect_error(
        dat12 <- echodata::get_sample_size(dat = dat,
                                           compute_n = rep(10000,nrow(dat)-10),
                                           return_only = max,
                                           na.rm=TRUE)
    ) 
})
