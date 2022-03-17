test_that("granges_to_bed works", {
  
    grlist <- echodata::dt_to_granges(dat = echodata::BST1)
    
    #### Saved ###
    bed_path <- echodata:: granges_to_bed(grlist = grlist)
    bed <- data.table::fread(bed_path)
    testthat::expect_equal(length(grlist), nrow(bed)) 
})
