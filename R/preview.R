#' Preview formatted sum stats saved to disk
#'
#' Prints the first \code{nrows} lines of the sum stats.
#' @param path Path to local file or remote URL. 
#' Alternatively, can pass in a data.frame to be used directly.
#' @return No return
#'
#' @inheritParams get_header
#' @inheritParams data.table::fread
#' @export
#' @importFrom utils capture.output
#' @importFrom methods is
preview <- function(path,
                    nrows = 5L,
                    nThread = 1L) {  
    if(methods::is(path,"data.frame")){
        header <- head(path, n = nrows)
    } else {
        header <- get_header(path = path, 
                             colnames_only = FALSE,
                             nrows = nrows, 
                             nThread = nThread) 
    }
    #### Print table nicely####
    message(paste0(capture.output(header), collapse = "\n"))
}
