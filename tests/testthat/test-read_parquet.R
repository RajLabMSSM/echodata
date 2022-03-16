test_that("read/write_parquet works", {
    
    #### Write a parquet file ####
    dat <- echodata::BST1
    path <- echodata::write_parquet(dat)
    #### Read the parquet file back into R ####
    dat2 <- echodata::read_parquet(path=path)
    
    testthat::expect_true(all.equal(dat, dat2))
})
