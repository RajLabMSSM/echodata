#' Import top GWAS/QTL summary statistics
#'
#' The resulting topSNPs data.frame can be used to guide
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
#' @param CHR Column containing chromosome (can be "chr1" or "1" format).
#' @param POS Column containing genomic position in units of basepairs.
#' @param SNP Column containing SNP RSIDs.
#' @param P Column containing uncorrected p-values.
#' @param Effect Column containing effect size (e.g. Beta, OR).
#' @param Locus Column containing unique locus name.
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
#' @param Gene An optional column to keep track of the causal 
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
#' @importFrom dplyr %>% rename mutate arrange group_by filter_at
#' @importFrom dplyr vars slice mutate_at select all_of
#' @importFrom data.table data.table
#' @examples
#' topSNPs <- echodata::import_topSNPs(
#'     topSS = echodata::topSNPs_Nalls2019_raw,
#'     colmap = construct_colmap(P = "P, all studies",
#'                               Effect = "Beta, all studies",
#'                               Locus = "Nearest Gene",
#'                               Gene = "QTL Nominated Gene (nearest QTL)"
#'                               ),
#'     grouping_vars = "Locus Number")
import_topSNPs <- function(topSS, 
                           sheet=1,
                           munge=TRUE,
                           colmap=construct_colmap(),
                           min_POS=NULL,
                           max_POS=NULL, 
                           grouping_vars=c("Locus"),
                           remove_variants=NULL,
                           show_table=FALSE,
                           verbose=TRUE){
    
    # echoverseTemplate:::source_all(packages = "dplyr")
    # echoverseTemplate:::args2vars(import_topSNPs)
    CHR <- Locus <- SNP <- P <- Effect <- NULL;
    
    #### Check for MungeSumstats early on ####
    if(munge) requireNamespace("MungeSumstats")
    #### Add min/max POS #####
    colmap$min_POS <- min_POS
    colmap$max_POS <- max_POS 
    # Reassign colnames bc read.xlsx won't let
    ##you prevent this in some versions....
    if(!is.data.frame(topSS)){
        if(endsWith(topSS, ".xlsx") | endsWith(topSS, ".xlsm")){
            #### Trim whitespace from user-supplied column names ####
            for(x in c("Locus","Gene","CHR","POS","SNP","P","Effect")){
                if(!is.null(colmap[[x]])) {
                    colmap[[x]] <- gsub(" ",".",trimws(colmap[[x]]))
                } 
            } 
        }
    } 
    #### Import top SNPs ####
    topSNPs <- topSNPs_reader(topSS = topSS, 
                               sheet = sheet)  
    #### Rename columns (if names supplied) ####
    topSNPs <- import_topSNPs_manual_rename(topSNPs=topSNPs,
                                             colmap=colmap,
                                             verbose=verbose)  
    #### Create locus/gene cols #### 
    ## Must happen AFTER any column renaming 
    topSNPs <- standardise_gene_locus_cols(topSNPs=topSNPs, 
                                            Locus=colmap$Locus,
                                            Gene=colmap$Gene, 
                                            verbose=verbose) 
    #### Standardise colnames ####
    if(munge){
        topSNPs <- 
            MungeSumstats::standardise_header(
                sumstats_dt = topSNPs, 
                return_list = FALSE, 
                uppercase_unmapped = FALSE,
            )
        topSNPs <- mungesumstats_to_echolocatoR(dat = topSNPs,
                                                 verbose = verbose)
    }    
    #### Add min/max POS cols ####
    if("min_POS" %in% colnames(topSNPs) &
       "max_POS" %in% colnames(topSNPs)){
        topSNPs <- dplyr::mutate(topSNPs, span_kb=(max_POS-min_POS)/1000)
    } 
    #### Remove specific variants ####
    if(!is.null(remove_variants)){
        topSNPs <- subset(topSNPs, !(SNP %in% remove_variants))
    }
    #### Get the top representative SNP and Gene per locus ####
    # by lowest p-value and effect size
    if(!is.null(grouping_vars)){
        if(!"Effect" %in% colnames(topSNPs)) topSNPs$Effect <- NA
        if(!"P" %in% colnames(topSNPs)) topSNPs$P <- NA
        if(!"P" %in% colnames(topSNPs)) topSNPs$P <- NA
        grouping_vars <- grouping_vars[grouping_vars %in% colnames(topSNPs)]
        topSNPs <-  
            topSNPs %>%
             dplyr::arrange(P, dplyr::desc(Effect)) %>%
             dplyr::group_by_at(.vars = grouping_vars) %>%
             dplyr::slice(1) %>% 
             replace(., .=="NA", NA) %>%
            dplyr::filter_at(.vars = grouping_vars, 
                             .vars_predicate = function(x){!is.na(x)}) 
    } 
    #### Standardise CHR format ####
    # Skip? might be the same as the fullSS
    if("CHR" %in% colnames(topSNPs)) {
        topSNPs <- dplyr::mutate(topSNPs, 
                                  CHR=as.numeric(gsub("chr","",CHR)))
    }  
    #### Make sure cols are numeric ####
    topSNPs <- topSNPs %>% 
        dplyr::mutate_at(.vars = c("POS","P","Effect"),
                         .funs = function(x){as.numeric(gsub(",| ","",x))})
    if(show_table){
        createDT(topSNPs, caption = "Top SNP per locus")
    }
    return(data.table::data.table(topSNPs, key = "Locus"))
}
