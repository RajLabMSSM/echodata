#' Check if a file is empty
#' 
#' Check if a summary statistics file subset is empty.
#' @param path File path. 
#' @param error Throw an error if the file is empty.
#' @param verbose Print messages.
#' @returns Boolean.
#' 
#' @family general
#' @export
#' @importFrom data.table fread
#' @examples 
#' tmp <- tempfile()
#' data.table::fwrite(echodata::BST1, tmp)
#' empty <- echodata::is_empty(path = tmp)
is_empty <- function(path,
                     error=TRUE,
                     verbose=TRUE){
    
    if(!file.exists(path)){
        msg <- "File does not exist."
        if(isTRUE(error)){
            stop(msg)
        } else {
            messager(msg,v=verbose)
        }
        return(TRUE)
    }
  rowCheck <- dim(data.table::fread(path, 
                                    nrows = 2, 
                                    nThread = 1))[1]
  if(rowCheck==0){
      stp2 <- paste(
          "No SNPs identified within the summary stats file",
          "that met your criterion. :o")
    if(isTRUE(error)){
        stop(stp2)
    } else {
        messager(stp2,v=verbose)
    }
    return(TRUE)
  } else {
      messager("Subset file looks good.",v=verbose)
      return(FALSE)
  }
}

