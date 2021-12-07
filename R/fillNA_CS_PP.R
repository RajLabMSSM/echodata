#' Fill NAs in PP and CS columns
#'
#' Fill NAs in columns with fine-mapping Posterior Probabilities 
#' (ending in ".PP") and and columns with Credible Set assignments 
#' (ending in ".CS").
#' 
#' @param dat Fine-mapping results data.
#' @param fillNA_CS What to fill NA values in Credible Set ("*.CS") 
#' columns with.
#' @param fillNA_PP What to fill NA values in Posterior Probability ("*.PP")
#' columns with.
#' @param verbose Print messages.
#' @return Modified \link[data.table]{data.table}
#' @family general
#' @export
#' @examples
#' dat <- echodata::BST1 
#' dat <- echodata::fillNA_CS_PP(dat = dat)
fillNA_CS_PP <- function(dat,
                         fillNA_CS = 0,
                         fillNA_PP = 0,
                         verbose = TRUE){
  CS_cols <- grep(".CS$",colnames(dat), value = TRUE)
  PP_cols <-  grep(".PP$",colnames(dat), value = TRUE)
  dat <- data.frame(dat)
  if(!is.null(fillNA_CS)){
    messager("+ Filling NAs in CS cols with",paste0(fillNA_CS,"."),
             v=verbose)
    dat[,CS_cols][is.na(dat[,CS_cols])] <- fillNA_CS
  }
  if(!is.null(fillNA_PP)){
    messager("+ Filling NAs in PP cols with",paste0(fillNA_PP,"."),
             v=verbose)
    dat[,PP_cols][is.na(dat[,PP_cols])] <- fillNA_PP
  }
  return(dat)
}
