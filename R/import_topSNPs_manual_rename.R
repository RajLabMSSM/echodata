import_topSNPs_manual_rename <- function(top_SNPs,
                                         chrom_col,
                                         position_col,
                                         snp_col,
                                         pval_col,
                                         effect_col,
                                         min_POS_col,
                                         max_POS_col,
                                         locus_col,
                                         gene_col,
                                         verbose=TRUE){
    rename_cols <- list(CHR=chrom_col,
                        POS=position_col,
                        SNP=snp_col,
                        P=pval_col,
                        Effect=effect_col,
                        min_POS=min_POS_col,
                        max_POS=max_POS_col, 
                        Locus=locus_col,
                        Gene=gene_col)
    for(x in names(rename_cols)){
        old_name <- rename_cols[[x]]
        if((!is.null(old_name)) &&
           (old_name!=x) &&
           (old_name %in% colnames(top_SNPs))){
            messager("Renaming column:",old_name,"==>",x)
            data.table::setnames(top_SNPs, old_name, x) 
        }
    }
    return(top_SNPs)
}
