#' Automatically identify top SNP per locus
#'
#'  If no \code{top_SNPs} dataframe is supplied,
#'  this function will sort by p-value and then effect size,
#'  and use the SNP in the first row.
#'
#' @family standardization functions
#' @importFrom dplyr %>% arrange mutate desc group_by slice
auto_topSNPs_sub <- function(top_SNPs,
                             query,
                             locus){
  Locus <- Effect <- P <- NULL;

  if(toString(top_SNPs)=="auto"){
    top_SNPs <- query %>% dplyr::mutate(Locus=locus) %>%
      dplyr::arrange(P,
                     dplyr::desc(Effect)) %>%
      dplyr::group_by(Locus) %>%
      dplyr::slice(1)
  }
  topSNP_sub <- top_SNPs[(top_SNPs$Locus==locus) &
                           (!is.na(top_SNPs$Locus)),][1,]
  return(topSNP_sub)
}
