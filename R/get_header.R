#' Get file header
#' 
#' Reading in this way is more robust and able to handle bgz format.
#' 
#' @param colnames_only Whether to return only column names 
#' (default: \code{TRUE}), or the first \code{n} rows as well.
#' @inheritParams data.table::fread
#' @inheritParams base::readLines
#' @export
#' @examples 
#' tmp <- tempfile(fileext = ".tsv.gz")
#' data.table::fwrite(echodata::BST1, file = tmp, sep = "\t") 
#' header <- echodata::get_header(file=tmp)
get_header <- function(file,
                       colnames_only=TRUE,
                       nrows=2L,
                       nThread=1L){
  ### Reading in this way is more robust and able to handle bgz format.
  header <- data.table::fread(text=readLines(con = file,
                                             n = nrows+1L),
                              nThread = nThread)
  if(colnames_only) header <- colnames(header)
  return(header)
}
