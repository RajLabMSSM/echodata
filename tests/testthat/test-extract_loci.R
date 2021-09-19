test_that("extract_loci works", {
    
    Kunkle2019_loci <- extract_loci(topSNPs = echodata::topSNPs_Kunkle2019,
                                    fullSS = get_Kunkle2019())
    testthat::expect_true(methods::is(Kunkle2019_loci,"data.table"))
    testthat::expect_gte(nrow(Kunkle2019_loci),500)
})
