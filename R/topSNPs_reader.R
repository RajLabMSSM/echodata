#' Read in top SNPs
#' 
#' Read in topSNPs (from disk). 
#' @inheritParams openxlsx::read.xlsx
#' @inheritDotParams openxlsx::read.xlsx
#' 
#' @keywords internal
#' @importFrom openxlsx read.xlsx
#' @importFrom data.table fread
topSNPs_reader <- function(topSS,
                           sheet=1,
                           startRow=1,
                           cols,
                           ...){
    if(is.data.frame(topSS)){
        return(data.frame(topSS, check.names = FALSE))
    } else{
        if(endsWith(topSS, ".xlsx") |
           endsWith(topSS, ".xlsm")){
            topSNPs <- openxlsx::read.xlsx(topSS,
                                           sheet = sheet,
                                           sep.names = " ", 
                                           startRow = startRow,
                                           cols = cols,
                                           # Only in some versions?
                                           check.names = FALSE,
                                           ...)
        } else {
            topSNPs <- data.table::fread(file=topSS,
                                         header = TRUE,
                                         stringsAsFactors = FALSE,
                                         check.names = FALSE,
                                         skip = startRow-1,
                                         nThread=1)
        }
        return(topSNPs)
    }
}
