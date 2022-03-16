#' Write parquet file
#' 
#' Export a \link[base]{data.frame} to parquet format.
#' @param dat \link[base]{data.frame}. 
#' @param path Path to write parquet file to. 
#' @param verbose Print messages.
#'  
#' @export
#' @examples
#' dat <- echodata::BST1
#' path <- echodata::write_parquet(dat = dat) 
write_parquet <- function(dat,
                          path = tempfile(fileext = ".parquet"),
                          verbose = TRUE){
    requireNamespace("arrow") 
    messager("Writing parquet file ==>",path,v=verbose) 
    arrow::write_parquet(x = dat, 
                         sink = path) 
    return(path)
}
