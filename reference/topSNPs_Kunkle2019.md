# TopSS example file (processed): Kunkle2019

Summary stats of the top SNP(s) per locus. Used to query locus
subsets.for fine-mapping.

## Usage

``` r
data("topSNPs_Kunkle2019")
```

## Format

An object of class `data.table` (inherits from `data.frame`) with 8 rows
and 7 columns.

## Source

` library(dplyr) path <- file.path("/Volumes/bms20/projects/neurogenomics-lab/live", "GWAS_sumstats/OpenGWAS/ieu-b-2.tsv.gz") fullSS <- data.table::fread(path) supp_remote <- file.path( "https://static-content.springer.com/esm", "art "MediaObjects/41588_2019_358_MOESM3_ESM.xlsx") supp_local <- file.path(tempdir(),basename(supp_remote)) utils::download.file(supp_remote, supp_local) topSS <- readxl::read_excel(supp_local, sheet = "Supplementary Table 8", skip = 2) dplyr::rename(SNP="Top Associated SNV") topSS <- merge(topSS, subset(fullSS, SNP by="SNP") paths <- googledrive::drive_download( file.path("https://docs.google.com/spreadsheets/d", "1BgLQaRZd9L7JoO8IbpzhUCRFdTdLgJvD/edit#gid=236666677"), overwrite = TRUE) meta <- readxl::read_excel(paths$local_path, sheet = "GWAS") meta <- subset(meta, dataset=="Kunkle_2019") topSNPs <- echodata::import_topSNPs( topSS = topSS, sheet = meta$top_sheet, CHR = meta$top_chrom, POS = meta$top_pos, SNP = meta$top_snp, P = "P", Effect = "BETA", Locus = meta$top_locus) topSNPs_Kunkle2019 <- topSNPs usethis::use_data(topSNPs_Kunkle2019, overwrite=TRUE) `
