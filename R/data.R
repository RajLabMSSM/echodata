#### Loci ####

#' \pkg{echolocatoR} output example: BST1 locus
#'
#' An example results file after running
#' \link[echolocatoR]{finemap_loci}.
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
#' @usage data("BST1")
"BST1"


#' \pkg{echolocatoR} output example: LRRK2 locus
#'
#' An example results file after running
#' \link[echolocatoR]{finemap_loci}.
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
#' LRRK2 <- echodata::assign_lead_snp(LRRK2)
#' usethis::use_data(LRRK2, overwrite = TRUE)
#' }
#' @usage data("LRRK2")
"LRRK2"


#' \pkg{echolocatoR} output example: MEX3C locus
#'
#' An example results file after running
#' \link[echolocatoR]{finemap_loci}.
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
#' MEX3C <- echodata::assign_lead_snp(MEX3C)
#' usethis::use_data(MEX3C, overwrite = TRUE)
#' }
#' @usage data("MEX3C")
"MEX3C"


#### Top SNPs ####

#' TopSS example file: Nalls2019
#'
#' Summary stats of the top SNP(s) per locus.
#' Used to query locus subsets.for fine-mapping.
#' 
#' Formerly \code{topSNPs_Nalls2019}.
#'
#' Data from \href{https://doi.org/10.1016/S1474-4422(19)30320-5}{
#' Nalls et al. (bioRxiv)}, Table S2.
#' @source \url{https://github.com/RajLabMSSM/Fine_Mapping/raw/master/Data/GWAS/Nalls23andMe_2019/Nalls2019_TableS2.xlsx}
#' \code{
#' local <- file.path(tempdir(),"Nalls2019_TableS2.xlsx")
#' utils::download.file(
#'     file.path("https://github.com/RajLabMSSM/Fine_Mapping",
#'               "raw/master/Data/GWAS/Nalls23andMe_2019",
#'               "Nalls2019_TableS2.xlsx"),
#'     local)
#' topSNPs_Nalls2019_raw <- data.table::data.table(readxl::read_excel(local))
#' usethis::use_data(topSNPs_Nalls2019_raw, overwrite=TRUE)
#' }
#' @usage data("topSNPs_Nalls2019_raw")
"topSNPs_Nalls2019_raw"


#' TopSS example file (processed): Nalls2019
#'
#' Summary stats of the top SNP(s) per locus.
#' Used to query locus subsets.for fine-mapping.
#' 
#' Formerly \code{top_SNPs}.
#'
#' @source
#' \code{
#' topSS <- echodata::topSNPs_Nalls2019_raw
#' topSNPs_Nalls2019 <- echodata::import_topSNPs(topSS=topSS,
#'                                         chrom_col="CHR",
#'                                         position_col="BP",
#'                                         snp_col="SNP",
#'                                         pval_col="P, all studies",
#'                                         effect_col="Beta, all studies",
#'                                         gene_col="Nearest Gene",
#'                                         locus_col="Nearest Gene",
#'                                         remove_variants="rs34637584")
#' usethis::use_data(topSNPs_Nalls2019, overwrite=TRUE)
#' }
#' @usage data("topSNPs_Nalls2019")
"topSNPs_Nalls2019"


#' TopSS example file (processed): Kunkle2019
#'
#' Summary stats of the top SNP(s) per locus.
#' Used to query locus subsets.for fine-mapping.
#'
#' @source
#' \code{
#' library(dplyr)
#' path <- file.path("/Volumes/bms20/projects/neurogenomics-lab/live",
#'                   "GWAS_sumstats/OpenGWAS/ieu-b-2.tsv.gz")
#' fullSS <- data.table::fread(path)
#'
#' supp_remote <- file.path(
#'     "https://static-content.springer.com/esm",
#'     "art%3A10.1038%2Fs41588-019-0358-2",
#'     "MediaObjects/41588_2019_358_MOESM3_ESM.xlsx")
#' supp_local <- file.path(tempdir(),basename(supp_remote))
#' utils::download.file(supp_remote, supp_local)
#' topSS <- readxl::read_excel(supp_local,
#'                             sheet = "Supplementary Table 8",
#'                             skip = 2) %>%
#'     dplyr::rename(SNP="Top Associated SNV")
#' topSS <- merge(topSS,
#'       subset(fullSS, SNP %in% topSS$SNP),
#'       by="SNP")
#' 
#' paths <- googledrive::drive_download(
#'     file.path("https://docs.google.com/spreadsheets/d",
#'               "1BgLQaRZd9L7JoO8IbpzhUCRFdTdLgJvD/edit#gid=236666677"),
#'     overwrite = TRUE)
#' meta <- readxl::read_excel(paths$local_path, sheet = "GWAS")
#' meta <- subset(meta, dataset=="Kunkle_2019")
#' 
#' top_SNPs <- echodata::import_topSNPs(
#'     topSS = topSS,
#'     sheet = meta$top_sheet,
#'     chrom_col = meta$top_chrom,
#'     position_col = meta$top_pos,
#'     snp_col = meta$top_snp,
#'     pval_col = "P",
#'     effect_col = "BETA",
#'     locus_col = meta$top_locus)
#' topSNPs_Kunkle2019 <- top_SNPs
#' usethis::use_data(topSNPs_Kunkle2019, overwrite=TRUE)
#' }
#' @usage data("topSNPs_Kunkle2019")
"topSNPs_Kunkle2019"


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
#'  \code{ 
#' data("BST1")
#' # Only including a small subset of the full
#' # LD matrix for storage purposes.
#' lead_snp <- subset(BST1, leadSNP)$SNP
#' snp_list <-  BST1[which(BST1$SNP==lead_snp)-
#'                       seq(100,which(BST1$SNP==lead_snp))+100,]$SNP
#' path <- portal_query(phenotypes = "parkinson", 
#'                      loci = "BST1", 
#'                      dataset_types = "LD", 
#'                      LD_panels = "UKB")
#' # path <- file.path(
#' #     "../Fine_Mapping/Data/GWAS/Nalls23andMe_2019/BST1/plink/UKB_LD.RDS")
#' BST1_LD_matrix <- readRDS(path)
#' BST1_LD_matrix <- BST1_LD_matrix[snp_list, snp_list]
#' ### shortcut
#' # BST1_LD_matrix <- echolocatoR::BST1_LD_matrix
#' usethis::use_data(BST1_LD_matrix, overwrite=TRUE)
#'  }
#' @usage data("BST1_LD_matrix")
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
#' @usage data("genome_wide_dir")
"genome_wide_dir"


#### MungeSumstats ####

#' \code{sumstatsColHeaders} from \pkg{MungeSumstats}
#' 
#' @examples
#' \dontrun{
#' sumstatsColHeaders <- MungeSumstats:::sumstatsColHeaders
#' usethis::use_data(sumstatsColHeaders, overwrite=TRUE)
#' }
#' @usage data("sumstatsColHeaders")
"sumstatsColHeaders"

