standardise_gene_locus_cols <- function(top_SNPs, 
                                        locus_col="Locus",
                                        gene_col="Gene",
                                        verbose=TRUE){
    SNP <- CHR <- NULL;
    
    #### Reassign col vars if previously renamed ####
    if("Locus" %in% colnames(top_SNPs)) locus_col <- "Locus" 
    if("Gene" %in% colnames(top_SNPs)) gene_col <- "Gene" 
    #### Make copy ####
    orig_top_SNPs <- data.table::copy(data.table::data.table(top_SNPs))
    # Add Locus/Gene columns
    bad_chars <- "/|[:]|[,]"
    #### If both are NULL, construct locus names from SNPs ####
    if(all(is.null(c(locus_col, gene_col)))){
        messager("+ Constructing locus names from CHR and index SNP.",
                 v=verbose)
        # locus_chr1_rs10737496
        top_SNPs <- dplyr::mutate(top_SNPs,
                                  Locus=paste0("locus_chr",CHR,"_",SNP),
                                  Gene=paste0("locus_chr",CHR,"_",SNP))
        locus_col <- gene_col <- "Locus";
    #### If both are not in the colnames, construct locus names from SNPs ####
    } else if(!any(gene_col %in% colnames(top_SNPs)) &
              !any(locus_col %in% colnames(top_SNPs))){
        messager("+ Constructing locus names from CHR and index SNP.",v=verbose)
        # locus_chr1_rs10737496
        top_SNPs <- dplyr::mutate(top_SNPs,
                                  Locus=paste0("locus_chr",CHR,"_",SNP),
                                  Gene=paste0("locus_chr",CHR,"_",SNP))
        locus_col <- gene_col <- "Locus";
    #### If both are in the colnames, just replace bad_chars ####
    } else if(gene_col %in% colnames(top_SNPs) & 
              locus_col %in% colnames(top_SNPs)){
        print("+ Assigning gene_col and locus_col independently.",v=verbose) 
        top_SNPs$Gene <- gsub(bad_chars,"_", orig_top_SNPs[[gene_col]])
        top_SNPs$Locus <- gsub(bad_chars,"_",orig_top_SNPs[[locus_col]])  
        if(gene_col!="Gene") top_SNPs[[gene_col]] <- NULL;
        if(locus_col!="Locus") top_SNPs[[locus_col]] <- NULL; 
    } else {
        #### If only gene_col in colnames, replace bad_chars ####
        ## Assign Locus the same as Gene
        if(gene_col %in% colnames(top_SNPs) & 
           all(!is.na(top_SNPs[[gene_col]])) ){
            print("+ Assigning gene_col to locus_col.",v=verbose) 
            top_SNPs$Gene <- gsub(bad_chars,"_", orig_top_SNPs[[gene_col]])
            top_SNPs$Locus <- gsub(bad_chars,"_",top_SNPs$Gene) 
            if(gene_col!="Gene") top_SNPs[[gene_col]] <- NULL;
        #### If only locus_col in colnames, replace bad_chars ####
        ## Assign Gene the same as Locus
        } else {
            print("+ Assigning locus_col to gene_col.",v=verbose) 
            top_SNPs$Locus <- gsub(bad_chars,"_",orig_top_SNPs[[locus_col]])
            top_SNPs$Gene <- gsub(bad_chars,"_",top_SNPs$Locus)  
            if(locus_col!="Locus") top_SNPs[[locus_col]] <- NULL; 
        }
    }
    return(top_SNPs)
}
