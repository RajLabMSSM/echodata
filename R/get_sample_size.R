#' Get sample size
#' 
#' Infer sample size from summary stats using \pkg{MungeSumstats}.
#' @param return_only A function to return only a single value from the 
#' inferred/imputed sample size column (e.g. \code{max}, \code{min}). 
#' @param ... Additional argument passed to \code{return_only} function, 
#' if \code{return_only}  is not \code{NULL}. 
#' @param compute_n How to compute per-SNP sample size (new column "N").\cr
#' If the column "N" is already present in \code{dat}, this column 
#' will be used to extract per-SNP sample sizes
#' and the argument \code{compute_n} will be ignored.\cr
#' If the column "N" is \emph{not} present in \code{dat}, one of the following 
#' options can be supplied to \code{compute_n}: 
#' \itemize{
#' \item{\code{0}: }{N will not be computed.}
#' \item{\code{>0}: }{If any number >0 is provided,
#' that value will be set as N for every row.
#' **Note**: Computing N this way is incorrect and should be avoided
#' if at all possible.}
#' \item{\code{"sum"}: }{N will be computed as:
#' cases (N_CAS) + controls (N_CON), so long as both columns are present}.
#' \item{\code{"ldsc"}: }{N will be computed as effective sample size:
#' Neff =(N_CAS+N_CON)*(N_CAS/(N_CAS+N_CON)) / mean((N_CAS/(N_CAS+N_CON))(N_CAS+N_CON)==max(N_CAS+N_CON))}.
#' \item{\code{"giant"}: }{N will be computed as effective sample size:
#' Neff = 2 / (1/N_CAS + 1/N_CON)}.
#' \item{\code{"metal"}: }{N will be computed as effective sample size:
#' Neff = 4 / (1/N_CAS + 1/N_CON)}.
#' }
#' @inheritParams filter_snps
#' @inheritParams MungeSumstats::compute_nsize
#' @importFrom stats setNames
#' @importFrom data.table setnames
#' @importFrom utils packageVersion
#' @export
#' @examples
#' dat <- echodata::BST1
#' dat2 <- echodata::get_sample_size(dat = dat)
get_sample_size <- function(dat,
                            compute_n = c("ldsc", "giant", "metal", "sum"),
                            return_only = NULL,
                            force_new = FALSE,
                            standardise_headers = FALSE,
                            verbose = TRUE,
                            ...){
  
    requireNamespace("MungeSumstats")
    if(utils::packageVersion("MungeSumstats")<"1.3.14"){
        stp <- "echodata requires MungeSumstats >=1.3.14"
        stop(stp)
    } 
    messager("Preparing sample size column (N).", v=verbose)
    if("N" %in% colnames(dat) && isFALSE(force_new)){
        if(!is.null(return_only)){
            return(return_only(dat$N, ...))
        }
        return(dat)
    } 
    #### Check method ### 
    if(is.null(compute_n)){
      compute_n <- "ldsc" 
    } else if(is.character(compute_n)) {
      compute_n <- tolower(compute_n)[1]
    } 
    dat2 <- data.table::copy(dat)
    if("N_controls" %in% colnames(dat2)){
      data.table::setnames(dat2,"N_controls","N_CON")
    }
    if("N_cases" %in% colnames(dat2)){
      data.table::setnames(dat2,"N_cases","N_CAS")
    }
    dat2 <- MungeSumstats::compute_nsize(
        sumstats_dt = dat2,
        compute_n = compute_n, 
        return_list = FALSE,
        standardise_headers = standardise_headers,
        force_new = force_new) 
    #### Rename Neff to N ####
    if((!"N" %in% colnames(dat2)) | isTRUE(force_new)){
      if("Neff" %in% colnames(dat2)){
        data.table::setnames(dat2,"Neff","N")
      } 
    }  
    dat2 <- mungesumstats_to_echolocatoR(
        dat=dat2,
        verbose=verbose)  
    #### Return ####
    if(!is.null(return_only)){
        if("N" %in% names(dat2)){
            return(return_only(dat2$N, ...))
        } else {
            return(NULL)
        } 
    } 
    return(dat2)
}
