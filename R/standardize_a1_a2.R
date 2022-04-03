standardize_a1_a2 <- function(query,
                              colmap,
                              verbose=TRUE){
    messager("++ Preparing A1,A1 cols", v=verbose)
    query <- data.table::data.table(query)
    if(colmap$A1 %in% colnames(query)){ 
        data.table::setnames(query, colmap$A1, "A1")
    }
    if(colmap$A2 %in% colnames(query)){ 
        data.table::setnames(query, colmap$A2, "A2")
    }
    return(query)
}