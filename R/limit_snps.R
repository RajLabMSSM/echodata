#' Limit the number of SNPs per locus.
#'
#' Start with the lead SNP and keep expanding the window until you reach 
#' the desired number of SNPs.
#' \code{dat} should only contain one locus from one chromosome.
#'
#' @param dat A data.frame that contains at least the following columns:
#' \describe{
#'   \item{SNP}{RSID for each SNP.}
#'   \item{POS}{Each SNP's genomic position (in basepairs).}
#' }
#' @param max_snps The maximum number of SNPs to keep in the resulting
#'  \link[data.table]{data.table}.
#' @param verbose Print messages. 
#' @return A  filtered \link[data.table]{data.table}.
#' 
#' @family SNP filters
#' @export
#' @examples 
#' dat2 <- echodata::limit_snps(dat = echodata::BST1)
limit_snps <- function(dat,
                       max_snps = 500,
                       verbose = TRUE){
  messager("Limiting to only",max_snps,"SNPs.",
           v=verbose)
  if(nrow(dat)>max_snps){
    orig_n <- nrow(dat)
    lead.index <- which(dat$leadSNP==TRUE)
    i=1
    tmp.sub<-data.frame()
    while(nrow(tmp.sub)<max_snps-1){
      # print(i)
      snp.start <- max(1, lead.index-i, na.rm = TRUE)
      snp.end <- min(nrow(dat), lead.index+i, na.rm = TRUE)
      tmp.sub <- dat[seq(snp.start,snp.end)]
      i=i+1
    }
    # Need to add that last row on only one end
    snp.start <- max(1, lead.index-i+1) # +1 keep it the same index as before
    snp.end <- min(nrow(dat), lead.index+i, na.rm = TRUE)
    tmp.sub <- dat[snp.start:snp.end]

    messager("+ Reduced number of SNPs:",formatC(orig_n,big.mark = ","),
             "==>",formatC(nrow(tmp.sub),big.mark = ","), v = verbose)
    return(tmp.sub)
  } else {
    messager("+ Data already contains less SNPs than limit (",
             formatC(nrow(dat),big.mark = ",")
             ,"<",formatC(max_snps,big.mark = ","),")", v = verbose)
    return(dat)
  }
}
