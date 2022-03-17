test_that("read_bgz works", {
    
    requireNamespace("Rsamtools")
    
    tmp <- tempfile(fileext = ".tsv.gz")
    dat <- echodata::BST1
    data.table::fwrite(dat, file = tmp, sep = "\t")
    file <- Rsamtools::bgzip(file = tmp, overwrite=TRUE)
    dat2 <- echodata::read_bgz(file=file)
    testthat::expect_true(all.equal(dat, dat2))
})
