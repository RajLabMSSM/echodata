#' Is local
#' 
#' Determine whether a file exist locally.
#' @param path Path to local file or remote URL.
#' @export
#' @examples
#' echodata::is_local(
#'     path="https://github.com/RajLabMSSM/echotabix/raw/main/README.md"
#' )
is_local <- function(path) {
    # ssh.utils::file.exists.remote(file = path) # Doesn't work?
    (!is_url(path)) && (file.exists(path))
}
