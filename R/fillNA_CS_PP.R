#' Fill NAs in PP and CS columns
#'
#' Fill NAs in columns with fine-mapping Posterior Probabilities 
#' (ending in ".PP") and and columns with Credible Set assignments 
#' (ending in ".CS").
#' 
#' @return Modified \link[data.table]{data.table}
#' @family general
#' @export
#' @examples
#' dat <- echodata::BST1 
#' dat <- echodata::fillNA_CS_PP(dat = dat)
fillNA_CS_PP <- function(dat,
                         fillNA_CS=0,
                         fillNA_PP=0){
  CS_cols <- grep(".CS$",colnames(dat), value = TRUE)
  PP_cols <-  grep(".PP$",colnames(dat), value = TRUE)
  dat <- data.frame(dat)
  if(!is.null(fillNA_CS)){
    messager("+ Filling NAs in CS cols with",fillNA_CS)
    dat[,CS_cols][is.na(dat[,CS_cols])] <- fillNA_CS
  }
  if(!is.null(fillNA_PP)){
    messager("+ Filling NAs in PP cols with",fillNA_PP)
    dat[,PP_cols][is.na(dat[,PP_cols])] <- fillNA_PP
  }
  return(dat)
}
