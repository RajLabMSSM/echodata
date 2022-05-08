#' Import metadata
#'
#' Import metadata for all fine-mapping results files stored on
#'  the \href{https://github.com/RajLabMSSM/Fine_Mapping_Shiny}{
#' echolocatoR Fine-mapping Portal}.
#'
#' @param verbose Print messages.
#' @param timeout Number of seconds before timeout.
#' @examples
#' meta <- portal_metadata()
#' @export
#' @importFrom data.table fread
portal_metadata <- function(verbose = TRUE,
                            timeout = 60) {
    messager("Fetching echolocatoR Fine-mapping Portal study metadata.",
        v = verbose
    )
    options(timeout = timeout)
    meta <- data.table::fread(
        paste(
            "https://github.com/RajLabMSSM/Fine_Mapping_Shiny",
            "raw/master/www/metadata/study_metadata.csv.gz",
            sep = "/"
        )
    )
    return(meta)
}
