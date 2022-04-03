standardize_coltypes <- function(query,
                                 verbose=TRUE){
    
    messager("++ Ensuring Effect,StdErr,P are numeric.", v=verbose)
    query <- query  %>%
        dplyr::mutate_at(.vars = c("Effect","StdErr","P"),
                         .funs = as.numeric) %>%
        dplyr::mutate_at(.vars = c("CHR"), 
                         .funs = function(x){as.integer(gsub("chr","",x))}) 
    return(query)
}