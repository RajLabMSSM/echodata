#' Filter SNPs
#'
#' Filter SNPs by MAF, window size, min/max position, maximum number of SNPs,
#'  or gene coordinates.
#' You can also explicitly remove certain variants.
#'
#' @param dat Fine-mapping results data.
#' @param bp_distance Distance around the lead SNP to include.
#' @param remove_variants A list of SNP RSIDs to remove.
#' @param min_POS Minimum genomic position to include.
#' @param max_POS Maximum genomic position to include.
#' @param max_snps Maximum number of SNPs to include.
#' @param min_MAF Minimum Minor Allele Frequency (MAF) of SNPs to include.
#' @param trim_gene_limits If a gene name is supplied to this argument 
#' (e.g. \code{trim_gene_limits="BST"}), only SNPs within the gene body
#'  will be included.
#' @param verbose Print messages.
#' @family SNP filters
#' @export
#' @examples
#' dat <- echodata::filter_snps(dat = echodata::BST1)
filter_snps <- function(dat,
                        bp_distance=500000,
                        remove_variants=FALSE,
                        min_POS=NA,
                        max_POS=NA,
                        max_snps=NULL,
                        min_MAF=NULL,
                        trim_gene_limits=FALSE,
                        verbose=TRUE){
  
  SNP <- MAF <- leadSNP <- POS <- NULL;
  messager("FILTER:: Filtering by SNP features.",v=verbose)
  if(all(remove_variants!=FALSE)){
    messager("+ FILTER:: Removing specified variants:",
            paste(remove_variants, collapse=','), v=verbose)
    try({dat <- subset(dat, !(SNP %in% remove_variants) )})
  }
  # Trim subset according to annotations of where the gene's limit are
  if(is.character(trim_gene_limits)){
    dat <- gene_trimmer(dat=dat,
                        gene=trim_gene_limits,
                        min_POS=min_POS,
                        max_POS=min_POS)
  } 
  if(!is.null(max_snps)){
    dat <- limit_snps(max_snps = max_snps,
                      dat = dat)
  }
  if(!is.null(min_MAF) & (!any(is.na(min_MAF))) ){
    if(any(min_MAF>0, na.rm = TRUE) & "MAF" %in% colnames(dat)){
      messager("+ FILTER:: Removing SNPs with MAF <",min_MAF,v=verbose)
      dat <- subset(dat, MAF>=min_MAF)
    }
  }
  #### Limit range ####
  if(!is.null(bp_distance)){
    dat <- assign_lead_snp(dat = dat,
                           verbose = verbose)
    lead.snp <- subset(dat, leadSNP)
    dat <- subset(dat,
                  POS >= lead.snp$POS - bp_distance &
                  POS <= lead.snp$POS + bp_distance)
  }
  if(!is.na(min_POS)){dat <- subset(dat, POS>=min_POS)}
  if(!is.na(max_POS)){dat <- subset(dat, POS<=max_POS)}
  messager("+ FILTER:: Post-filtered data:",
          paste(dim(dat), collapse=" x "),v=verbose)
  return(dat)
}



