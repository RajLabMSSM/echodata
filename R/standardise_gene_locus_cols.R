standardise_gene_locus_cols <- function(topSNPs, 
                                        Locus="Locus",
                                        Gene="Gene",
                                        verbose=TRUE){
    SNP <- CHR <- NULL;
    
    #### Reassign col vars if previously renamed ####
    if("Locus" %in% colnames(topSNPs)) Locus <- "Locus" 
    if("Gene" %in% colnames(topSNPs)) Gene <- "Gene" 
    #### Make copy ####
    orig_topSNPs <- data.table::copy(data.table::data.table(topSNPs))
    # Add Locus/Gene columns
    bad_chars <- "/|[:]|[,]"
    #### If both are NULL, construct locus names from SNPs ####
    if(all(is.null(c(Locus, Gene)))){
        messager("+ Constructing locus names from CHR and index SNP.",
                 v=verbose)
        # locus_chr1_rs10737496
        topSNPs <- dplyr::mutate(topSNPs,
                                  Locus=paste0("locus_chr",CHR,"_",SNP),
                                  Gene=paste0("locus_chr",CHR,"_",SNP))
        Locus <- Gene <- "Locus";
    #### If both are not in the colnames, construct locus names from SNPs ####
    } else if(!any(Gene %in% colnames(topSNPs)) &
              !any(Locus %in% colnames(topSNPs))){
        messager("+ Constructing locus names from CHR and index SNP.",
                 v=verbose)
        # locus_chr1_rs10737496
        topSNPs <- dplyr::mutate(topSNPs,
                                  Locus=paste0("locus_chr",CHR,"_",SNP),
                                  Gene=paste0("locus_chr",CHR,"_",SNP))
        Locus <- Gene <- "Locus";
    #### If both are in the colnames, just replace bad_chars ####
    } else if(Gene %in% colnames(topSNPs) & 
              Locus %in% colnames(topSNPs)){
        print("+ Assigning Gene and Locus independently.",v=verbose) 
        topSNPs$Gene <- gsub(bad_chars,"_", orig_topSNPs[[Gene]])
        topSNPs$Locus <- gsub(bad_chars,"_",orig_topSNPs[[Locus]])  
        if(Gene!="Gene") topSNPs[[Gene]] <- NULL;
        if(Locus!="Locus") topSNPs[[Locus]] <- NULL; 
    } else {
        #### If only Gene in colnames, replace bad_chars ####
        ## Assign Locus the same as Gene
        if(Gene %in% colnames(topSNPs) & 
           all(!is.na(topSNPs[[Gene]])) ){
            print("+ Assigning Gene to Locus.",v=verbose) 
            topSNPs$Gene <- gsub(bad_chars,"_", orig_topSNPs[[Gene]])
            topSNPs$Locus <- gsub(bad_chars,"_",topSNPs$Gene) 
            if(Gene!="Gene") topSNPs[[Gene]] <- NULL;
        #### If only Locus in colnames, replace bad_chars ####
        ## Assign Gene the same as Locus
        } else {
            print("+ Assigning Locus to Gene.",v=verbose) 
            topSNPs$Locus <- gsub(bad_chars,"_",orig_topSNPs[[Locus]])
            topSNPs$Gene <- gsub(bad_chars,"_",topSNPs$Locus)  
            if(Locus!="Locus") topSNPs[[Locus]] <- NULL; 
        }
    }
    return(topSNPs)
}
