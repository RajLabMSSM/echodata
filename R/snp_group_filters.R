#' Get SNP group filters
#' 
#' Returns a character vector of filtering arguments for different SNP groups.
#' 
#' @param invert Reverse the list.
#' @param random_sample_size Sample size for random SNP subset ("Random").
#' @export
#' @importFrom stats setNames
#' @examples 
#' filts <- echodata::snp_group_filters()
snp_group_filters <- function(invert=FALSE,
                              random_sample_size=20){
  if(is.null(random_sample_size)) random_sample_size <- 100
  snp_filters <-
    c("Random" = paste0("SNP %in% sample(sampling_df$SNP, size=",
                        random_sample_size,")"),
      "All" = "!is.na(SNP)",
      "GWAS nom. sig."="P<0.05",
      "GWAS sig."="P<5e-8",
      "GWAS lead" = "leadSNP==TRUE",

      "ABF CS"="ABF.CS>0",
      "SUSIE CS"="SUSIE.CS>0",
      "POLYFUN-SUSIE CS"="POLYFUN_SUSIE.CS>0",
      "FINEMAP CS"="FINEMAP.CS>0",
      "UCS (-PolyFun)"="Support_noPF>0",
      "UCS"="Support>0",

      "Support==0"="Support==0",
      "Support==1"="Support==1",
      "Support==2"="Support==2",
      "Support==3"="Support==3",
      "Support==4"="Support==4",

      "Consensus (-PolyFun)"="Consensus_SNP_noPF==TRUE",
      "Consensus"="Consensus_SNP==TRUE"
    )
  if(invert)  snp_filters <- stats::setNames(names(snp_filters),
                                             unname(snp_filters))
  return(snp_filters)
}
