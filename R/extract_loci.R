#' Extract loci from GWAS/QTL summary statistics
#' 
#' @param topSNPs Positions of the top SNPs prepare using  
#' \link[echolocatoR]{import_topSNPs}.
#' @param fullSS \link[data.table]{data.table} of the 
#' full GWAS/QTL summary statistics.
#' @inheritParams echolocatoR::finemap_pipeline
#' 
#' @export
#' @importFrom dplyr %>% group_by count
#' @importFrom data.table rbindlist 
extract_loci <- function(topSNPs,
                         fullSS,
                         bp_distance=5e+05,
                         munged=TRUE){
    # topSNPs <- echodata::topSNPs_Kunkle2019
    # fullSS <- echodata::Kunkle2019
    if(munged){
        fullSS <- echolocatoR::MUNGESUMSTATS.to_echolocatoR(dat = fullSS)    
    }
    #### Subset loci ####
    locusSS <- lapply(seq(1,nrow(topSNPs)), function(i){
        row <- data.frame(topSNPs)[i,]
        message(row$Locus)
        dat <- subset(fullSS, 
               CHR==gsub("chr","",row$CHR) &  
               POS>=row$POS-bp_distance &
               POS<=row$POS+bp_distance )
        dat <- cbind(Locus=row$Locus, dat)
        return(dat)
    }) %>% data.table::rbindlist()
    #### Count the number of SNPs per locus ####
    locus_counts <- locusSS %>% 
        dplyr::group_by(Locus) %>% 
        dplyr::count(name = "SNPs") %>%
        data.frame()
    print(locus_counts)
    return(locusSS) 
}
