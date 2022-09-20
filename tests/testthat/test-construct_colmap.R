test_that("construct_colmap works", {
    
    fields <- c("munged","CHR","POS","SNP",
                "P","Effect","StdErr","tstat",
                "Locus","Freq","MAF","A1","A2",
                "Gene","N_cases","N_controls",
                "proportion_cases","N_col","verbose")
    colmap <- construct_colmap(munged=TRUE)
    testthat::expect_true(all(fields %in% names(colmap)))
    
    colmap <- construct_colmap(munged=TRUE, N_col = "N_cases")
    testthat::expect_true(all(fields %in% names(colmap)))
    testthat::expect_equal(colmap$N_col, "N")
})
