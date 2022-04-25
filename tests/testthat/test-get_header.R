test_that("get_header works", {
  
    dat <- echodata::BST1
    tmp <- tempfile(fileext = ".tsv.gz")
    data.table::fwrite(dat, file = tmp, sep = "\t")
    
    #### Colnames only ####
    header <- echodata::get_header(path=tmp)
    testthat::expect_equal(header, colnames(dat))
    #### nrows ####    
    header2 <- echodata::get_header(path=tmp, 
                                    colnames_only = FALSE, 
                                    nrows = 5) 
    testthat::expect_equal(header2, head(dat,5)) 
    
    #### VCF ####
    path <- system.file("extdata", "BST1.1KGphase3.vcf.bgz",
                        package = "echodata")
    header3 <- echodata::get_header(path=path, 
                                    colnames_only = FALSE, 
                                    nrows = 5) 
    testthat::expect_equal(dim(header3), c(5,387)) 
})
