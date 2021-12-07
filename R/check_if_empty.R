#' Check if a file is empty
#' 
#' Check if a summary statistics file subset is empty.
#' @param file_path File path. 
#' @return Boolean.
#' @family general
#' @export
#' @importFrom data.table fread
#' @examples 
#' tmp <- tempfile()
#' data.table::fwrite(data.table::data.table(), tmp)
#' 
#' is_empty <- echodata::check_if_empty(file_path = tmp)
check_if_empty <- function(file_path){
    
  rowCheck <- dim(data.table::fread(file_path, 
                                    nrows = 2, 
                                    nThread = 1))[1]
  if(rowCheck==0){
      stop_msg <- paste("No SNPs identified within the summary stats file",
                        "that met your criterion. :o")
    stop(stop_msg)
  } else {messager("Subset file looks good.")}
}

