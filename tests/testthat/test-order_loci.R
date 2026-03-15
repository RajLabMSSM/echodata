test_that("order_loci alphabetically descending (default)", {

    dat <- data.table::data.table(
        Locus = rep(c("AAA", "CCC", "BBB"), each = 3),
        SNP = paste0("rs", seq_len(9)),
        Support = c(1, 0, 0, 0, 1, 1, 0, 0, 1)
    )

    res <- suppressMessages(echodata::order_loci(dat = dat))

    testthat::expect_true(is.factor(res$Locus))
    testthat::expect_true(is.ordered(res$Locus))
    ## Descending alphabetical: CCC, BBB, AAA
    testthat::expect_equal(levels(res$Locus), c("CCC", "BBB", "AAA"))
})

test_that("order_loci alphabetically ascending", {

    dat <- data.table::data.table(
        Locus = rep(c("AAA", "CCC", "BBB"), each = 3),
        SNP = paste0("rs", seq_len(9)),
        Support = c(1, 0, 0, 0, 1, 1, 0, 0, 1)
    )

    res <- suppressMessages(
        echodata::order_loci(dat = dat, descending = FALSE)
    )

    testthat::expect_equal(levels(res$Locus), c("AAA", "BBB", "CCC"))
})

test_that("order_loci uses LRRK2 package data", {

    dat <- echodata::LRRK2
    res <- suppressMessages(echodata::order_loci(dat = dat))

    testthat::expect_true(is.factor(res$Locus))
    testthat::expect_true(is.ordered(res$Locus))
    testthat::expect_equal(nrow(res), nrow(dat))
})
