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
    if(!requireNamespace("arrow", quietly = TRUE)){
        stop("The 'arrow' package is required for parquet support. ",
             "Install with: install.packages('arrow')")
    }
    ## arrow can segfault in certain contexts (e.g. devtools::test on
    ## Apple Silicon). Wrap in tryCatch to give an informative message.
    messager("Writing parquet file ==>",path,v=verbose)
    tryCatch({
        arrow::write_parquet(x = dat,
                             sink = path)
    }, error = function(e){
        stop("arrow::write_parquet failed: ", conditionMessage(e),
             "\nIf this is a segfault, try: arrow::install_arrow()")
    })
    return(path)
}
