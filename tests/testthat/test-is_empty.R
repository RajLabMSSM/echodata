test_that("is_empty works", {
  
    #### Non-empty file ####
    tmp1 <- tempfile()
    data.table:::fwrite(echodata::BST1, tmp1)
    testthat::expect_false(echodata::is_empty(path = tmp1))
    file.remove(tmp1)
    
    #### Empty file ####
    tmp2 <- tempfile()
    testthat::expect_warning(
        data.table::fwrite(data.table::data.table(), tmp2)
    )
   testthat::expect_warning(
       testthat::expect_error(
           echodata::is_empty(path = tmp2)
       )
   )
    testthat::expect_warning(
        testthat::expect_true(
            echodata::is_empty(path = tmp2, 
                               error = FALSE)
        )
    )
    file.remove(tmp2)
})
