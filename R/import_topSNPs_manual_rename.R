import_topSNPs_manual_rename <- function(topSNPs,
                                         colmap, 
                                         verbose=TRUE){ 
    for(x in names(colmap)){
        old_name <- colmap[[x]]
        if((!is.null(old_name)) &&
           (old_name!=x) &&
           (old_name %in% colnames(topSNPs))){
            messager("Renaming column:",old_name,"==>",x)
            data.table::setnames(topSNPs, old_name, x) 
        }
    }
    return(topSNPs)
}
