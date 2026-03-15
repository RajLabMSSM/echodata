test_that("get_CS_bins returns binned CS sizes", {

    ## Build a small merged dataset from package data
    bst1 <- data.table::copy(echodata::BST1)
    bst1$Locus <- "BST1"
    lrrk2 <- data.table::copy(echodata::LRRK2)
    shared <- intersect(colnames(bst1), colnames(lrrk2))
    merged_DT <- data.table::rbindlist(
        list(bst1[, ..shared], lrrk2[, ..shared]),
        fill = TRUE
    )

    res <- suppressWarnings(suppressMessages(
        echodata::get_CS_bins(merged_DT = merged_DT)
    ))

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_true("bin" %in% colnames(res))
    testthat::expect_true("Method" %in% colnames(res))
    testthat::expect_true("CS_size" %in% colnames(res))
    testthat::expect_true("Locus" %in% colnames(res))
})

test_that("get_CS_bins bin column is an ordered factor with correct levels", {

    bst1 <- data.table::copy(echodata::BST1)
    bst1$Locus <- "BST1"
    lrrk2 <- data.table::copy(echodata::LRRK2)
    shared <- intersect(colnames(bst1), colnames(lrrk2))
    merged_DT <- data.table::rbindlist(
        list(bst1[, ..shared], lrrk2[, ..shared]),
        fill = TRUE
    )

    res <- suppressWarnings(suppressMessages(
        echodata::get_CS_bins(merged_DT = merged_DT)
    ))

    expected_labels <- c("16+", "11-15", "8-10", "5-7", "2-4", "1", "0")
    testthat::expect_true(is.ordered(res$bin))
    testthat::expect_equal(levels(res$bin), expected_labels)
})

test_that("get_CS_bins works with single locus", {

    dat <- data.table::copy(echodata::LRRK2)

    res <- suppressWarnings(suppressMessages(
        echodata::get_CS_bins(merged_DT = dat)
    ))

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_true(all(as.character(res$Locus) == "LRRK2"))
})
