#' Is an object of class ggplot
#'
#' Check whether an object is of the class \code{ggplot}.
#' @param obj Any R object.
#' @returns Boolean.
#' @export
#' @importFrom methods is
#' @examples 
#' bool <- echodata::is_ggplot(mtcars)
is_ggplot <- function(obj) {
    # methods::is(obj, "ggplot")
    inherits(obj, "ggplot") 
}
