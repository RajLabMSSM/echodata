#' Check if the input is url e.g. http:// or ftp://
#' @param fileName character vector
#' @param protocols URL protocols to search for.
#' @source \href{https://rdrr.io/cran/seqminer/src/R/seqminer.R}{
#' Borrowed from \code{seqminer} internal function}
#' @export
#' @examples 
#' fileName <- "https://github.com/RajLabMSSM/echolocatoR/raw/master/NEWS.md"
#' out <- is_url(fileName=fileName)
is_url <- function(fileName,
                   protocols=c("http","https",
                               "ftp","ftps",
                               "fttp","fttps")) {
    
    pattern <- paste(paste0("^",protocols,"://"),collapse = "|")
    if (grepl(pattern =pattern, fileName)) {
        return(TRUE)
    }
    return(FALSE)
}
