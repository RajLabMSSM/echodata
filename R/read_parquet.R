#' Read parquet file
#' 
#' Import a file in parquet format (from python) as a
#' \link[data.table]{data.table} in R.
#' @param path Path to parquet file. 
#' @param verbose Print messages.
#' @inheritParams echoconda::yaml_to_env
#' @inheritParams echoconda::activate_env
#'  
#' @export
#' @examples 
#' #path <- system.file(
#' #    "tools/polyfun/example_data/weights.10.l2.ldscore.parquet",
#' #    package = "echofinemap")
#' 
#' #### Write a parquet file ####
#' dat <- echodata::BST1
#' path <- echodata::write_parquet(dat)
#' #### Read the parquet file back into R ####
#' dat2 <- echodata::read_parquet(path=path)
read_parquet <- function(path,
                         conda_env="echoR",
                         conda = "auto",
                         # method="pandas",
                         verbose=TRUE){
    # if(tolower(method)=="sparkr"){
    #     requireNamespace("SparkR")
    #     messager("+ Importing parquet file with `SparkR (R)`",v=verbose)
    #     SparkR::sparkR.session()
    #     parquor <- SparkR::read.parquet(path)
    #     parquor <- SparkR::as.data.frame(parquor) 
    # } else {
        requireNamespace("echoconda")
        requireNamespace("reticulate")
        messager("+ Importing parquet file with `pandas (Python)`",v=verbose) 
        #### Create echoR conda env if you haven't already #### 
        conda_env <- echoconda::yaml_to_env(conda = conda, 
                                            verbose = FALSE) 
        echoconda::activate_env(conda_env = conda_env)
        pd <- reticulate::import("pandas")
        parquor <- pd$read_parquet(path)
    # }
    return(data.table::data.table(parquor))
}
