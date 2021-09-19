#' Convert from \pkg{MungeSumstats} to \pkg{echolocatoR} format
#'
#' @examples
#' \dontrun{
#' eduAttainOkbayPth <- system.file("extdata","eduAttainOkbay.txt",
#'                                  package="MungeSumstats")
#' reformatted <- MungeSumstats::format_sumstats(path=eduAttainOkbayPth,
#'                                               ref_genome="GRCh37", 
#'                                               return_data = TRUE)
#' dat_echoR <- MUNGESUMSTATS.to_echolocatoR(dat=reformatted)
#' }
#' @keywords internal
#' @importFrom data.table data.table setnames
MUNGESUMSTATS.to_echolocatoR <- function(dat){
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
