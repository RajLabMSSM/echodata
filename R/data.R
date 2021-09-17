#' Example GWAS summary statistics
#'
#' Downsampled GWAS summary statistics from
#'  Kunkle et al. 2019 Alzheimer's Disease GWAS.
#'
#' @source
#' \code{
#' # meta <- MungeSumstats::find_sumstats(ids = "ieu_b_2")
#' # Kunkle2019 <- MungeSumstats::import_sumstats(ids = meta$id[1])
#' #path <- file.path("/Volumes/bms20/projects/neurogenomics-lab/live",
#' #                  "GWAS_sumstats/OpenGWAS/ieu-b-2.tsv.gz")
#' path <- "~/Desktop/ieu-b-2.tsv.gz"
#' Kunkle2019 <- data.table::fread(path)
#' Kunkle2019 <- subset(Kunkle2019, P<5e-8)
#' usethis::use_data(Kunkle2019, overwrite = TRUE)
#' }
#' @format path string
#' @usage data("Kunkle2019")
"Kunkle2019"


#' Example GWAS summary statistics
#'
#' Downsampled GWAS summary statistics from
#'  Nalls et al. 2019 Parkinson's Disease GWAS (without 23andMe data).
#'
#' @source
#' \code{
#' path <- echolocatoR::example_fullSS()
#' Nalls2019 <- data.table::fread(path)
#' usethis::use_data(Nalls2019, overwrite = TRUE)
#' }
#' @format path string
#' @usage data("Nalls2019")
"Nalls2019"


#' Example results path for \code{Nall2019} BST1 locus
#'
#' @source
#' \code{
#' locus_dir <- "results/GWAS/Nalls23andMe_2019/BST1"
#' usethis::use_data(locus_dir, overwrite = TRUE)
#' }
#' @format path string
#' @usage data("locus_dir")
"locus_dir"
