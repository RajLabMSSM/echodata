#' Download files from GitHub
#'
#' @keywords internal
#' @importFrom stringr str_split
#' @importFrom parallel detectCores mclapply
#' @importFrom utils download.file 
github_download_files <- function(filelist,
                                  download_dir = tempdir(),
                                  overwrite = FALSE,
                                  timeout = 5*60,
                                  nThread = 1,
                                  verbose = TRUE) {
    messager("+ Downloading", length(filelist), "files...", v = verbose)
    local_files <- parallel::mclapply(stats::setNames(filelist,
                                                      filelist), 
                                             function(x) {
        message_parallel(paste("Downloading:", x))
        branch <- stringr::str_split(string = x, pattern = "/")[[1]][7]
        folder_structure <- paste(stringr::str_split(
            string = x,
            pattern = "/"
        )[[1]][-c(seq_len(7))], collapse = "/")
        destfile <- gsub("/www/data", "", file.path(
            download_dir,
            folder_structure
        ))
        dir.create(dirname(destfile),
            showWarnings = FALSE,
            recursive = TRUE
        )
        if (!file.exists(destfile) & overwrite == FALSE) {
            options(timeout = timeout)
            utils::download.file(url = x, 
                                 destfile = destfile)
        }
        return(destfile)
    }, mc.cores = nThread)
    return(local_files)
}
