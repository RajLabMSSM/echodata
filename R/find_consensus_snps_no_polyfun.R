#' Find Consensus SNPs: without PolyFun
#'
#' Find Consensus SNPs in \link[echolocatoR]{finemap_loci} output, without 
#' using any results from the functional fine-mapping tool PolyFun 
#' (in a new column "Consensus_SNP_noPF"). 
#' This helps to avoid any circularity when validating results with functional 
#' annotation that PolyFun may have been trained on.
#' 
#' @inheritParams find_consensus_snps
#' @family echolocatoR
#' @export
#' @importFrom dplyr %>% arrange desc
#' @examples
#' BST1 <- echodata::find_consensus_snps_no_polyfun(dat = echodata::BST1)
find_consensus_snps_no_polyfun <- function(dat,
                                           verbose=TRUE){
  messager("Identifying UCS and Consensus SNPs without PolyFun",v=verbose)
  newDF <- find_consensus_snps(dat,
                               exclude_methods = "POLYFUN_SUSIE",
                               sort_by_support = FALSE)
  dat$Consensus_SNP_noPF <- newDF$Consensus_SNP
  dat$Support_noPF <- newDF$Support
  return(dat)
}
