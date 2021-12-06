test_that("snp_group_filters works", {
  
    filts <- echodata::snp_group_filters()
    testthat::expect_length(filts, 18)
    testthat::expect_true(methods::is(filts,"character"))
})
