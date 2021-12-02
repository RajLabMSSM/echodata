#' Interactive DT
#'
#' Generate an interactive data table with download buttons.
#'
#' @param dat Data to show.
#' @param caption Table caption.
#' @param scrollY Maximum height (in pixels) before defaulting to scrolling.
#' 
#' @family general
#' @export
#' @importFrom DT datatable
#' @examples  
#' echodata::createDT(dat = echodata::BST1)
createDT <- function(dat, 
                     caption="", 
                     scrollY=400){
    data <- DT::datatable(
      data = dat, 
      caption=caption,
      extensions = 'Buttons',
      options = list( dom = 'Bfrtip',
                      buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
                      scrollY = scrollY, 
                      scrollX=TRUE, scrollCollapse = TRUE, paging = FALSE,
                      columnDefs = list(list(className = 'dt-center', 
                                             targets = "_all"))
      )
    )
    return(data)
}
