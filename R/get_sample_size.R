#' Get sample size
#' 
#' Infer sample size from summary stats using \pkg{MungeSumstats}.
#' @param return_only A function to return only a single value from the 
#' inferred/imputed sample size column (e.g. \code{max}, \code{min}). 
#' @param ... Additional argument passed to \code{return_only} function, 
#' if \code{return_only}  is not \code{NULL}. 
#' @inheritParams filter_snps
#' @inheritParams MungeSumstats:::compute_sample_size
#' @importFrom stats setNames
#' @importFrom data.table setnames
#' @export
#' @examples
#' dat <- echodata::BST1
#' dat2 <- echodata::get_sample_size(dat = dat)
get_sample_size <- function(dat,
                            method = c("ldsc", "giant", "metal", "sum"),
                            return_only=NULL,
                            force_new = FALSE,
                            verbose=TRUE,
                            ...){
  
  if("N" %in% colnames(dat) && force_new==FALSE) return(dat)
  requireNamespace("MungeSumstats")
  if(is.null(method)) method <- "ldsc" 
  message("--")
  dat2 <- data.table::copy(dat)
  if("N_controls" %in% colnames(dat2)){
    data.table::setnames(dat2,"N_controls","N_CON")
  }
  if("N_cases" %in% colnames(dat2)){
    data.table::setnames(dat2,"N_cases","N_CAS")
  }
  dat2 <- MungeSumstats:::compute_sample_size(sumstats_dt = dat2,
                                              method = method, 
                                              force_new = force_new) 
  #### Rename Neff to N ####
  if(!"N" %in% colnames(dat2) || isTRUE(force_new)){
    if("Neff" %in% colnames(dat2)){
      data.table::setnames(dat2,"Neff","N")
    } 
  } 
  message("--")
  dat2 <- mungesumstats_to_echolocatoR(dat2)  
  if(!is.null(return_only)){
    return(return_only(dat2$N, ...))
  }
  return(dat2)
}
