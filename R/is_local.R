#' Is local
#' 
#' Determine whether a file exist locally.
#' @inheritParams is_url
#' @export
#' @examples
#' echodata::is_local(
#'     path="https://github.com/RajLabMSSM/echotabix/raw/main/README.md"
#' )
is_local <- function(path,
                     protocols=c("http","https",
                                 "ftp","ftps",
                                 "fttp","fttps")) {
    # ssh.utils::file.exists.remote(file = path) # Doesn't work?
    (!is_url(path = path, 
             protocols = protocols)) && (file.exists(path))
}
