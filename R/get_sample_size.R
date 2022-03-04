#' Get sample size
#' 
#' Infer sample size from summary stats using \pkg{MungeSumstats}.
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
                            force_new = FALSE,
                            verbose=TRUE){
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
  dat2 <- MUNGESUMSTATS.to_echolocatoR(dat2)  
  return(dat2)
}
