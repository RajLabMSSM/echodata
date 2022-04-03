standardize_stderr <- function(query,
                               colmap,
                               verbose=TRUE){ 
    Effect <- tstat <- NULL;
    if(colmap$StdErr=="calculate"){
        messager("Calculating Standard Error...",v=verbose)
        if(all(c("Effect","tstat") %in% colnames(query)))
        query <- dplyr::mutate(query, StdErr=Effect/tstat) 
    }
    return(query)
}
