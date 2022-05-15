#' Convert from \pkg{MungeSumstats} to \pkg{echolocatoR} format
#' 
#' Convert column names between package-specific formats.
#' Optionally, can also be used to first automatically 
#' standardise column names by 
#' setting \code{standardise_colnames=TRUE} before converting to 
#' \pkg{echolocatoR} format.
#' 
#' @param dat A \link[data.table]{data.table} of SNP-level summary statistics. 
#' @param standardise_colnames Automatically rename all columns to a standard 
#' nomenclature using \link[MungeSumstats]{standardise_header}.
#' @param verbose Print messages.
#' 
#' @export
#' @importFrom data.table data.table setnames
#' 
#' @examples  
#' dat <- dplyr::rename(echodata::BST1, BPOS=POS, SEBETA=StdErr, B=Effect)
#' dat_echoR <- echodata::mungesumstats_to_echolocatoR(dat=dat, 
#'                                                     standardise_colnames=TRUE)
mungesumstats_to_echolocatoR <- function(dat, 
                                         standardise_colnames = FALSE, 
                                         verbose = TRUE){
    
    messager("+ Mapping colnames from MungeSumstats ==> echolocatoR",
             v=verbose)
    dat <- data.table::data.table(dat)
    if(isTRUE(standardise_colnames)){ 
        dat <- MungeSumstats::standardise_header(
            sumstats_dt = dat, 
            uppercase_unmapped = TRUE,
            return_list = FALSE)
    } 
    colMap <- c("BP"="POS",
                "FRQ"="Freq",
                "FREQ"="Freq",
                "BETA"="Effect",
                "EFFECT"="Effect",
                "SE"="StdErr",
                "STDERR"="StdErr",
                "N_CAS"="N_cases",
                "N_CON"="N_controls",
                "SUPPORT"="Support",
                "LEADSNP"="leadSNP",
                "CONSENSUS_SNP"="Consensus_SNP",
                "PROPORTION_CASES"="proportion_cases",
                "MEAN.CS"=" mean.CS",
                "MEAN.PP"=" mean.PP"
                )
    colMap <- colMap[names(colMap) %in% colnames(dat)]
    for(x in names(colMap)){
        ### If not already an existing col, rename
        if(!colMap[[x]] %in% names(colMap)){
            data.table::setnames(dat, x, colMap[[x]])
        }
    }
    return(dat)
}
