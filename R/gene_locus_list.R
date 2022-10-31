#' Generate a named list of (e)Gene-Locus pairs
#'
#' This object is to be passed to the \code{loci=} argument in 
#' \code{echolocatoR::finemap_loci()}. 
#' @param loci User-supplied locus list.
#' @param dataset_type The kind dataset you're fine-mapping
#' (e.g. GWAS, eQTL, tQTL).
#' @param topSNPs Output of the function \link[echodata]{import_topSNPs}, 
#' containing the top (index) SNPs per locus.
#' @param drop_missing_loci Drop \code{loci} that are missing from 
#' \code{topSNPs$Locus}.
#' @param verbose Print messages.
#' 
#' @returns Named list
#' @export
#' @importFrom stats setNames
#' @examples
#' loci <- gene_locus_list(topSNPs = echodata::topSNPs_Nalls2019,
#'                         dataset_type = "QTL")
gene_locus_list <- function(loci = NULL,
                            topSNPs = NULL,
                            drop_missing_loci = TRUE,
                            dataset_type = NULL,
                            verbose = TRUE){
    
    is_qtl <- grepl(pattern = "qtl$",
                    x = dataset_type,
                    ignore.case = TRUE)
    if(is.null(loci)) {
        if(any(is.null(c(topSNPs,dataset_type)))){
            stp <- paste(
                "When loci is argument is NULL",
                "must supply valid topSNPs and dataset_type arguments."
            )
            stop(stp)
        }
        if(is_qtl){
            loci <- stats::setNames(paste(topSNPs$Locus,topSNPs$Gene,sep="_"), 
                                    topSNPs$Gene)
        } else {
            loci <- unique(topSNPs$Locus)
        } 
    }  
    #### drop_missing_loci ####
    if(isTRUE(drop_missing_loci)){
        missing_loci <- loci[!loci %in% topSNPs$Locus]
        if(length(missing_loci)>0){
            messager("Dropping",formatC(length(missing_loci),big.mark = ","),
                     "loci not present in topSNPs:",
                     paste("\n -",missing_loci,collapse = ""),
                     v=verbose)
            loci <- loci[loci %in% topSNPs$Locus]
        } 
    }
    #### Ensure all locus names are unique ####
    if(detect_genes(loci = loci)){
        if((length(unique(loci))!=length(loci)) | 
           all(names(loci)==unname(loci)) ){
            messager("Reassigning gene-specific locus names.",v=verbose)
            loci <- stats::setNames(paste(unname(loci),names(loci),sep="_"),
                                    names(loci))
        } 
    }
    return(loci)
}
