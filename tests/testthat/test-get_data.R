test_that("get_data works", {
    
    tmp <- get_data(fname = "Kunkle2019.tsv.gz")
    dat <- data.table::fread(tmp)
    testthat::expect_equal(dim(dat),c(1157,10))
})
