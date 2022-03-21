#' Check if a file is empty
#' 
#' Check if a summary statistics file subset is empty.
#' @param path File path. 
#' @return Boolean.
#' @family general
#' @export
#' @importFrom data.table fread
#' @examples 
#' tmp <- tempfile()
#' data.table::fwrite(echodata::BST1, tmp)
#' 
#' echodata::check_if_empty(path = tmp)
check_if_empty <- function(path){
    
  rowCheck <- dim(data.table::fread(path, 
                                    nrows = 2, 
                                    nThread = 1))[1]
  if(rowCheck==0){
      stop_msg <- paste("No SNPs identified within the summary stats file",
                        "that met your criterion. :o")
    stop(stop_msg)
  } else {messager("Subset file looks good.")}
}

