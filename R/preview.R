#' Preview formatted sum stats saved to disk
#'
#' Prints the first \code{nrows} lines of the sum stats.
#'
#' @return No return
#'
#' @inheritParams data.table::fread
#' @export
#' @importFrom utils capture.output
preview <- function(file,
                    nrows = 5L,
                    nThread = 1L) {  
    header <-  get_header(file = file, 
                          colnames_only = FALSE,
                          nrows = nrows, 
                          nThread = nThread) 
    message(paste0(capture.output(header), collapse = "\n"))
}
