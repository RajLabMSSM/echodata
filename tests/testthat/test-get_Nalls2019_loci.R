test_that("get_Nalls2019_loci works", {
  
    files <- echodata::get_Nalls2019_loci()
    testthat::expect_length(files,3)
    testthat::expect_true(
        all(file.exists(unlist(files)))
    )
})
