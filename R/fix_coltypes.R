#' Automatically fix column types 
#' 
#' Sometimes things that should be numbers get interpreted as strings
#'  (e.g. 1 vs. "1"). This function automatically inferred the best match 
#'  for each column and reformats its column type accordingly.
#' 
#' @param dat A data.frame. 
#' @returns A fixed data.frame
#' @export
#' @importFrom dplyr mutate_all
#' @importFrom readr parse_guess
#' @examples 
#' dat <- mtcars
#' dat$cyl <- as.character(dat$cyl)
#' dat$wt <- as.character(dat$wt)
#' dat$drat <- as.factor(dat$drat)
#' 
#' dat2 <- fix_coltypes(dat=dat)
fix_coltypes <- function(dat){
    dat2 <-dplyr::mutate_all(.tbl = dat, 
                             .funs = function(x){
                                 readr::parse_guess(as.character(x))
                             })   
    return(dat2)
}
