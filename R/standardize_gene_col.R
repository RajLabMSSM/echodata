standardize_gene_col <- function(query, 
                                 colmap,
                                 locus,
                                 verbose=TRUE){
    
    Gene <- NULL;
    
    if(colmap$Gene %in% colnames(query)){
        messager("++ Preparing Gene col", v=verbose)
        query <- dplyr::rename(query, Gene=colmap$Gene) 
        # Subset by eGene
        if(!is.null(locus)){
            if(detect_genes(loci = locus, verbose  = FALSE)){
                messager("+ Subsetting to gene =",names(locus), v=verbose) 
                query <- subset(query, Gene==names(locus))
                if(dplyr::n_distinct(query$SNP)!=nrow(query)) {
                    stop("N rows must be equal to N unique SNPS.")
                }
            }
        } 
    }
    return(query)
}
