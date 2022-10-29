#' Standardize MAF
#' 
#' Standardize Minor Allele Frequency column.
#' Will infer MAF from frequency column, assuming that 
#' MAF is always less than 0.5 and that all SNPs are biallelic
#' 
#' @inheritParams standardize
#' 
#' @keywords internal
#' @importFrom dplyr rename mutate
standardize_maf <- function(query,
                            colmap,
                            verbose=TRUE){
    
    Freq <- MAF <- NULL;
    messager("++ Preparing MAF,Freq cols.", v=verbose)
    #### If MAF already exists ####
    if(any(colmap$MAF %in% names(query))){
        query <- query |> dplyr::rename(MAF=colmap$MAF) 
    #### If MAF doesn't exist ####
    } else { 
        #### Create Freq col ####
        if(any(colmap$Freq %in% names(query))){
            query <- query |> dplyr::rename(Freq=colmap$Freq) |> 
                dplyr::mutate(Freq=as.numeric(Freq))
        } 
        #### If Freq col exists ####
        if("Freq" %in% names(query) &&
           ((colmap$MAF=="calculate") |
            (!colmap$MAF %in% names(query))) ){
            messager("++ Inferring MAF from frequency column.",v=verbose)
            query$MAF <- ifelse(abs(query$Freq<0.5),
                                abs(query$Freq),
                                abs(1-query$Freq)) 
        } else {
            messager("++ Could not infer MAF from Freq.",v=verbose)
        } 
    }
    #### Remove nonsensical MAF ####
    if(any("MAF" %in% names(query))){
        query$MAF <- abs(query$MAF)
        messager("++ Removing SNPs with MAF== 0 | NULL | NA or >1.",
                 v=verbose)
        ### Remove MAF equal to: NA, >1, 0 ###
        query <- subset(query, !(is.na(MAF) | is.null(MAF) | MAF==0 | MAF>1)) 
    }
    return(query)
}
