test_that("example_fullSS works", {
  
    #### Nalls2019 #### 
    fullSS_Nalls2019 <- echodata::example_fullSS(dataset = "Nalls2019")
    testthat::expect_type(fullSS_Nalls2019, "character")
    testthat::expect_true(file.exists(fullSS_Nalls2019))
    #### Kunkle2019 #### 
    fullSS_Kunkle2019 <- echodata::example_fullSS(dataset = "Kunkle2019")
    testthat::expect_type(fullSS_Kunkle2019, "character")
    testthat::expect_true(file.exists(fullSS_Kunkle2019))
})
