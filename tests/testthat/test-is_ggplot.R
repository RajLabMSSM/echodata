test_that("is_ggplot works", {
    
    testthat::expect_false(echodata::is_ggplot(mtcars))
    testthat::expect_true(echodata::is_ggplot( ggplot2::ggplot()))
})
