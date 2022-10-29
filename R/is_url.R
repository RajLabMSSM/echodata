#' Check if the input is url e.g. http:// or ftp://
#' @param path Path to local file or remote URL.
#' @param protocols URL protocols to search for.
#' @source \href{https://rdrr.io/cran/seqminer/src/R/seqminer.R}{
#' Borrowed from \code{seqminer} internal function}
#' @export
#' @examples 
#' path <- "https://github.com/RajLabMSSM/echolocatoR/raw/master/NEWS.md"
#' out <- is_url(path=path)
is_url <- function(path,
                   protocols=c("http","https",
                               "ftp","ftps",
                               "fttp","fttps")) {
    
    pattern <- paste(paste0("^",protocols,"://"),collapse = "|")
    if (grepl(pattern = pattern, x = path, ignore.case = TRUE)) {
        return(TRUE)
    }
    return(FALSE)
}
