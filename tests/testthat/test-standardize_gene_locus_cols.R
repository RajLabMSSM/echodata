test_that("standardize_gene_locus_cols with both Gene and Locus present", {

    topSNPs <- data.frame(
        SNP = c("rs1", "rs2", "rs3"),
        CHR = c(1, 2, 3),
        POS = c(100, 200, 300),
        Gene = c("GeneA", "GeneB", "GeneC"),
        Locus = c("LocA", "LocB", "LocC"),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(topSNPs = topSNPs)
    )

    testthat::expect_true("Gene" %in% colnames(res))
    testthat::expect_true("Locus" %in% colnames(res))
    testthat::expect_equal(as.character(res$Gene),
                           c("GeneA", "GeneB", "GeneC"))
    testthat::expect_equal(as.character(res$Locus),
                           c("LocA", "LocB", "LocC"))
})

test_that("standardize_gene_locus_cols replaces bad characters", {

    topSNPs <- data.frame(
        SNP = c("rs1", "rs2"),
        CHR = c(1, 2),
        POS = c(100, 200),
        Gene = c("Gene/A", "Gene:B"),
        Locus = c("Loc,A", "Loc/B"),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(topSNPs = topSNPs)
    )

    ## /  :  , should be replaced with _
    testthat::expect_false(any(grepl("[/,:]", res$Gene)))
    testthat::expect_false(any(grepl("[/,:]", res$Locus)))
    testthat::expect_equal(as.character(res$Gene), c("Gene_A", "Gene_B"))
    testthat::expect_equal(as.character(res$Locus), c("Loc_A", "Loc_B"))
})

test_that("standardize_gene_locus_cols with only Gene column", {

    topSNPs <- data.frame(
        SNP = c("rs1", "rs2"),
        CHR = c(1, 2),
        POS = c(100, 200),
        Gene = c("GeneX", "GeneY"),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(topSNPs = topSNPs)
    )

    ## Locus should be assigned same as Gene
    testthat::expect_true("Locus" %in% colnames(res))
    testthat::expect_equal(as.character(res$Gene),
                           as.character(res$Locus))
})

test_that("standardize_gene_locus_cols with only Locus column", {

    topSNPs <- data.frame(
        SNP = c("rs1", "rs2"),
        CHR = c(1, 2),
        POS = c(100, 200),
        Locus = c("LocusX", "LocusY"),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(topSNPs = topSNPs)
    )

    ## Gene should be assigned same as Locus
    testthat::expect_true("Gene" %in% colnames(res))
    testthat::expect_equal(as.character(res$Gene),
                           as.character(res$Locus))
})

test_that("standardize_gene_locus_cols constructs names from SNP/CHR when neither present", {

    topSNPs <- data.frame(
        SNP = c("rs100", "rs200"),
        CHR = c(1, 5),
        POS = c(100, 200),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(
            topSNPs = topSNPs,
            Locus = NULL,
            Gene = NULL
        )
    )

    testthat::expect_true("Locus" %in% colnames(res))
    testthat::expect_true("Gene" %in% colnames(res))
    ## Should follow the pattern locus_chrX_rsY
    testthat::expect_true(all(grepl("^locus_chr", res$Locus)))
})

test_that("standardize_gene_locus_cols with non-default column names", {

    topSNPs <- data.frame(
        SNP = c("rs1", "rs2"),
        CHR = c(1, 2),
        POS = c(100, 200),
        my_gene = c("GeneA", "GeneB"),
        my_locus = c("LocA", "LocB"),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(
            topSNPs = topSNPs,
            Gene = "my_gene",
            Locus = "my_locus"
        )
    )

    testthat::expect_true("Gene" %in% colnames(res))
    testthat::expect_true("Locus" %in% colnames(res))
    ## Original non-standard columns should be removed
    testthat::expect_false("my_gene" %in% colnames(res))
    testthat::expect_false("my_locus" %in% colnames(res))
})

test_that("standardize_gene_locus_cols handles grouping_vars for QTLs", {

    topSNPs <- data.frame(
        SNP = c("rs1", "rs2"),
        CHR = c(1, 2),
        POS = c(100, 200),
        Gene = c("GeneA", "GeneB"),
        Locus = c("LocA", "LocB"),
        tissue = c("brain", "liver"),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(
            topSNPs = topSNPs,
            grouping_vars = c("Locus", "tissue")
        )
    )

    ## Locus should now be a combination of Locus and tissue
    testthat::expect_true(all(grepl("_", res$Locus)))
    testthat::expect_true(grepl("brain", res$Locus[1]))
})

test_that("standardize_gene_locus_cols works with topSNPs_Nalls2019", {

    topSNPs <- data.frame(echodata::topSNPs_Nalls2019)

    res <- suppressMessages(
        echodata:::standardize_gene_locus_cols(topSNPs = topSNPs)
    )

    testthat::expect_true("Gene" %in% colnames(res))
    testthat::expect_true("Locus" %in% colnames(res))
    testthat::expect_equal(nrow(res), nrow(topSNPs))
})
