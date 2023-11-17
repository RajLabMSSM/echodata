test_that("dt_to_granges works", {
  
    dat <-  echodata::BST1
    gr <- echodata::dt_to_granges(dat = dat)
    testthat::expect_true(methods::is(gr,"GRanges"))
    testthat::expect_equal(length(gr), nrow(dat))
    testthat::expect_true(
        all.equal(
            colnames(GenomicRanges::mcols(gr)),
            colnames(dat)[!colnames(dat)%in% c("CHR","POS")]
            )
        )
    
    #### When already a GR ####
    gr2 <- echodata::dt_to_granges(dat = gr)
    testthat::expect_true(methods::is(gr2,"GRanges"))
    testthat::expect_equal(length(gr2), nrow(dat))
    testthat::expect_true(
      all.equal(
        colnames(GenomicRanges::mcols(gr2)),
        colnames(dat)[!colnames(dat)%in% c("CHR","POS")]
      )
    ) 
})
