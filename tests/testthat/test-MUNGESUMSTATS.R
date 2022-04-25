test_that("MungeSumstats functions work", { 
    
    #### mungesumstats_check_syn ####
    dat <- echodata::BST1
    dat <- dplyr::rename(dat, pval = P)
    dat2 <- echodata:::mungesumstats_check_syn(dat = dat,
                                               col_name = "pval")
    testthat::expect_true(!"P" %in% colnames(dat))
    testthat::expect_true("P" %in% colnames(dat2))
    
    #### mungesumstats_to_echolocatoR ####
    # eduAttainOkbayPth <- system.file("extdata","eduAttainOkbay.txt",
    #                                  package="MungeSumstats")
    # reformatted <- MungeSumstats::format_sumstats(path=eduAttainOkbayPth,
    #                                               ref_genome="GRCh37",
    #                                               return_data = TRUE)
    dat <- echodata::BST1
    dat_mss <- dplyr::rename(dat, BP=POS, FRQ=Freq, BETA=Effect)
    dat_echoR <- echodata::mungesumstats_to_echolocatoR(dat=dat)
    testthat::expect_true(all(c("POS","Freq","Effect") %in% colnames(dat)))
    testthat::expect_true(!all(c("POS","Freq","Effect") %in% colnames(dat_mss)))
    testthat::expect_true(all(c("POS","Freq","Effect") %in% colnames(dat_echoR)))
})
