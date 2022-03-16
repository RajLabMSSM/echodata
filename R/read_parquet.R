#' Read parquet file
#' 
#' Import a file in parquet format as a
#' \link[data.table]{data.table}.
#' @param path Path to parquet file. 
#' @param verbose Print messages. 
#'  
#' @export
#' @examples  
#' #### Write a parquet file ####
#' dat <- echodata::BST1
#' path <- echodata::write_parquet(dat)
#' #### Read the parquet file back into R ####
#' dat2 <- echodata::read_parquet(path=path)
read_parquet <- function(path,
                         verbose=TRUE){ 
    requireNamespace("arrow") 
    messager("Reading parquet file.",v=verbose) 
    parquor <- arrow::read_parquet(file = path)
    return(data.table::data.table(parquor))
}
