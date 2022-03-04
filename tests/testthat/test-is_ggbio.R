test_that("is_ggbio works", {
    
    testthat::expect_false(echodata::is_ggbio(mtcars))
    testthat::expect_false(echodata::is_ggbio( ggplot2::ggplot())) 
})
