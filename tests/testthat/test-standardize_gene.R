test_that("standardize_gene parses ensembl-style gene column", {

    testthat::skip_if_not_installed("orthogene")

    ## Create a small data.frame with ensembl-style gene identifiers
    dat <- data.frame(
        gene = c("ENSG00000114737", "ENSG00000188906"),
        value = c(1, 2),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata::standardize_gene(dat = dat, Gene = "gene")
    )

    ## Should have new columns from tidyr::separate
    testthat::expect_true("ensembl_id" %in% colnames(res))
    testthat::expect_true("Gene" %in% colnames(res))
    testthat::expect_equal(nrow(res), 2)
})

test_that("standardize_gene handles colon-separated format", {

    testthat::skip_if_not_installed("orthogene")

    dat <- data.frame(
        gene = c("chr1:100:200:ENSG00000114737",
                 "chr2:300:400:ENSG00000188906"),
        value = c(1, 2),
        stringsAsFactors = FALSE
    )

    res <- suppressMessages(
        echodata::standardize_gene(dat = dat, Gene = "gene")
    )

    testthat::expect_true("chr" %in% colnames(res))
    testthat::expect_true("start" %in% colnames(res))
    testthat::expect_true("end" %in% colnames(res))
    testthat::expect_true("ensembl_id" %in% colnames(res))
})
