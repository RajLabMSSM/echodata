#' Import top GWAS/QTL summary statistics
#'
#' The resulting top_SNPs data.frame can be used to guide
#' the \link[echolocatoR]{finemap_loci} in querying and fine-mapping loci.
#'
#' @param topSS Can be a data.frame with the top summary stats per locus.
#' Alternatively, you can provide a path to the stored top summary stats file.
#' Can be in any tabular format (e.g. excel, .tsv, .csv, etc.).
#' This file should have one lead GWAS/QTL hits per locus.
#' If there is more than one SNP per locus, the one with the
#'  smallest p-value (then the largest effect size) is selected as the lead SNP.
#' The lead SNP will be used as the center of the locus when
#'  constructing the locus subset files.
#' @param munge Standardise column names.
#' @param chrom_col Column containing chromosome (can be "chr1" or "1" format).
#' @param position_col Column containing genomic position in units of basepairs.
#' @param snp_col Column containing SNP RSIDs.
#' @param pval_col Column containing uncorrected p-values.
#' @param effect_col Column containing effect size (e.g. Beta, OR).
#' @param locus_col Column containing unique locus name.
#' @param remove_variants SNPs to remove from \code{topSS},
#' @param min_POS_col Column containing minimum genomic position 
#' (used instead of an arbitrary window size).
#' @param max_POS_col Column containing maximum genomic position 
#' (used instead of an arbitrary window size).
#' @param show_table Create an interative data table.
#' @param sheet If the \emph{topSS} file is an excel sheet, 
#' you can specify which tab to use.
#' You can provide either a number to identify the tab by order,
#' or a string to identify the tab by name.
#' @param gene_col An optional column to keep track of the causal 
#' gene(s) in each locus (if known).
#' @param grouping_vars The variables that you want to group by
#' such that each grouping_var combination has its own index SNP.
#' For example, if you want one index SNP per QTL eGene - 
#' GWAS locus pair, you could supply:
#' \code{grouping_vars=c("Locus","Gene")}. 
#' @param verbose Print messages.
#' 
#' @returns Munged topSNPs table.
#' 
#' @export
#' @importFrom dplyr %>% rename mutate arrange group_by 
#' @importFrom dplyr vars slice mutate_at select all_of
#' @importFrom data.table data.table
#' @examples
#' topSNPs <- echodata::import_topSNPs(
#'     topSS = echodata::topSNPs_Nalls2019_raw, 
#'     pval_col = "P, all studies",
#'     effect_col = "Beta, all studies",
#'     locus_col = "Nearest Gene", 
#'     gene_col = "QTL Nominated Gene (nearest QTL)")
import_topSNPs <- function(topSS,
                           show_table=TRUE,
                           sheet = 1,
                           munge=TRUE,
                           chrom_col=NULL,
                           position_col=NULL,
                           min_POS_col=NULL,
                           max_POS_col=NULL,
                           snp_col=NULL,
                           pval_col=NULL,
                           effect_col=NULL,
                           locus_col="Locus",
                           gene_col="Gene",
                           grouping_vars=c("Locus"),
                           remove_variants=NULL, 
                           verbose=TRUE){
    # echoverseTemplate:::source_all(packages = "dplyr")
    # echoverseTemplate:::args2vars(import_topSNPs)
    CHR <- Locus <- Gene <- POS <- SNP <- max_POS <- 
        min_POS <- P <- Effect <- . <- NULL; 
    
    if(munge) requireNamespace("MungeSumstats")
    # Reassign colnames bc read.xlsx won't let
    ##you prevent this in some versions....
    if(!is.data.frame(topSS)){
        if(endsWith(topSS, ".xlsx") | endsWith(topSS, ".xlsm")){
            #### Trim whitespace from user-supplied column names ####
            if(!is.null(locus_col)) {
                locus_col <- gsub(" ",".",trimws(locus_col))
            }
            if(!is.null(gene_col)) {
                gene_col <- gsub(" ",".",trimws(gene_col))
            }
            if(!is.null(chrom_col)) {
                chrom_col <- gsub(" ",".",trimws(chrom_col))
            }
            if(!is.null(position_col)) {
                position_col <- gsub(" ",".",trimws(position_col))
            }
            if(!is.null(snp_col)) {
                snp_col <- gsub(" ",".",trimws(snp_col))
            }
            if(!is.null(pval_col)) {
                pval_col <- gsub(" ",".",trimws(pval_col))
            }
            if(!is.null(effect_col)) {
                effect_col <- gsub(" ",".",trimws(effect_col))
            }
        }
    } 
    #### Import top SNPs ####
    top_SNPs <- topSNPs_reader(topSS = topSS, 
                               sheet = sheet)  
    #### Rename columns (if names supplied) ####
    top_SNPs <- import_topSNPs_manual_rename(top_SNPs=top_SNPs,
                                             chrom_col=chrom_col,
                                             position_col=position_col,
                                             snp_col=snp_col,
                                             pval_col=pval_col,
                                             effect_col=effect_col,
                                             min_POS_col=min_POS_col,
                                             max_POS_col=max_POS_col,
                                             locus_col=locus_col,
                                             gene_col=gene_col,
                                             verbose=verbose)  
    #### Create locus/gene cols #### 
    ## Must happen AFTER any column renaming 
    top_SNPs <- standardise_gene_locus_cols(top_SNPs=top_SNPs, 
                                            locus_col=locus_col,
                                            gene_col=gene_col, 
                                            verbose=verbose) 
    #### Standardise colnames ####
    if(munge){
        top_SNPs <- 
            MungeSumstats::standardise_sumstats_column_headers_crossplatform(
                sumstats_dt = top_SNPs, 
                return_list = FALSE, 
                uppercase_unmapped = FALSE,
            )
        top_SNPs <- echodata::mungesumstats_to_echolocatoR(dat = top_SNPs)
    }    
    #### Add min/max POS cols ####
    if("min_POS" %in% colnames(top_SNPs) &
       "max_POS" %in% colnames(top_SNPs)){
        top_SNPs <- dplyr::mutate(top_SNPs, span_kb=(max_POS-min_POS)/1000)
    } 
    #### Remove specific variants ####
    if(!is.null(remove_variants)){
        top_SNPs <- subset(top_SNPs, !(SNP %in% remove_variants))
    }
    #### Get the top representative SNP and Gene per locus ####
    # by lowest p-value and effect size
    if(!is.null(grouping_vars)){
        if(!"Effect" %in% colnames(top_SNPs)) top_SNPs$Effect <- NA
        if(!"P" %in% colnames(top_SNPs)) top_SNPs$P <- NA
        if(!"P" %in% colnames(top_SNPs)) top_SNPs$P <- NA
        grouping_vars <- grouping_vars[grouping_vars %in% colnames(top_SNPs)]
        top_SNPs <-  
            top_SNPs %>%
             dplyr::arrange(P, dplyr::desc(Effect)) %>%
             dplyr::group_by_at(.vars = grouping_vars) %>%
             dplyr::slice(1) %>%
             replace(., .=="NA", NA) %>%
             subset(!is.na(Locus))  
    } 
    #### Standardise CHR format ####
    # Skip? might be the same as the fullSS
    if("CHR" %in% colnames(top_SNPs)) {
        top_SNPs <- dplyr::mutate(top_SNPs, 
                                  CHR=as.numeric(gsub("chr","",CHR)))
    }  
    #### Make sure cols are numeric ####
    top_SNPs <- top_SNPs %>% 
        dplyr::mutate_at(.vars = dplyr::vars(POS,P,Effect),
                         .funs = function(x){as.numeric(gsub(",| ","",x))})
    if(show_table){
        createDT(top_SNPs, caption = "Top SNP per locus")
    }
    return(data.table::data.table(top_SNPs))
}
