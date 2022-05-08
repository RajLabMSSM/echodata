#' get data via \pkg{piggyback}
#' 
#' @keywords internal
#' @importFrom piggyback pb_download
#' @importFrom tools R_user_dir
get_data <- function(fname,
                     repo = "RajLabMSSM/echodata",
                     save_dir = tools::R_user_dir(package = "echodata",
                                                  which = "cache"),
                     overwrite = FALSE){
    
    tmp <- file.path(save_dir,fname)
    if(!file.exists(tmp)){
        Sys.setenv("piggyback_cache_duration"=10)
        dir.create(save_dir,showWarnings = FALSE, recursive = TRUE)
        piggyback::pb_download(file = fname,
                               dest = save_dir,
                               repo = repo, 
                               overwrite = overwrite)
    }
    return(tmp)
}
