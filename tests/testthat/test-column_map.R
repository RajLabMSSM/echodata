test_that("column_map works", {
    
    colmap1 <- echodata:::column_map(package = "mungesumstats")
    testthat::expect_length(colmap1, 13)
    
    colmap2 <- echodata:::column_map(package = "echolocatoR")
    testthat::expect_length(colmap2, 15)
})
