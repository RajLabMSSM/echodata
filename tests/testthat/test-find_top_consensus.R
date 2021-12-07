test_that("find_top_consensus works", {
  
    dat <- echodata::BST1
    dat2 <- echodata::find_top_consensus(dat = dat)
    testthat::expect_true(!"topConsensus" %in% colnames(dat))
    testthat::expect_true("topConsensus" %in% colnames(dat2))
    testthat::expect_true(is.logical(dat2$topConsensus)) 
    testthat::expect_true(sum(dat2$topConsensus)==1) 
})
