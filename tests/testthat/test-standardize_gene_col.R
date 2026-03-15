test_that("standardize_gene_col renames Gene column from colmap", {

    query <- data.frame(
        SNP = c("rs1", "rs2", "rs3"),
        my_gene = c("GeneA", "GeneB", "GeneC"),
        stringsAsFactors = FALSE
    )
    colmap <- list(Gene = "my_gene")

    res <- suppressMessages(
        echodata:::standardize_gene_col(
            query = query,
            colmap = colmap,
            locus = NULL
        )
    )

    testthat::expect_true("Gene" %in% colnames(res))
    testthat::expect_equal(res$Gene, c("GeneA", "GeneB", "GeneC"))
})

test_that("standardize_gene_col returns unchanged when Gene not in colnames", {

    query <- data.frame(
        SNP = c("rs1", "rs2"),
        other_col = c(1, 2),
        stringsAsFactors = FALSE
    )
    colmap <- list(Gene = "nonexistent_col")

    res <- suppressMessages(
        echodata:::standardize_gene_col(
            query = query,
            colmap = colmap,
            locus = NULL
        )
    )

    testthat::expect_equal(colnames(res), colnames(query))
    testthat::expect_equal(nrow(res), 2)
})

test_that("standardize_gene_col subsets by named locus (gene)", {

    query <- data.frame(
        SNP = c("rs1", "rs2", "rs3"),
        Gene = c("BST1", "BST1", "LRRK2"),
        stringsAsFactors = FALSE
    )
    colmap <- list(Gene = "Gene")
    ## Named locus triggers detect_genes -> subsetting
    locus <- c(BST1 = "BST1")

    res <- suppressMessages(
        echodata:::standardize_gene_col(
            query = query,
            colmap = colmap,
            locus = locus
        )
    )

    testthat::expect_true(all(res$Gene == "BST1"))
    testthat::expect_equal(nrow(res), 2)
})

test_that("standardize_gene_col does not subset with unnamed locus", {

    query <- data.frame(
        SNP = c("rs1", "rs2", "rs3"),
        Gene = c("BST1", "BST1", "LRRK2"),
        stringsAsFactors = FALSE
    )
    colmap <- list(Gene = "Gene")
    ## Unnamed locus: detect_genes returns FALSE, no subsetting
    locus <- c("BST1")

    res <- suppressMessages(
        echodata:::standardize_gene_col(
            query = query,
            colmap = colmap,
            locus = locus
        )
    )

    testthat::expect_equal(nrow(res), 3)
})
