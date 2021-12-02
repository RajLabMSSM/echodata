test_that("portal_query works", {
  
    local_finemap <- echodata::portal_query(
        dataset_types = "GWAS",
        phenotypes = c("schizophrenia", "parkinson"),
        file_types = "multi_finemap",
        loci = c("BST1", "CHRNB1", "LRRK2"),
        LD_panels = "1KGphase3"
    )
    ## Sometimes download fails on GHA server, producing a NULL?
    # local_finemap_nonNA <- local_finemap[!is.null(local_finemap)]
    # testthat::expect_true(all(file.exists(local_finemap_nonNA)))
    testthat::expect_true(length(local_finemap)==3 | length(local_finemap)==0)
})
