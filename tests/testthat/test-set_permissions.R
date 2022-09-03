test_that("set_permissions works", {
  
    tmp <-  echodata::example_fullSS() 
    set_permissions(path = tmp)
    testthat::expect_true(file.exists(tmp))
    testthat::expect_true(file.remove(tmp))
})
