test_that("get_header works", {
  
    dat <- echodata::BST1
    tmp <- tempfile(fileext = ".tsv.gz")
    data.table::fwrite(dat, file = tmp, sep = "\t")
    
    #### Colnames only ####
    header <- echodata::get_header(file=tmp)
    testthat::expect_equal(header, colnames(dat))
    #### nrows ####    
    header2 <- echodata::get_header(file=tmp, 
                                    colnames_only = FALSE, 
                                    nrows = 5) 
    testthat::expect_equal(header2, head(dat,5)) 
})
