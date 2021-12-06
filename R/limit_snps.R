#' Limit the number of SNPs per locus.
#'
#' Start with the lead SNP and keep expanding the window until you reach the desired number of snps.
#' \code{dat} should only contain one locus from one chromosome.
#'
#' @family SNP filters
#' @param max_snps The maximum number of SNPs to keep in the resulting data.frame.
#' @param dat A data.frame that contains at least the following columns:
#' \describe{
#'   \item{SNP}{RSID for each SNP.}
#'   \item{POS}{Each SNP's genomic position (in basepairs).}
#' }
#' @keywords internal
limit_snps <- function(max_snps=500, dat){
  messager("echolocator:: Limiting to only",max_snps,"SNPs.")
  if(nrow(dat)>max_snps){
    orig_n <- nrow(dat)
    lead.index <- which(dat$leadSNP==T)
    i=1
    tmp.sub<-data.frame()
    while(nrow(tmp.sub)<max_snps-1){
      # print(i)
      snp.start <- max(1, lead.index-i)
      snp.end <- min(nrow(dat), lead.index+i)
      tmp.sub <- dat[snp.start:snp.end]
      i=i+1
    }
    # Need to add that last row on only one end
    snp.start <- max(1, lead.index-i+1) # +1 keep it the same index as before
    snp.end <- min(nrow(dat), lead.index+i)
    tmp.sub <- dat[snp.start:snp.end]

    messager("+ Reduced number of SNPs:",orig_n,"==>",nrow(tmp.sub))
    return(tmp.sub)
  } else {
    messager("+ Data already contains less SNPs than limit (",nrow(dat),"<",max_snps,")")
    return(dat)
  }
}



