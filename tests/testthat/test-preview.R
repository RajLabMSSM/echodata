test_that("preview works", {

    dat <- echodata::BST1[,1:5]
    tmp <- tempfile(fileext = ".tsv.gz")
    data.table::fwrite(dat, file = tmp, sep = "\t")

    ##### Feed in table ####
    out1 <- tryCatch({
        echodata::preview(path = dat,
                          nrows = 5L)
    }, message = function(m)m)
    ## Check that a message was produced with expected column names
    testthat::expect_true(methods::is(out1, "message"))
    testthat::expect_true(all(
        vapply(colnames(dat), function(x) grepl(x, out1$message), logical(1))
    ))

    #### Feed in path ####
    out2 <- tryCatch({
        echodata::preview(path = tmp,
                          nrows = 5L)
    }, message = function(m)m)
    testthat::expect_true(methods::is(out2, "message"))
    testthat::expect_true(all(
        vapply(colnames(dat), function(x) grepl(x, out2$message), logical(1))
    ))
})
