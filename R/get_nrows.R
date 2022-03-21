#' Get nrows
#' 
#' Get the number of rows of a large file without reading it into memory.
#' @param path Path to file saved on disk.
#' @family general
#' @export
get_nrows <- function(path){
    messager("+ Calculating the number of rows in",basename(path),"...")
    if(endsWith(path,".gz")){
        out <- system(paste("zcat",path,"| wc -l"), intern=TRUE)
    } else {
        out <- system(paste("wc -l",path), intern=TRUE)
    }
    file_nrows <- as.numeric(strsplit(out," ")[[1]][1])
    messager("++ File contains",file_nrows,"rows.")
    return(file_nrows)
}
