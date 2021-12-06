#' Melt fine-mapping results
#' 
#' Melt fine-mapping results into long format such that 
#' "\*.CS" and "\*.PP" columns from multiple methods are now in a single column.
#' 
#' @param dat Fine-mapping results data.
#' @param verbose Print messages.
#' 
#' @return Melted \link[data.table]{data.table}
#' @export
#' @importFrom data.table melt.data.table data.table
#' @importFrom stats setNames
#' @examples 
#' finemap_melt <- echodata::melt_finemapping_results(dat = echodata::BST1)
melt_finemapping_results <- function(dat,
                                     verbose=TRUE){
    PP_cols <- grep("\\.PP$",colnames(dat), value = TRUE)
    CS_cols <- grep("\\.CS$",colnames(dat), value = TRUE)
    messager("Melting PP and CS from",length(CS_cols),
            "fine-mapping methods.",v=verbose)
    finemap_melt <- suppressWarnings(
        data.table::melt.data.table(data.table::data.table(dat),
                                    measure.vars =list(PP_cols, CS_cols),
                                    variable.name = "Method",
                                    variable.factor = TRUE,
                                    value.name = c("PP","CS"))
    )
    methods_key <- stats::setNames(gsub("\\.PP","",PP_cols),
                                   unique(finemap_melt$Method))
    finemap_melt$Method <- factor(methods_key[finemap_melt$Method],
                                  levels = unname(methods_key), 
                                  ordered = TRUE)
    return(finemap_melt)
}