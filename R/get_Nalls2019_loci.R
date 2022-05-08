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
#' @param verbose Print messages. 
#' @inheritParams get_data
#' @export
#' @returns 
#' @examples 
#' files <- get_Nalls2019_loci()
get_Nalls2019_loci <- function(save_dir=tools::R_user_dir(package = "echodata",
                                                          which = "cache"),
                               return_paths=TRUE,
                               verbose=TRUE){
    
    dataset <- file.path(save_dir,"Nalls23andMe_2019")
    dir.create(dataset, showWarnings = FALSE, recursive = TRUE)
    loci <- list("BST1"=echodata::BST1,
                 "LRRK2"=echodata::LRRK2,
                 "MEX3C"=echodata::MEX3C)
    #### Return early ####
    if(isFALSE(return_paths)) return(loci)
    #### Write to disk ####
    files <- as.list(
        file.path(dataset,
                  paste(names(loci),"multi_finemap.csv.gz",sep="."))
    )
    names(files) <- names(loci)
    #### Return early if files already written ####
    if(all(file.exists(unlist(files)))) return(files)
    for(l in names(loci)){
        messager("Writing fine-mapped locus data ==>",
                 files[[l]],v=verbose)
        data.table::fwrite(
            x = loci[[l]], 
            file = files[[l]]
            )
    }
    return(files)
}
