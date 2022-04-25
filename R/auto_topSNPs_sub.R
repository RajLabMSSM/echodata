#' Automatically identify top SNP per locus
#'
#'  If no \code{topSNPs} dataframe is supplied,
#'  this function will sort by p-value and then effect size,
#'  and use the SNP in the first row.
#'
#' @param topSNPs Output of \link[echodata]{import_topSNPs}.
#' @param query Summary stats subset.
#' @param locus Locus name.
#' 
#' @family standardization functions
#' @importFrom dplyr %>% arrange mutate desc group_by slice
#' @keywords internal
auto_topSNPs_sub <- function(topSNPs,
                             query,
                             locus){
  Locus <- Effect <- P <- NULL;

  if(toString(topSNPs)=="auto"){
    topSNPs <- query %>% dplyr::mutate(Locus=locus) %>%
      dplyr::arrange(P,
                     dplyr::desc(Effect)) %>%
      dplyr::group_by(Locus) %>%
      dplyr::slice(1)
  }
  topSNP_sub <- topSNPs[(topSNPs$Locus==locus) &
                           (!is.na(topSNPs$Locus)),][1,]
  return(topSNP_sub)
}
