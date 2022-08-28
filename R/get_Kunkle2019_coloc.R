#' Get colocalization results with Kunkle2019 GWAS
#' 
#' Get colocalization results computed by 
#' \href{https://doi.org/10.1038/s41588-021-00976-y}{Lopes et al. 2022}
#' between the \href{https://doi.org/10.1038/s41588-019-0358-25}{
#' Kunkle2019 Alzheimer's disease GWAS} and microglia eQTL datasets.
#' @param return_path If \code{TRUE}, return a named list containing both
#' the imported data and the path where it has been saved.
#' Default: \code{FALSE}.
#' @returns \link[data.table]{data.table}.
#' @source 
#' \code{
#' URL <- paste(
#'     "https://github.com/RajLabMSSM",
#'     "Fine_Mapping_Shiny/raw/master/www",
#'     "Microglia_all_regions_Kunkle_2019_COLOC.snp-level_select.tsv.gz",
#'      sep="/")
#' tmp <- file.path(tempdir(), basename(URL))
#' utils::download.file(URL, tmp)
#' piggyback::pb_upload(file = tmp, repo = "RajLabMSSM/echodata")
#' }
#' @export
#' @importFrom data.table fread  
#' @examples 
#' coloc_res <- get_Kunkle2019_coloc()
get_Kunkle2019_coloc <- function(return_path=FALSE){ 
    tmp <- get_data(
        fname = 
            "Microglia_all_regions_Kunkle_2019_COLOC.snp-level_select.tsv.gz"
        )
    coloc_res <- data.table::fread(tmp)
    if(isTRUE(return_path)){
        return(
            list(dat=coloc_res,
                 path=tmp)
        )
    } else {
        return(coloc_res)
    } 
}
