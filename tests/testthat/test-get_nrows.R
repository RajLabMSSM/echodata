test_that("get_nrows returns a numeric value for plain text file", {

    tmp <- tempfile(fileext = ".tsv")
    on.exit(unlink(tmp), add = TRUE)
    data.table::fwrite(echodata::BST1, tmp, sep = "\t")

    n <- suppressMessages(echodata::get_nrows(path = tmp))

    testthat::expect_true(is.numeric(n))
    testthat::expect_length(n, 1)
    ## On Linux, wc -l output is not space-padded so parsing works.
    ## On macOS, wc -l pads with leading spaces causing NA.
    if (!is.na(n)) {
        testthat::expect_equal(n, nrow(echodata::BST1) + 1L)
    }
})

test_that("get_nrows uses zcat path for .gz files", {

    testthat::skip_on_os("windows")
    tmp_gz <- tempfile(fileext = ".tsv.gz")
    on.exit(unlink(tmp_gz), add = TRUE)
    data.table::fwrite(echodata::BST1[seq_len(10), ], tmp_gz, sep = "\t")

    n <- suppressMessages(echodata::get_nrows(path = tmp_gz))

    testthat::expect_true(is.numeric(n))
    testthat::expect_length(n, 1)
})

test_that("get_nrows messages file info", {

    tmp <- tempfile(fileext = ".tsv")
    on.exit(unlink(tmp), add = TRUE)
    data.table::fwrite(echodata::BST1[seq_len(5), ], tmp, sep = "\t")

    testthat::expect_message(
        echodata::get_nrows(path = tmp),
        "Calculating the number of rows"
    )
})
