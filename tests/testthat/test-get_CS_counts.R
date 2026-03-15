test_that("get_CS_counts returns counts per locus", {

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
        echodata::get_CS_counts(merged_DT = merged_DT)
    ))

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_true("Locus" %in% colnames(res))
    testthat::expect_true("UCS.CS_size" %in% colnames(res))
    ## Should have one row per locus
    testthat::expect_equal(nrow(res), 2)
    ## Locus should be an ordered factor
    testthat::expect_true(is.ordered(res$Locus))
    ## UCS.CS_size should be non-negative integers
    testthat::expect_true(all(res$UCS.CS_size >= 0))
})

test_that("get_CS_counts works with top_CS_only = TRUE", {

    bst1 <- data.table::copy(echodata::BST1)
    bst1$Locus <- "BST1"
    lrrk2 <- data.table::copy(echodata::LRRK2)
    shared <- intersect(colnames(bst1), colnames(lrrk2))
    merged_DT <- data.table::rbindlist(
        list(bst1[, ..shared], lrrk2[, ..shared]),
        fill = TRUE
    )

    res <- suppressWarnings(suppressMessages(
        echodata::get_CS_counts(merged_DT = merged_DT,
                                top_CS_only = TRUE)
    ))

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_equal(nrow(res), 2)
    ## top_CS_only counts should be <= normal counts
    res_all <- suppressWarnings(suppressMessages(
        echodata::get_CS_counts(merged_DT = merged_DT,
                                top_CS_only = FALSE)
    ))
    testthat::expect_true(all(res$UCS.CS_size <= res_all$UCS.CS_size))
})

test_that("get_CS_counts works with single locus", {

    dat <- data.table::copy(echodata::LRRK2)

    res <- suppressWarnings(suppressMessages(
        echodata::get_CS_counts(merged_DT = dat)
    ))

    testthat::expect_s3_class(res, "data.frame")
    testthat::expect_equal(nrow(res), 1)
    testthat::expect_equal(as.character(res$Locus), "LRRK2")
})
