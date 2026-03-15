test_that("fix_coltypes restores numeric columns cast to character", {

    dat <- mtcars
    dat$cyl <- as.character(dat$cyl)
    dat$wt <- as.character(dat$wt)

    dat2 <- echodata::fix_coltypes(dat = dat)

    testthat::expect_true(is.numeric(dat2$cyl))
    testthat::expect_true(is.numeric(dat2$wt))
    ## Values should be preserved
    testthat::expect_equal(dat2$cyl, mtcars$cyl)
    testthat::expect_equal(dat2$wt, mtcars$wt)
})

test_that("fix_coltypes restores factor columns", {

    dat <- mtcars
    dat$drat <- as.factor(dat$drat)

    dat2 <- echodata::fix_coltypes(dat = dat)

    testthat::expect_true(is.numeric(dat2$drat))
    testthat::expect_equal(dat2$drat, mtcars$drat)
})

test_that("fix_coltypes preserves already-correct types", {

    dat <- mtcars
    dat2 <- echodata::fix_coltypes(dat = dat)

    testthat::expect_true(is.numeric(dat2$mpg))
    testthat::expect_true(is.numeric(dat2$hp))
    testthat::expect_equal(dat2$mpg, mtcars$mpg)
})

test_that("fix_coltypes handles character columns that should stay character", {

    dat <- data.frame(
        name = c("Alice", "Bob", "Charlie"),
        value = c("1", "2", "3"),
        stringsAsFactors = FALSE
    )

    dat2 <- echodata::fix_coltypes(dat = dat)

    testthat::expect_true(is.character(dat2$name))
    testthat::expect_true(is.numeric(dat2$value))
})
