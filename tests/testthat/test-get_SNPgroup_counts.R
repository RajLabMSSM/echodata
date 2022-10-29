test_that("get_SNPgroup_counts works", {

    merged_DT <- echodata::get_Nalls2019_merged()
    snp_groups <- get_SNPgroup_counts(merged_DT = merged_DT)
    testthat::expect_equal(
        names(snp_groups),
        c("snp_groups","locus_summary","consensus_summary"))
})
