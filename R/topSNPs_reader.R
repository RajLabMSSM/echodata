#' topSNPs_reader
#' 
#' @keywords internal
#' @importFrom openxlsx read.xlsx
#' @importFrom data.table fread
topSNPs_reader <- function(topSS,
                           sheet = 1){
    if(is.data.frame(topSS)){
        return(data.frame(topSS, check.names = FALSE))
    } else{
        if(endsWith(topSS, ".xlsx") | endsWith(topSS, ".xlsm")){
            topSS <- openxlsx::read.xlsx(topSS,
                                         sheet = sheet,
                                         # sep.names=" ",
                                         # Only in some versions?
                                         check.names = FALSE)
        } else {
            topSS <- data.table::fread(file=topSS,
                                       header = TRUE,
                                       stringsAsFactors = FALSE,
                                       nThread=1)
        }
        return(topSS)
    }
}
