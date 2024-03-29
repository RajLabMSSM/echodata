#' Unlist a \link[data.table]{data.table}
#' 
#' Identify columns that are lists and turn them into vectors.
#' @param dt A \link[data.table]{data.table}.
#' @param exclude Columns to exclude from unlisting.
#' @param verbose Print messages.
#' @returns \code{dt} with list columns turned into vectors. 
#' 
#' @export
#' @importFrom data.table .SD :=
#' @importFrom methods is
#' @examples 
#' dat <- echodata::BST1
#' dat$SNP <- as.list(dat$SNP)
#' dat2 <- unlist_dt(dt=dat)
unlist_dt <- function(dt,
                      exclude=NULL,
                      verbose=TRUE) {
    .SD <- NULL
    cols <- names(dt)[ unlist(lapply(dt, methods::is,"list")) ]
    cols <- cols[!cols %in% exclude]
    if(length(cols)>0){
        messager("Unlisting",length(cols),"column(s).",v=verbose)
        dt[ , (cols) := lapply(.SD,unlist), .SDcols = cols]
    } 
}
