test_that("createDT works", {
  
    dat = utils::head(echodata::BST1)
    dt <- echodata::createDT(dat = dat)
    testthat::expect_true(methods::is(dt,"datatables"))
    testthat::expect_equal(nrow(dt$x$data), 
                           nrow(dat))
    testthat::expect_equal(ncol(dt$x$data)-1, 
                           ncol(dat))
})
