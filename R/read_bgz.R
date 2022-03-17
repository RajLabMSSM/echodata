#' Read bgz
#' 
#' Read a compressed bgz file into R.
#' 
#' @param ... Additional arguments passed to \link[data.table]{fread}.
#' @inheritParams data.table::fread
#' @export
#' @examples 
#' tmp <- tempfile(fileext = ".tsv.gz")
#' data.table::fwrite(echodata::BST1, file = tmp, sep = "\t")
#' file <- Rsamtools::bgzip(file = tmp, overwrite=TRUE)
#' dat <- echodata::read_bgz(file=file)
read_bgz <- function(file,
                     nrows=-1L,
                     nThread=1, 
                     verbose=TRUE,
                     ...){  
    messager("Reading bgzipped file.",v=verbose) 
    dat <- data.table::fread(text= readLines(con = file, n = nrows),
                             check.names = FALSE,
                             nThread = nThread, 
                             ...)
    return(dat)
}
