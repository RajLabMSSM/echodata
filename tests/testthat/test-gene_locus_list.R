test_that("gene_locus_list works", {
    
    loci <- gene_locus_list(topSNPs = echodata::topSNPs_Nalls2019,
                            dataset_type = "GWAS")
    testthat::expect_null(names(loci))
    
    loci <- gene_locus_list(topSNPs = echodata::topSNPs_Nalls2019,
                            dataset_type = "QTL")
    testthat::expect_true(is.character(names(loci)))
    
    loci2 <- gene_locus_list(loci = loci)
    testthat::expect_equal(length(loci2), length(loci))
})
