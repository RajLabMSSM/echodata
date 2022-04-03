standardise_main_colnames <- function(query,
                                      colmap, 
                                      verbose=TRUE){
    
    messager("Standardizing main column names.",v=verbose)
    #### Determine which cols are actually available ###
    colmap2 <- unlist(colmap)
    colmap2 <- colmap2[!colmap2 %in% c("TRUE","FALSE",TRUE,FALSE)]
    colmap2 <- colmap2[unname(colmap2) %in% colnames(query)]   
    #### Rename ####
    query <- data.table::data.table(query)
    data.table::setnames(query, 
                         old = unname(colmap2),
                         new = names(colmap2),
                         skip_absent = TRUE)  
    return(query)
}