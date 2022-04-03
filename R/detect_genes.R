#' Detect QTL genes in full summary stats file
#'
#' Allows summary stats from different genes to be
#' fine-mapped separately.
#' 
#' @export
#' @importFrom dplyr n_distinct
#' @examples
#' #### No genes (names) ####
#' loci <- c("BST1","LRKR2","MEX3C")
#' detect_genes(loci)
#' 
#' #### Genes (names) ####
#' loci <- c(BST1="BST1", LRRK2="LRRK2", MEX3C="MEX3C")
#' echodata::detect_genes(loci)
detect_genes <- function(loci,
                         verbose=FALSE){
  if(!is.null(names(loci))){
    messager("Fine-mapping",dplyr::n_distinct(loci),
             "gene:Locus pairs.", v=verbose)
    return(TRUE)
  } else {
      messager("Fine-mapping",dplyr::n_distinct(loci),
                   "loci.", v=verbose) 
      return(FALSE)
  }
}
