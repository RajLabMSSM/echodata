#' Map column names to positions.
#'
#' Useful in situations where you need to specify columns by index 
#' instead of name (e.g. awk queries).
#'
#' @param path Path to full summary stats file
#' (or any really file you want to make a column dictionary for).
#' @return Named list of column positions.
#' @export
#' @importFrom stats setNames
#' @examples 
#' tmp <- tempfile()
#' data.table::fwrite(echodata::BST1, tmp)
#' cdict <- echodata::column_dictionary(path = tmp)
column_dictionary <- function(path){
  # Get the index of each column name
  cNames <- get_header(path = path, colnames_only = TRUE)
  colDict <- stats::setNames(seq(1,length(cNames)), cNames)
  return(colDict)
}


