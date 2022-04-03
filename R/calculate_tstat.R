#' Impute t-stat
#'
#' If \strong{tstat} column is missing,
#' compute t-statistic from: \code{Effect / StdErr}.
#' @family standardization functions
#' 
#' @keywords internal
#' @importFrom dplyr %>% mutate
#' @importFrom data.table data.table
calculate_tstat <- function(dat,
                            colmap=construct_colmap(),
                            verbose=TRUE){ 
    
  if(colmap$tstat %in% colnames(dat)){
    dat <- dplyr::rename(dat, tstat = colmap$tstat)
  } else {
    if(all(c("Effect","StdErr") %in% colnames(dat))){
      messager("+ Imputing t-statistic from Effect and StdErr.",
               v=verbose)
      dat$tstat <- dat[,colmap$Effect, with=FALSE] / 
          dat[,colmap$StdErr, with=FALSE]
    } else {
      messager(
        "+ Could not calculate t-statistic",
        "due to missing Effect and/or StdErr columns. Returning input data.",
        v=verbose)
    }
  }
  return(dat)
}
