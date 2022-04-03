standardize_p <- function(query,
                          verbose=TRUE){
    P <- NULL;
    
    if(any(query$P<=0)){
        messager("++ Replacing P-values==0 with", .Machine$double.xmin, v=verbose)
        query[(query$P<=0),"P"] <- .Machine$double.xmin
    }
    if(any(is.na(query$P))){
        messager("++ Removing SNPs with P-values==NA", v=verbose)
        query <- subset(query, !is.na(P))
    }
    return(query)
}