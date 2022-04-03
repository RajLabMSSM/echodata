standardize_proportion_cases <- function(query,
                                         colmap, 
                                         verbose=FALSE){
    
    messager("++ Preparing proportion_cases col.", v=verbose)
    #### Rename column ####
    if(colmap$proportion_cases !="calculate"){
        #### SNP-specific proportion_cases #####
        if(length(colmap$proportion_cases)==nrow(query)){
            query$proportion_cases <- query[[colmap$proportion_cases]]
        #### General proportion_cases #####
        } else {
            query$proportion_cases <- colmap$proportion_cases
        }
    #### Impute proportion_cases #####
    } else if(colmap$proportion_cases=="calculate" &
              "N_cases" %in% colnames(query) &
              "N_controls" %in% colnames(query)){
        messager("++ Calculating proportion_cases",
                 "from N_cases and N_controls.",v=verbose)
        ### Calculate proportion of cases if N_cases and N_controls available
        query$proportion_cases <- query$N_cases /
            (query$N_controls + query$N_cases)
    } else {
        ### Otherwise don't include this col
        messager("++ proportion_cases not included in data subset.",
                 v=verbose)
    }
    return(query)
}
