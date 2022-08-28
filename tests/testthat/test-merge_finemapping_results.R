test_that("merge_finemapping_results works", {
    
    files <- echodata::get_Nalls2019_loci()
    dataset <- dirname(files[[1]])
    testthat::expect_true(dir.exists(dataset))

    merged_DT <- echodata::merge_finemapping_results(
        dataset = dataset,
        minimum_support = 1
    ) 
    testthat::expect_equal(nrow(merged_DT), 20)
    testthat::expect_true(methods::is(merged_DT, "data.table"))
    testthat::expect_equal(dplyr::n_distinct(merged_DT$Locus), 3)
})
