test_that("get_os returns a valid OS string", {

    os <- echodata::get_os()

    testthat::expect_true(is.character(os))
    testthat::expect_length(os, 1)
    ## Should be one of the recognised OS names (all lower case)
    testthat::expect_true(
        os %in% c("osx", "linux", "windows", "unix")
    )
})

test_that("get_os returns lowercase", {

    os <- echodata::get_os()
    testthat::expect_equal(os, tolower(os))
})
