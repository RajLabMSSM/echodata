standardise_gene_locus_cols <- function(top_SNPs,
                                        orig_top_SNPs,
                                        locus_col=NULL,
                                        gene_col=NULL,
                                        verbose=TRUE){
    SNP <- CHR <- NULL;
    
    # Add Locus/Gene columns
    bad_chars <- "/|[:]|[,]"
    if((is.null(gene_col) & is.null(locus_col))){
        messager("+ Constructing locus names from CHR and index SNP",v=verbose)
        # locus_chr1_rs10737496
        top_SNPs <- dplyr::mutate(top_SNPs,
                                  Locus=paste0("locus_chr",CHR,"_",SNP),
                                  Gene=paste0("locus_chr",CHR,"_",SNP))
        locus_col <- gene_col <- "Locus";
    } else if(!any(gene_col %in% colnames(top_SNPs)) &
              !any(locus_col %in% colnames(top_SNPs))){
        messager("+ Constructing locus names from CHR and index SNP",v=verbose)
        # locus_chr1_rs10737496
        top_SNPs <- dplyr::mutate(top_SNPs,
                                  Locus=paste0("locus_chr",CHR,"_",SNP),
                                  Gene=paste0("locus_chr",CHR,"_",SNP))
        locus_col <- gene_col <- "Locus";
    } else if(gene_col %in% colnames(top_SNPs) & 
              locus_col %in% colnames(top_SNPs)){
        print("+ Assigning gene_col and locus_col independently",v=verbose)
        top_SNPs$Gene <- gsub(bad_chars,"_", orig_top_SNPs[[gene_col]])
        top_SNPs$Locus <- gsub(bad_chars,"_",orig_top_SNPs[[locus_col]]) 
        # Get rid of problematic characters
        
    } else {
        if(gene_col %in% colnames(top_SNPs) & 
           all(!is.na(top_SNPs[[gene_col]])) ){
            print("+ Assigning gene_col to locus_col",v=verbose)
            top_SNPs$Gene <- gsub(bad_chars,"_", orig_top_SNPs[[gene_col]])
            top_SNPs$Locus <- gsub(bad_chars,"_",top_SNPs$Gene)
            # Get rid of problematic characters
        } else {
            print("+ Assigning locus_col to gene_col",v=verbose)
            top_SNPs$Locus <- gsub(bad_chars,"_",orig_top_SNPs[[locus_col]])
            top_SNPs$Gene <- gsub(bad_chars,"_",top_SNPs$Locus) 
            # Get rid of problematic characters
        }
    }
    return(top_SNPs)
}
