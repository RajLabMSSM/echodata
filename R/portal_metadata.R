#' Import metadata
#'
#' Import metadata for all fine-mapping results files stored on
#'  the \href{https://github.com/RajLabMSSM/Fine_Mapping_Shiny}{
#' echolocatoR Fine-mapping Portal}.
#'
#' @param verbose Print messages.
#'
#' @examples
#' meta <- portal_metadata()
#' @export
#' @importFrom data.table fread
portal_metadata <- function(verbose = TRUE) {
    messager("Fetching echolocatoR Fine-mapping Portal study metadata.",
        v = verbose
    )
    meta <- data.table::fread(
        file.path(
            "https://github.com/RajLabMSSM/Fine_Mapping_Shiny",
            "raw/master/www/metadata/study_metadata.csv.gz"
        )
    )
    return(meta)
}
