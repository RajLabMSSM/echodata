#' Read parquet file
#' 
#' Import a file in parquet format as a
#' \link[data.table]{data.table}.
#' @param path Path to parquet file. 
#' @param verbose Print messages. 
#' @inheritDotParams arrow::read_parquet
#'  
#' @export
#' @examples  
#' #### Write a parquet file ####
#' dat <- echodata::BST1
#' path <- echodata::write_parquet(dat)
#' #### Read the parquet file back into R ####
#' dat2 <- echodata::read_parquet(path=path)
read_parquet <- function(path,
                         verbose=TRUE,
                         ...){ 
    
    if(!requireNamespace("arrow", quietly = TRUE)){
        stop("The 'arrow' package is required for parquet support. ",
             "Install with: install.packages('arrow')")
    }
    messager("Reading parquet file.",v=verbose)
    parquor <- tryCatch({
        arrow::read_parquet(file = path, ...)
    }, error = function(e){
        stop("arrow::read_parquet failed: ", conditionMessage(e),
             "\nIf this is a segfault, try: arrow::install_arrow()")
    })
    return(data.table::data.table(parquor))
}
