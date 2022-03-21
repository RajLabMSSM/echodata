test_that("column_dictionary works", {
  
    tmp <- tempfile()
    dat <- echodata::BST1
    data.table::fwrite(dat, tmp)
    cdict <- echodata::column_dictionary(path = tmp) 
    testthat::expect_true(all.equal(names(cdict), colnames(dat)))
})
