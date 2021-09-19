#' get data via \pkg{piggyback}
#' 
#' @keywords internal
#' @importFrom piggyback pb_download
get_data <- function(fname,
                     repo = "RajLabMSSM/echodata",
                     overwrite = FALSE){
    tmp <- file.path(tempdir(),fname)
    if(!file.exists(tmp)){
        # options(timeout = 5*60)
        piggyback::pb_download(file = fname,
                               dest = tmp,
                               repo = repo, 
                               overwrite = overwrite)
    }
    return(tmp)
}