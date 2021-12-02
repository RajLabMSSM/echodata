#' Convert from \pkg{MungeSumstats} to \pkg{echolocatoR} format
#' 
#' Convert column names between package-specific formats.
#' @param dat Data
#' @examples  
#' dat <- dplyr::rename(echodata::BST1, BP=POS, FRQ=Freq, BETA=Effect)
#' dat_echoR <- MUNGESUMSTATS.to_echolocatoR(dat=dat) 
#' @export
#' @importFrom data.table data.table setnames
MUNGESUMSTATS.to_echolocatoR <- function(dat){
    requireNamespace("data.table")
    messager("+ Mapping colnames from MungeSumstats ==> echolocatoR")
    dat <- data.table::data.table(dat)
    colMap <- c("BP"="POS",
                "FRQ"="Freq",
                "BETA"="Effect",
                "SE"="StdErr",
                "N_CAS"="N_cases",
                "N_CON"="N_controls")
    colMap <- colMap[names(colMap) %in% colnames(dat)]
    for(x in names(colMap)){
        data.table::setnames(dat, x, colMap[[x]])
    }
    return(dat)
}
