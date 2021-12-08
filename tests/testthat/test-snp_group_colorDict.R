test_that("snp_group_colorDict works", {
  
    colorDict <- echodata::snp_group_colorDict()
    testthat::expect_gte(length(colorDict), 18)
})
