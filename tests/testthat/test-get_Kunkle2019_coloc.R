test_that("get_Kunkle2019_coloc downloads and returns a data.table", {

    testthat::skip_if_offline()
    testthat::skip_on_cran()

    coloc_res <- tryCatch(
        echodata::get_Kunkle2019_coloc(),
        error = function(e) NULL
    )
    testthat::skip_if(is.null(coloc_res),
                      message = "Could not download Kunkle2019 coloc data")

    testthat::expect_s3_class(coloc_res, "data.table")
    testthat::expect_gt(nrow(coloc_res), 0)
    testthat::expect_gt(ncol(coloc_res), 0)
})

test_that("get_Kunkle2019_coloc return_path returns a list", {

    testthat::skip_if_offline()
    testthat::skip_on_cran()

    res <- tryCatch(
        echodata::get_Kunkle2019_coloc(return_path = TRUE),
        error = function(e) NULL
    )
    testthat::skip_if(is.null(res),
                      message = "Could not download Kunkle2019 coloc data")

    testthat::expect_type(res, "list")
    testthat::expect_true("dat" %in% names(res))
    testthat::expect_true("path" %in% names(res))
    testthat::expect_s3_class(res$dat, "data.table")
    testthat::expect_true(is.character(res$path))
    testthat::expect_true(file.exists(res$path))
})
