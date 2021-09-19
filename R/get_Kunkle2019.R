#' Example GWAS summary statistics: Kunkle2019
#'
#' Downsampled GWAS summary statistics from
#'  Kunkle et al. 2019 Alzheimer's Disease GWAS.
#'
#' @source \href{https://doi.org/10.1038/s41588-019-0358-2}{
#' Kunkle et al. 2019, The Lancet Neurology}
#' 
#' \code{
#' # meta <- MungeSumstats::find_sumstats(ids = "ieu_b_2")
#' # Kunkle2019 <- MungeSumstats::import_sumstats(ids = meta$id[1])
#' path <- file.path("/Volumes/bms20/projects/neurogenomics-lab/live",
#'                   "GWAS_sumstats/OpenGWAS/ieu-b-2.tsv.gz")
#' Kunkle2019 <- data.table::fread(path)
#' Kunkle2019 <- subset(Kunkle2019, P<5e-8)
#'
#' Kunkle2019 <- extract_loci(topSNPs = echodata::topSNPs_Kunkle2019, 
#'                            fullSS = Kunkle2019)
#'                            
#' #### piggyback ####                  
#' tmp <- file.path(tempdir(),"Kunkle2019.tsv.gz")
#' data.table::fwrite(Kunkle2019,tmp,sep="\t")
#' piggyback::pb_upload(file = tmp,
#'                      repo = "RajLabMSSM/echodata")
#' } 
#' @export
get_Kunkle2019 <- function(){
    tmp <- get_data(fname = "Kunkle2019.tsv.gz")
    dat <- data.table::fread(tmp, nThread = 1)
    return(dat)
}
