#' \pkg{echolocatoR} output example: select loci
#'
#' An example results file after running \code{finemap_loci}
#'  on 3 Parkinson's disease (PD)-associated loci (BST1, LRRK2, and MEX3C).
#'  
#' Data originally comes from the PD GWAS
#' by \href{https://doi.org/10.1016/S1474-4422(19)30320-5}{
#' Nalls et al. (The Lancet Neurology)}.
#' 
#' @param return_paths Returns local paths to cached fine-mapping results
#'  (default: \code{TRUE}), or the data itself as a named list (\code{FALSE}).
#' @param return_dir Return the directory name
#'  instead of the individual file paths. 
#' @param limit_snps Limit the number of SNPs saved in each file.
#' @param force_new Force the creation of new files even if old ones exists.
#' @param verbose Print messages. 
#' @inheritParams get_data
#' 
#' @export
#' @importFrom data.table fwrite
#' @returns File paths 
#' @examples 
#' files <- get_Nalls2019_loci()
get_Nalls2019_loci <- function(save_dir=tempdir(),
                               return_paths=TRUE,
                               return_dir=FALSE,
                               limit_snps=NULL,
                               force_new=FALSE,
                               verbose=TRUE){
    
    dataset <- file.path(save_dir,"Nalls23andMe_2019")
    dir.create(dataset, showWarnings = FALSE, recursive = TRUE)
    loci <- list("BST1"=echodata::BST1,
                 "LRRK2"=echodata::LRRK2,
                 "MEX3C"=echodata::MEX3C)
    if(!is.null(limit_snps)){
        loci <- lapply(loci, function(x)x[seq_len(limit_snps)])
    }
    #### Return early ####
    if(isFALSE(return_paths)) return(loci)
    #### Write to disk ####
    files <- as.list(
        file.path(dataset,
                  paste(names(loci),"multi_finemap.csv.gz",sep="."))
    )
    names(files) <- names(loci)
    #### Return early if files already written ####
    if(all(file.exists(unlist(files))) && 
       isFALSE(force_new)) {
        if(isTRUE(return_dir)) files <- dirname(files[[1]])
        return(files)
    }
    for(l in names(loci)){
        messager("Writing fine-mapped locus data ==>",
                 files[[l]],v=verbose)
        data.table::fwrite(
            x = loci[[l]], 
            file = files[[l]]
            )
    }
    if(isTRUE(return_dir)) files <- dirname(files[[1]])
    return(files)
}
