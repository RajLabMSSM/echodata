test_that("MUNGESUMSTATS functions work", {
  
    #### MUNGESUMSTATS.col_map ####
    col_map <- echodata:::MUNGESUMSTATS.col_map()
    testthat::expect_length(col_map, 13)
    testthat::expect_true(methods::is(col_map,"list"))
    
    #### MUNGESUMSTATS.col_map ####
    dat <- echodata::BST1
    dat <- dplyr::rename(dat, pval = P)
    dat2 <- echodata:::MUNGESUMSTATS.check_syn(dat = dat,
                                               col_name = "pval")
    testthat::expect_true(!"P" %in% colnames(dat))
    testthat::expect_true("P" %in% colnames(dat2))
    
    
    #### MUNGESUMSTATS.to_echolocatoR ####
    # eduAttainOkbayPth <- system.file("extdata","eduAttainOkbay.txt",
    #                                  package="MungeSumstats")
    # reformatted <- MungeSumstats::format_sumstats(path=eduAttainOkbayPth,
    #                                               ref_genome="GRCh37",
    #                                               return_data = TRUE)
    dat <- echodata::BST1
    dat_mss <- dplyr::rename(dat, BP=POS, FRQ=Freq, BETA=Effect)
    dat_echoR <- echodata::MUNGESUMSTATS.to_echolocatoR(dat=dat)
    testthat::expect_true(all(c("POS","Freq","Effect") %in% colnames(dat)))
    testthat::expect_true(!all(c("POS","Freq","Effect") %in% colnames(dat_mss)))
    testthat::expect_true(all(c("POS","Freq","Effect") %in% colnames(dat_echoR)))
    
})
