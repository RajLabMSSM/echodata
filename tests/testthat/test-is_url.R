test_that("is_url works", {
  
    
    path <- "https://github.com/RajLabMSSM/echolocatoR/raw/master/NEWS.md"
    testthat::expect_true(is_url(path=path))

    path <- "://github.com/RajLabMSSM/echolocatoR/raw/master/NEWS.md"    
    testthat::expect_false(is_url(path=path))
})
