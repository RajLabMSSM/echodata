#' Write parquet file
#' 
#' Export a \link[data.table]{data.table} to parquet format (from python).
#' @param path Path to write parquet file to. 
#' @param verbose Print messages.
#' @inheritParams echoconda::yaml_to_env
#'  
#' @export
#' @examples
#' dat <- echodata::BST1
#' path <- echofinemap::write_parquet(dat = dat)
write_parquet <- function(dat,
                          path = tempfile(fileext = ".parquet"),
                          conda = "auto",
                          verbose = TRUE){
    requireNamespace("echoconda")
    #### Create echoR conda env if you haven't already #### 
    conda_env <- echoconda::yaml_to_env(conda = conda, 
                                        verbose = FALSE) 
    echoconda::activate_env(conda_env = conda_env)
    pd <- reticulate::import("pandas")
    #### Convert data to python format ####
    dat <- reticulate::r_to_py(echodata::BST1)
    message("Writing file ==>",path,v=verbose)
    dat$to_parquet(path)
    return(path)
}
