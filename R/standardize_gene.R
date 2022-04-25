#' Standardize genes
#'
#' Convert ensembl IDs to gene symbols.
#'
#' @param dat GWAS/QTL summary statistics data.
#' @param Gene Name of the gene column in \code{dat}.
#' @param verbose Print messages.
#' 
#' @export
#' @importFrom tidyr separate 
standardize_gene <- function(dat,
                             Gene="gene",
                             verbose=TRUE){
  requireNamespace("orthogene")

  messager("Standardizing gene name",v=verbose)
  dat <- tidyr::separate(dat,
                         col=Gene,
                         sep = ":",
                         into = c("chr","start","end","ensembl_id"),
                         fill="left",
                         remove  = FALSE)
  genes <- gsub("\\..*","",dat$ensembl_id)
  dat$Gene <- orthogene::map_genes(genes = genes)$name
  return(dat)
}

