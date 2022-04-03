standardize_1snp_per_coord <- function(query,
                                       verbose=TRUE){
    
    CHR <- POS <- SNP <- NULL;                                                                    
    messager("++ Ensuring 1 SNP per row and per genomic coordinate.",
             v=verbose)
    query <- query %>%
        dplyr::group_by(CHR, POS) %>%
        dplyr::slice(1) %>%
        dplyr::group_by(SNP) %>%
        dplyr::slice(1) %>%
        # dplyr doesn't like working with grouped tables downstream.
        dplyr::ungroup()  
    return(query)
}