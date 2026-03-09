#' Get colocalization results with Nalls2019 GWAS
#' 
#' Get colocalization results computed by 
#' Schilder et al. 2022 (\doi{10.1093/hmg/ddab294})
#' between the
#' Nalls2019 Parkinson's disease GWAS (\doi{10.1016/S1474-4422(19)30320-5}) and all eQTL datasets in the 
#' \href{https://www.ebi.ac.uk/eqtl/}{eQTL Catalogue}.  
#' 
#' @source 
#' \code{
#' URL <- paste("https://github.com/RajLabMSSM/Fine_Mapping_Shiny/raw",
#'       "master/www/data/GWAS/Nalls23andMe_2019/_genome_wide/COLOC",
#'       "coloc.eQTL_Catalogue_ALL.csv.gz", sep="/")
#' tmp <- file.path(tempdir(), basename(URL))
#' utils::download.file(URL, tmp)
#' piggyback::pb_upload(file = tmp, repo = "RajLabMSSM/echodata")
#' }
#' @export
#' @importFrom data.table fread  
#' @examples 
#' coloc_res <- get_Nalls2019_coloc()
get_Nalls2019_coloc <- function(){ 
    tmp <- get_data(fname = "coloc.eQTL_Catalogue_ALL.csv.gz")
    coloc_res <- data.table::fread(tmp)
    return(coloc_res)
}
