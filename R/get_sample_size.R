#' Get sample size
#' 
#' Infer sample size from summary stats using \pkg{MungeSumstats}.
#' @inheritParams filter_snps
#' @inheritParams MungeSumstats:::compute_sample_size
#' @family general
#' @export
#' @examples
#' dat <- echodata::BST1
#' dat2 <- echodata::get_sample_size(dat = dat)
get_sample_size <- function(dat,
                            method = c("ldsc", "giant", "metal", "sum"),
                            force_new = FALSE,
                            verbose=TRUE){
  requireNamespace("MungeSumstats")
  d <- MungeSumstats:::standardise_sumstats_column_headers_crossplatform(dat)
  message("--")
  dat2 <- MungeSumstats:::compute_sample_size(sumstats_dt = d$sumstats_dt,
                                              method = method, 
                                              force_new = force_new) 
  message("--")
  dat2 <- MUNGESUMSTATS.to_echolocatoR(dat2)
  return(dat2)
}
