test_that("import_topSNPs works", {
     
    
    required_cols <- c("Locus","Gene","CHR","POS","SNP","P","Effect")
    
    #### With locus/gene specified ####
    topSNPs <- echodata::import_topSNPs(
        topSS = echodata::topSNPs_Nalls2019_raw,
        colmap = construct_colmap(POS = "BP",
                                  P = "P, all studies",
                                  Effect = "Beta, all studies",
                                  Locus = "Nearest Gene",
                                  Gene = "QTL Nominated Gene (nearest QTL)"
                                  ),
        grouping_vars = c("Locus Number"),
        remove_variants="rs34637584", 
        munge=TRUE)  
    testthat::expect_true(methods::is(topSNPs,"data.table"))
    testthat::expect_equal(nrow(topSNPs), 78)
    testthat::expect_true(all(required_cols %in% colnames(topSNPs)))
    
    
    #### WithOUT grouping var ####
    topSNPs <- import_topSNPs(
        topSS=echodata::topSNPs_Nalls2019_raw,
        colmap = construct_colmap(POS = "BP",
                                  P = "P, all studies",
                                  Effect = "Beta, all studies",
                                  Locus = "Nearest Gene",
                                  Gene = "QTL Nominated Gene (nearest QTL)"
                                  ) 
        )
    testthat::expect_true(methods::is(topSNPs,"data.table"))
    testthat::expect_equal(nrow(topSNPs), 97)
    testthat::expect_true(all(required_cols %in% colnames(topSNPs))) 
})
