#' Column name mappings from \pkg{MungeSumstats} to \pkg{echolocatoR}
#'
#' @source https://github.com/neurogenomics/MungeSumstats
#' @keywords internal
MUNGESUMSTATS.col_map <- function(){
    list(chrom_col="CHR",
         position_col="BP",
         snp_col="SNP",
         pval_col="P",
         effect_col="BETA",
         stderr_col="SE",
         MAF_col="MAF",
         freq_col="FRQ",
         N_cases_col="N_CAS",
         N_controls_col="N_CON",
         A1_col="A1",
         A2_col="A2",
         gene_col="GENE")
}


