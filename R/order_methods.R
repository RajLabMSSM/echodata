order_methods <- function(finemap_melt,
                          method_col="Method",
                          verbose=TRUE){
    
    if("Method" %in% colnames(finemap_melt)){
        finemap_melt$Method <- factor(
            x = finemap_melt[[method_col]],
            levels =  c(sort(
                grep("mean",unique(unname(finemap_melt[[method_col]])),
                     invert = TRUE, 
                     value = TRUE)
            ),"mean"), 
            ordered = TRUE) 
    } else {
        messager("Warning: No Method column detected.",v=verbose)
    }
    return(finemap_melt)
}