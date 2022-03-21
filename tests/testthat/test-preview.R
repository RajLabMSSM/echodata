test_that("preview works", {
  
    dat <- echodata::BST1[,1:5]
    tmp <- tempfile(fileext = ".tsv.gz")
    data.table::fwrite(dat, file = tmp, sep = "\t")
     
    ##### Feed in table ####
    out1 <- tryCatch({
        echodata::preview(path = dat,
                          nrows = 5L)
    }, message = function(m)m)
    ## Reconstruct
    dat1 <- suppressWarnings(data.table::fread(text = out1$message)[,-1] ) 
    testthat::expect_equal(head(dat, 5), dat1)
    
    #### Feed in path ####
    out2 <- tryCatch({
        echodata::preview(path = tmp,
                          nrows = 5L)
    }, message = function(m)m)
    dat2 <- suppressWarnings(data.table::fread(text = out2$message)[,-1] ) 
    testthat::expect_equal(head(dat, 5), dat2)
    testthat::expect_equal(dat1, dat2)
})
