#' Find executable
#' 
#' Find the path to an executable binary for a given software.
#' @param path User-provided path to executable. 
#' Is \code{NULL} (default), an executable will be downloaded 
#' and stored automatically. 
#' @param verbose Print messages.
#' @keywords internal 
#' @returns Path to executable. 
#' 
#' @export
#' @importFrom methods show
#' @examples 
#' paths <- find_executable()
find_executable <- function(path = NULL,
                            tool = c("bcftools","gcta","plink"),
                            verbose = TRUE){
    tool <- tolower(tool) 
    if(is.null(path)){
        requireNamespace("genetics.binaRies") 
        path <- lapply(tool, function(x){
            if(x=="bcftools") {
                path <- genetics.binaRies::get_bcftools_binary()
            } else if(x=="gcta"){
                path <- genetics.binaRies::get_gcta_binary()
            } else if(x=="plink"){
                path <- genetics.binaRies::get_plink_binary()
            } else {
                stop("Tool must be one of:",
                         paste("\n -",eval(formals(find_executable)$tool),
                               collapse ="")
                         )
            }
            set_permissions(path = path,
                            verbose = verbose)
            return(path)
        }) |> `names<-`(tool)
    } 
    messager("Using executable(s):",
             methods::show(unlist(path)),
             v=verbose) 
    #### Check that tool works ####
    checks <- check_executable(path = path,
                               verbose = verbose) 
    return(path)
}
