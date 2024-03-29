#' Find the top Consensus SNP
#'
#' Identify the \code{n_top} Consensus SNP(s) per Locus,
#' defined as the Consensus SNPs with the highest mean PP
#' across all fine-mapping tools used.
#' 
#' @param dat Fine-mapping results data.
#' @param n_top Number of top SNPs per locus to include.
#' @param grouping_vars Variables to group by when selecting top N rows.
#' 
#' @export
#' @importFrom dplyr %>% group_by arrange slice vars
#' @examples 
#' dat <- echodata::find_top_consensus(dat = echodata::BST1)
find_top_consensus <- function(dat,
                               n_top = 1,
                               grouping_vars = c("Locus")) {
    mean.PP <- Consensus_SNP <- NULL;
    #### Get top consensus SNPs ####
    top.consensus <- (dat %>%
                          dplyr::group_by(dplyr::vars(grouping_vars)) %>%
                          subset(Consensus_SNP) %>%
                          dplyr::arrange(-mean.PP) %>%
                          # dplyr::arrange(-IMPACT_score) %>%
                          # dplyr::mutate(topConsensus = ifelse(Consensus_SNP &
                          # mean.PP==max(mean.PP,na.rm = T),T,F)) %>%
                          dplyr::slice(n_top))$SNP %>% unique()
    dat$topConsensus <- dat$SNP %in% top.consensus
    return(dat)
}
