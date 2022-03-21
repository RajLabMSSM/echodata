test_that("check_if_empty works", {
  
    #### Non-empty file ####
    tmp1 <- tempfile()
    data.table:::fwrite(echodata::BST1, tmp1)
    testthat::expect_null(echodata::check_if_empty(path = tmp1))
    file.remove(tmp1)
    
    #### Empty file ####
    tmp2 <- tempfile()
    data.table::fwrite(data.table::data.table(), tmp2)
    testthat::expect_error(echodata::check_if_empty(path = tmp2))
    file.remove(tmp2)
})
