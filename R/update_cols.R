#' Update CS cols
#'
#' Convert old column format: ".Credible_Set" => ".CS"
#' 
#' @param dat Fine-mapping results data.
#' @export
#' @examples
#' dat <- echodata::update_cols(dat = echodata::BST1) 
update_cols <- function(dat) {
    colnames(dat) <- gsub("*.Credible_Set$", ".CS", colnames(dat))
    colnames(dat) <- gsub("*.Probability$", ".PP", colnames(dat))
    return(dat)
}
