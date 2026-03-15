test_that("get_Nalls2019_coloc downloads and returns a data.table", {

    testthat::skip_if_offline()
    testthat::skip_on_cran()

    coloc_res <- tryCatch(
        echodata::get_Nalls2019_coloc(),
        error = function(e) NULL
    )
    testthat::skip_if(is.null(coloc_res),
                      message = "Could not download Nalls2019 coloc data")

    testthat::expect_s3_class(coloc_res, "data.table")
    testthat::expect_gt(nrow(coloc_res), 0)
    testthat::expect_gt(ncol(coloc_res), 0)
})
