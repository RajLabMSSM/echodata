#' Standardize MAF
#' 
#' Standardize Minor Allele Frequency column.
#' Will infer MAF from frequency column, assuming that 
#' MAF is always less than 0.5 and that all SNPs are biallelic
#' 
#' @inheritParams standardize
#' 
#' @keywords internal
#' @importFrom dplyr %>% rename
standardize_maf <- function(query,
                            colmap,
                            verbose=TRUE){
    
    Freq <- NULL;
    messager("++ Preparing MAF,Freq cols.", v=verbose)
    if(any(colmap$MAF %in% colnames(query))){
        query <- query %>% dplyr::rename(MAF=colmap$MAF)
    } else {
        if(any(colmap$Freq %in% colnames(query))){
            query <- query %>% dplyr::rename(Freq=colmap$Freq) %>% 
                dplyr::mutate(Freq=as.numeric(Freq)) 
            if(colmap$MAF=="calculate" |
               (!colmap$MAF %in% colnames(query)) ){
                messager("++ Inferring MAF from frequency column...")
                query$MAF <- ifelse(abs(query$Freq<0.5),
                                    abs(query$Freq),
                                    abs(1-query$Freq))
            }
        } else {messager("++ Could not infer MAF.",v=verbose)}
    }
    #### Remove non-sensical MAF ####
    if(any("MAF" %in% colnames(query))){
        query$MAF <- abs(query$MAF)
        messager("++ Removing SNPs with MAF== 0 | NULL | NA or >1",
                 v=verbose)
        ### Remove MAF equal to: NA, >1, 0 ###
        query <- subset(query, !(is.na(MAF) | is.null(MAF) | MAF==0 | MAF>1)) 
    }
    return(query)
}
