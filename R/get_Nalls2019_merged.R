#' \pkg{echolocatoR} output example: all loci
#'
#' An example results file after running \code{finemap_loci}
#'  on all Parkinson's disease (PD)-associated loci.
#'  
#'  (\emph{NOTE} : Formerly \code{merged_DT})
#'
#' Data originally comes from the PD GWAS
#' by \href{https://doi.org/10.1016/S1474-4422(19)30320-5}{
#' Nalls et al. (The Lancet Neurology)}.
#'
#' @format data.table
#' \describe{
#'   \item{SNP}{SNP RSID}
#'   \item{CHR}{Chromosome}
#'   \item{POS}{Genomic position (in basepairs)}
#'   \item{...}{Optional: extra columns}
#' }
#' @source \url{https://doi.org/10.1016/S1474-4422(19)30320-5}
#' @examples
#' \dontrun{
#' library(dplyr)
#' local_files <- echodata::portal_query(phenotypes = "parkinson", 
#'                             file_types = "multi_finemap",
#'                             LD_panels = "UKB", 
#'                             nThread = 10, overwrite=TRUE) 
#' Nalls2019_merged <- lapply(local_files, function(x){ 
#' message(x)
#'         if(file.exists(x) && file.size(x)>0){
#'             dat <- data.table::fread(x)
#'             dat <- update_cols(dat)
#'             dat <- find_consensus_snps(dat=dat)
#'             dat <- assign_lead_snp(dat)
#'             return(dat)
#'         }else {return(NULL)}
#' }) %>% data.table::rbindlist(fill = TRUE) 
#' 
#' #### piggyback ####                  
#' tmp <- file.path(tempdir(),"Nalls2019_merged.tsv.gz")
#' data.table::fwrite(Nalls2019_merged,tmp,sep="\t")
#' piggyback::pb_upload(file = tmp,
#'                      repo = "RajLabMSSM/echodata")
#' } 
#' @export
#' @importFrom data.table fread
get_Nalls2019_merged<- function(){ 
    tmp <- get_data(fname = "Nalls2019_merged.tsv.gz")
    dat <- data.table::fread(tmp, nThread = 1)
    return(dat)
}
