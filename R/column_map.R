#' Column name mappings for a given package
#'
#' Supports \pkg{MungeSumstats} and \pkg{echolocatoR}
#'
#' @source \url{https://github.com/neurogenomics/MungeSumstats}
#' @keywords internal
column_map <- function(package="MungeSumstats"){
    if(tolower(package)=="mungesumstats"){
        return( list(chrom_col="CHR",
                     position_col="BP",
                     snp_col="SNP",
                     pval_col="P",
                     effect_col="BETA",
                     stderr_col="SE",
                     tstat_col="t_stat",
                     MAF_col="MAF",
                     freq_col="FRQ",
                     N_cases_col="N_CAS",
                     N_controls_col="N_CON",
                     A1_col="A1",
                     A2_col="A2"))
    }
    if(tolower(package)=="echolocator"){
        return( list(chrom_col="CHR",
                     position_col="POS",
                     snp_col="SNP",
                     pval_col="P",
                     effect_col="Effect",
                     stderr_col="StdErr",
                     tstat_col="t_stat",
                     MAF_col="MAF",
                     freq_col="Freq",
                     N_cases_col="N_cases",
                     N_controls_col="N_controls",
                     A1_col="A1",
                     A2_col="A2",
                     locus_col="Locus",
                     gene_col="Gene"))
    }
    
}
