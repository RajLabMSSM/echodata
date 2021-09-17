test_that("portal_query works", {
  
    local_finemap <- echodata::portal_query(
        dataset_types = "GWAS",
        phenotypes = c("schizophrenia", "parkinson"),
        file_types = "multi_finemap",
        loci = c("BST1", "CHRNB1", "LRRK2"),
        LD_panels = "1KGphase3"
    )
    testthat::expect_true(all(file.exists(local_finemap)))
    testthat::expect_length(local_finemap, 3)
})
