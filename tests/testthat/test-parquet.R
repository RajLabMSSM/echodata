test_that("read/write_parquet works", {
    
    #### Causing segfault errors in R CMD CHECK ####
    # arrow::install_arrow()
        
    # # #### Write a parquet file ####
    # dat <- echodata::BST1
    # path <- echodata::write_parquet(dat)
    # #### Read the parquet file back into R ####
    # dat2 <- echodata::read_parquet(path=path)
    # #
    # testthat::expect_true(all.equal(dat, dat2))
    # 
    # #### Read header #### 
    # path <- echodata::write_parquet(dat)
    # header4 <- echodata::get_header(path=path,
    #                                 colnames_only = FALSE,
    #                                 nrows = 5)
    # testthat::expect_equal(header4, head(dat,5))
})
