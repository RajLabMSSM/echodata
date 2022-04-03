#' Reassign lead SNPs
#' 
#' Reassign lead SNPs per group.
#' 
#' @param merged_dat Merged, multi-locus fine-mapping results data.
#' @param SNP Name of the SNP column.
#' @param P Name of the p-value column.
#' @param Effect Name of the Effect column.
#' @param grouping_vars Column names to group by when assigning lead SNPs.
#' @param nThread Number of threads to parallelise across.
#' @param verbose Print messages.
#' 
#' @export
#' @importFrom dplyr %>%  slice_min n_distinct all_of group_by_at
#' @importFrom data.table rbindlist
#' @importFrom parallel mclapply
#' @importFrom tidyr unite
#' @examples  
#' merged_dat <- echodata::get_Nalls2019_merged()
#' merged_dat2 <- echodata::reassign_lead_snps(merged_dat = merged_dat)
reassign_lead_snps <- function(merged_dat,
                               SNP = "SNP",
                               P = "P",
                               Effect = "Effect",
                               grouping_vars = c("Dataset", "Locus"),
                               nThread = 1,
                               verbose = TRUE) {  
    P <- NULL;
    
    messager("Reassigning lead SNPs by:",
             paste(grouping_vars,collapse = ", "), v=verbose)
    grouping_vars <- grouping_vars[grouping_vars %in% colnames(merged_dat)]
    if(length(grouping_vars)==0){
        messager("Warning: None of the grouping_vars were",
                 "found in merged_dat columns.",
                 "Grouping by a new dummy variable called 'Dataset'.")
        merged_dat$Dataset <- "Dataset"
        grouping_vars <- "Dataset"
    }
    #### Merge grouping_vars cols dynamically ####
    merged_dat <- tidyr::unite(merged_dat, 
                               col = "id",
                               dplyr::all_of(grouping_vars), 
                               sep = ".", 
                               remove = FALSE) 
    #### Find lead SNPs ####
    lead_snps <- (merged_dat %>% 
        dplyr::group_by_at(.vars = dplyr::all_of(grouping_vars)) %>%
        dplyr::slice_min(order_by = dplyr::all_of(P)) %>%
        dplyr::mutate(leadSNP=TRUE)
        )
    #### Merge with original data ####
    merged_dat <- data.table::merge.data.table(
        x = merged_dat[,-c("leadSNP")], 
         y = lead_snps[,c(grouping_vars,"SNP","leadSNP")], 
         by = c(grouping_vars,"SNP"), 
         all.x = TRUE) 
    merged_dat[is.na(merged_dat$leadSNP),"leadSNP"] <- FALSE
    #### Report ####
    if (!sum(merged_dat$leadSNP) == dplyr::n_distinct(merged_dat$id)) {
        warning("leadSNP count doesn't match up with unique id count.")
    }
    return(merged_dat)
}
