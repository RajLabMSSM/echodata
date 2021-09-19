#' Example GWAS summary statistics: Nalls2019
#'
#' Downsampled GWAS summary statistics from
#'  Nalls et al. 2019 Parkinson's Disease GWAS (without 23andMe data).
#'
#' @source \href{https://doi.org/10.1016/S1474-4422(19)30320-5}{
#' Nalls et al. 2019, The Lancet Neurology}
#' 
#' \code{
#' path <- echodata::example_fullSS()
#' Nalls2019 <- data.table::fread(path)
#' 
#' # meta <- MungeSumstats::find_sumstats(ids = "ieu_b_7")
#' # Nalls2019 <- MungeSumstats::import_sumstats(ids = meta$id[1])
#' path <- file.path("/Volumes/bms20/projects/neurogenomics-lab/live",
#'                   "GWAS_sumstats/OpenGWAS/ieu-b-7.tsv.gz")
#'                   
#' #### piggyback ####                  
#' tmp <- file.path(tempdir(),"Nalls2019.tsv.gz")
#' data.table::fwrite(Nalls2019,tmp,sep="\t")
#' piggyback::pb_upload(file = tmp,
#'                      repo = "RajLabMSSM/echodata")
#' } 
#' @export
get_Nalls2019 <- function(){
    tmp <- get_data(fname = "Nalls2019.tsv.gz")
    dat <- data.table::fread(tmp, nThread = 1)
    return(dat)
}
