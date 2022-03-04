#' Read parquet file
#' 
#' Import a file in parquet format (from python) as a
#' \link[data.table]{data.table} in R.
#' @param path Path to parquet file.
#' @param method Method to read parquet with:
#' \itemize{
#' \item{"pandas"}{Python package,
#'  but can be imported via \link[reticulate]{import.}}
#' \item{"SparkR"}{R package,
#'  but requires installation of SQL first.}
#' }
#' @param verbose Print messages.
#' @inheritParams echoconda::yaml_to_env
#' 
#' @export
#' @importFrom echoconda yaml_to_env
#' 
#' @examples
#' path <- system.file(
#'     "tools/polyfun/example_data/weights.10.l2.ldscore.parquet",
#'     package = "echofinemap")
#' parq <- echofinemap::read_parquet(path=path)
read_parquet <- function(path,
                         conda_env="echoR",
                         conda = "auto",
                         method="pandas",
                         verbose=TRUE){
    if(tolower(method)=="sparkr"){
        requireNamespace("SparkR")
        messager("+ Importing parquet file with `SparkR (R)`",v=verbose)
        SparkR::sparkR.session()
        parquor <- SparkR::read.parquet(path)
        parquor <- SparkR::as.data.frame(parquor) 
    } else {
        messager("+ Importing parquet file with `pandas (Python)`",v=verbose) 
        #### Create echoR conda env if you haven't already #### 
        conda_env <- echoconda::yaml_to_env(conda = conda, 
                                            verbose = verbose) 
        echoconda::activate_env(conda_env = conda_env)
        pd <- reticulate::import("pandas")
        parquor <- pd$read_parquet(path)
    }
    return(data.table::data.table(parquor))
}
