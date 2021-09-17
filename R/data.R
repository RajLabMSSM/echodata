
#### Raw sum stats ####

#' Example GWAS summary statistics: Nalls2019
#'
#' Downsampled GWAS summary statistics from
#'  Nalls et al. 2019 Parkinson's Disease GWAS (without 23andMe data).
#'
#' @source \href{https://doi.org/10.1016/S1474-4422(19)30320-5}{
#' Nalls et al. 2019, The Lancet Neurology}
#' 
#' \code{
#' path <- echolocatoR::example_fullSS()
#' Nalls2019 <- data.table::fread(path)
#' usethis::use_data(Nalls2019, overwrite = TRUE)
#' }
#' @format path string
#' @usage data("Nalls2019")
"Nalls2019"


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


#### Fine-mapping results ####

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
#'             dat <- echolocatoR::update_cols(dat)
#'             dat <- find_consensus_SNPs(finemap_dat=dat)
#'             dat <- echolocatoR::assign_lead_SNP(dat)
#'             return(dat)
#'         }else {return(NULL)}
#' }) %>% data.table::rbindlist(fill = TRUE) 
#' messager(dplyr::n_distinct(Nalls2019_merged$Locus),"unique loci.")
#' usethis::use_data(Nalls2019_merged, overwrite=TRUE)
#' }
"Nalls2019_merged"


#### Loci ####

#' \pkg{echolocatoR} output example: BST1 locus
#'
#' An example results file after running
#' \code{\link[echolocatoR]{finemap_loci()}}.
#'
#' Data originally comes from the Parkinson's disease GWAS
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
#' BST1 <- echolocatoR::BST1
#' usethis::use_data(BST1, overwrite = TRUE)
#' }
"BST1"


#' \pkg{echolocatoR} output example: LRRK2 locus
#'
#' An example results file after running
#' \code{\link[echolocatoR]{finemap_loci()}}.
#'
#' Data originally comes from the Parkinson's disease GWAS
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
#' library(echodata)
#' data("Nalls2019_merged")
#' LRRK2 <- subset(Nalls2019_merged, Locus=="LRRK2")
#' LRRK2 <- echolocatoR::assign_lead_SNP(LRRK2)
#' usethis::use_data(LRRK2, overwrite = TRUE)
#' }
"LRRK2"


#' \pkg{echolocatoR} output example: MEX3C locus
#'
#' An example results file after running
#' \code{\link[echolocatoR]{finemap_loci()}}.
#'
#' Data originally comes from the Parkinson's disease GWAS
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
#' library(echodata)
#' data("Nalls2019_merged")
#' MEX3C <- subset(Nalls2019_merged, Locus=="MEX3C")
#' MEX3C <- echolocatoR::assign_lead_SNP(MEX3C)
#' usethis::use_data(MEX3C, overwrite = TRUE)
#' }
"MEX3C"


#### Top SNPs ####

#' TopSS example file
#'
#' Summary stats of the top SNP(s) per locus.
#' Used to query locus subsets.for fine-mapping.
#'
#' Data from \href{https://doi.org/10.1016/S1474-4422(19)30320-5}{
#' Nalls et al. (bioRxiv)}, Table S2.
#' @source \url{https://github.com/RajLabMSSM/Fine_Mapping/raw/master/Data/GWAS/Nalls23andMe_2019/Nalls2019_TableS2.xlsx}
#' \code{
#' local <- file.path(tempdir(),"Nalls2019_TableS2.xlsx")
#' utils::download.file(
#'     file.path("https://github.com/RajLabMSSM/Fine_Mapping",
#'               "raw/master/Data/GWAS/Nalls23andMe_2019/Nalls2019_TableS2.xlsx"),
#'     local)
#' Nalls_top_SNPs <- data.table::data.table(readxl::read_excel(local))
#' usethis::use_data(Nalls_top_SNPs, overwrite=TRUE)
#' }
"Nalls_top_SNPs"


#' TopSS example file (processed)
#'
#'Summary stats of the top SNP(s) per locus.
#' Used to query locus subsets.for fine-mapping.
#'
#' @source
#' \code{
#' data("Nalls_top_SNPs")
#' top_SNPs <- echolocatoR::import_topSNPs(topSS=Nalls_top_SNPs,
#'                                         chrom_col="CHR",
#'                                         position_col="BP", 
#'                                         snp_col="SNP", 
#'                                         pval_col="P, all studies", 
#'                                         effect_col="Beta, all studies", 
#'                                         gene_col="Nearest Gene",  
#'                                         locus_col="Nearest Gene", 
#'                                         remove_variants="rs34637584")
#' usethis::use_data(top_SNPs, overwrite=TRUE)
#' }
"top_SNPs"


#### LD ####

#' LD with the lead SNP: BST1 locus
#'
#' Precomputed LD within the \emph{BST1} locus
#'  (defined in \code{\link[=BST1]{BST1}}.
#' LD derived white British subpopulation in the UK Biobank.
#' Only includes a subset of all the SNPs for storage purposes
#' (including the lead GWAS/QTL SNP).
#'
#' Data originally comes from \href{https://www.ukbiobank.ac.uk}{UK Biobank}.
#' LD was pre-computed and stored by the Alkes Price lab
#' (see \href{https://doi.org/10.1038/s41588-020-00735-5}{here}).
#'
#' @format data.table
#' \describe{
#'   \item{SNP}{SNP RSID}
#'   \item{CHR}{Chromosome}
#'   \item{POS}{Genomic position (in basepairs)}
#'   \item{...}{Optional: extra columns}
#' }
#' @source
#' \url{https://www.ukbiobank.ac.uk}
#' \url{https://doi.org/10.1038/s41588-020-00735-5}
#'  @examples
#'  \dontrun{ 
#' data("BST1") 
#' # Only including a small subset of the full
#' # LD matrix for storage purposes.
#' lead_snp <- subset(BST1, leadSNP)$SNP
#' snp_list <-  BST1[which(BST1$SNP==lead_snp)-100:which(BST1$SNP==lead_snp)+100,]$SNP
#' path <- portal_query(phenotypes = "parkinson", loci = "BST1", dataset_types = "LD", LD_panels = "UKB")
#' BST1_LD_matrix <- readRDS("../Fine_Mapping/Data/GWAS/Nalls23andMe_2019/BST1/plink/UKB_LD.RDS")
#' BST1_LD_matrix <- BST1_LD_matrix[snp_list, snp_list]
#' ### shortcut
#' # BST1_LD_matrix <- echolocatoR::BST1_LD_matrix
#' usethis::use_data(BST1_LD_matrix, overwrite=TRUE)
#'  }
"BST1_LD_matrix"


#### Paths ####

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


#' Example results path for genome-wide results
#' @examples
#' \dontrun{
#' genome_wide_dir <- "results/GWAS/Nalls23andMe_2019/_genome_wide"
#' usethis::use_data(genome_wide_dir, overwrite=TRUE)
#' }
"genome_wide_dir"


