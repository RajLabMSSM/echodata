#' Merge robust
#' 
#' Ensure two \link[data.table]{data.table}  are merged properly.
#' Necessary due to inconsistencies with how \link[data.table]{data.table} 
#' are evaluated in different scopes.
#' @source \href{https://rdatatable.gitlab.io/data.table/articles/datatable-importing.html#optionally-import-data-table-suggests}{
#' data.table docs}
#' @param ... Additional arguments passed to 
#' \link[data.table]{merge.data.table}. 
#' @param dup_stop Throw an error if duplicates of the \code{by} 
#' column are detected after merging.
#' @param na_stop Throw an error if all of the data from \code{y} 
#' has been converted to NAs (unless they were all NAs before merging). 
#' @inheritParams data.table::merge.data.table
#' @export
#' @examples 
#' dat <- echodata::BST1
#' x <- dat[,c("SNP","CHR","POS")]
#' y <- dat[,c("SNP","Support","leadSNP")]
#' z <- merge_robust(x=x, y=y, by="SNP")
merge_robust <- function(x,
                         y,
                         by=NULL,
                         dup_stop=TRUE,
                         na_stop=TRUE,
                         ...){
    #### Set global to make sure R knows you're using data.table ####
    .datatable.aware <- TRUE
    ####
    if(!is.null(by)){
        data.table::setDT(x, key = by)
        data.table::setDT(y, key = by)
    }
    z <- data.table::merge.data.table(x = data.table::copy(x),
                                      y = data.table::copy(y), 
                                      by=by, 
                                      ...)
    #### Check for duplicates ####
    if(!is.null(by) && dup_stop){
        dups <- sum(duplicated( z[,..by] ))
        if(dups>0) {
            stp <- paste(dups,"duplicates detected in",by,
                         "column after merge.")
            stop(stp)
        } 
    }
    #### Check for equal number of NAs as before ####
    y_cols <- colnames(y)[!colnames(y) %in% by] 
    ## Check if these columns were all NAs before merging
    all_nas_before <- all(is.na(y[,..y_cols]))
    all_nas <- all(is.na(z[,..y_cols]))
    if(all_nas && na_stop && !all_nas_before){
        stp2 <- paste("All NAs detected in all columns from data.table y.")
        stop(stp2)
    }
    return(z)
}
