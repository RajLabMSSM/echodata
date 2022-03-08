#' Check colname synonyms 
#' 
#' Check whether a table has headers that can be mapped 
#' to an attribute in \pkg{MungeSumstats}
#'
#' @keywords internal
mungesumstats_check_syn <- function(dat,
                                    col_name="P-value",
                                    col_type="P"){
    Corrected <- NULL;
    
    if(any(col_name==col_type)) return(dat)
    if(!is.null(col_name)){
        dat <- data.frame(dat, check.names = FALSE)
        if(col_name!=col_type){
            dat[[col_type]] <- dat[[col_name]]
        }
    }
    syn <- subset(echodata::sumstatsColHeaders,
                  Corrected==col_type)[,1]
    if(!any(colnames(dat) %in% syn)) {
        stop(paste("MungeSumstats will be unable to map",col_type,
                   ", please supply mapping."))
    }
    return(dat)
}
