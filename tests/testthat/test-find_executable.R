test_that("find_executable works", {
  
    paths <- find_executable()
    testthat::expect_true(all(unlist(lapply(paths, file.exists))))
})
