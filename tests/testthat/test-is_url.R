test_that("is_url works", {
  
    
    fileName <- "https://github.com/RajLabMSSM/echolocatoR/raw/master/NEWS.md"
    testthat::expect_true(is_url(fileName=fileName))

    fileName <- "://github.com/RajLabMSSM/echolocatoR/raw/master/NEWS.md"    
    testthat::expect_false(is_url(fileName=fileName))
})
