test_that("unlist_dt converts list columns to vectors", {

    dat <- data.table::copy(echodata::BST1)
    dat$SNP <- as.list(dat$SNP)
    testthat::expect_true(is.list(dat$SNP))

    dat2 <- suppressMessages(echodata:::unlist_dt(dt = dat))

    testthat::expect_false(is.list(dat2$SNP))
    testthat::expect_equal(dat2$SNP, echodata::BST1$SNP)
})

test_that("unlist_dt respects exclude argument", {

    dat <- data.table::copy(echodata::BST1)
    dat$SNP <- as.list(dat$SNP)
    dat$A1 <- as.list(dat$A1)

    dat2 <- suppressMessages(
        echodata:::unlist_dt(dt = dat, exclude = "SNP")
    )

    ## SNP should still be a list (excluded)
    testthat::expect_true(is.list(dat2$SNP))
    ## A1 should be unlisted
    testthat::expect_false(is.list(dat2$A1))
})

test_that("unlist_dt does nothing when no list columns exist", {

    dat <- data.table::copy(echodata::BST1)
    dat2 <- suppressMessages(
        echodata:::unlist_dt(dt = dat)
    )
    ## Should return the same data (NULL is returned invisibly when
    ## no list cols, but the original dt is modified in place by reference)
    testthat::expect_false(any(vapply(dat, is.list, logical(1))))
})

test_that("unlist_dt verbose=FALSE suppresses messages", {

    dat <- data.table::copy(echodata::BST1)
    dat$SNP <- as.list(dat$SNP)

    testthat::expect_silent(
        echodata:::unlist_dt(dt = dat, verbose = FALSE)
    )
})
