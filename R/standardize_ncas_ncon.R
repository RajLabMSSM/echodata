standardize_ncas_ncon <- function(query,
                                  colmap,
                                  verbose=TRUE){
    
    ## Add proportion of cases if available
    messager("++ Preparing N_cases,N_controls cols.", v=verbose)
    query <- data.table::data.table(query)
    #### N_cases ####
    if(is.numeric(colmap$N_cases)){
        ## numeric
        messager("Assigning all rows as N_cases==",colmap$N_cases,
                 v=verbose)
        query$N_cases <- colmap$N_cases  
    }
    if(!is.null(colmap$N_cases) && 
       (colmap$N_cases %in% colnames(query))){
        ## column
        data.table::setnames(query,
                             old = "N_cases", 
                             new = colmap$N_cases) 
    } 
    #### N_controls ####
    if(is.numeric(colmap$N_controls)){
        ## numeric
        messager("Assigning all rows as N_controls==",colmap$N_controls,
                 v=verbose)
        query$N_controls <- colmap$N_controls  
    }
    if(!is.null(colmap$N_controls) &&
       (colmap$N_controls %in% colnames(query))){
        ## column
        data.table::setnames(query,
                             old = "N_controls", 
                             new = colmap$N_controls) 
    }  
    return(query)
}
