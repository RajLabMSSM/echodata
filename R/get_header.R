#' Get file header
#' 
#' Reading in this way is more robust and able to handle bgz format.
#' 
#' @param colnames_only Whether to return only column names 
#' (default: \code{TRUE}), or the first \code{n} rows as well.
#' @inheritParams data.table::fread
#' @inheritParams base::readLines
#' @export
get_header <- function(file,
                       colnames_only=TRUE,
                       n=2,
                       nThread=1){
  ### Reading in this way is more robust and able to handle bgz format.
  header <- data.table::fread(text=readLines(con = file, n = n),
                              nThread = nThread)
  if(colnames_only) header <- colnames(header)
  return(header)
}



