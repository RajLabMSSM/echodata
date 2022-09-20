#' Is an object of class ggbio
#'
#' Check whether an object is of the class \code{ggbio}.
#' @param obj Any R object.
#' @returns Boolean.
#' @export
#' @importFrom methods is
#' @examples 
#' bool <- echodata::is_ggbio(mtcars)
is_ggbio <- function(obj) {
    methods::is(obj, "GGbio")
}
