#' Remove all SNPs outside of of a given gene.
#'
#' Get the min/max coordinates of a given gene 
#' (including known regulatory regions, introns, and exons).
#' Remove any SNPs from the data.frame that fall outside these coordinates.
#'
#' @family SNP filters
#' @keywords internal
gene_trimmer <- function(dat,
                         gene,
                         min_POS=NA,
                         max_POS=NA){
  
  hgnc_symbol <- CHR <- POS <- NULL;
  messager(
    "BIOMART:: Trimming data to only include SNPs within gene coordinates."
    )
  gene_info <-  biomart_geneInfo(gene)
  gene_info_sub <- subset(gene_info, hgnc_symbol==gene)
  # Take most limiting min position
  min_POS <- max(min_POS, gene_info_sub$start_position, na.rm = TRUE)
  # Take most limiting max position
  max_POS <- min(max_POS, gene_info_sub$end_position, na.rm = TRUE)
  dat <- subset(dat, gsub("chr","",CHR)==gene_info$chromosome_name[1])
  if(!is.na(min_POS)) dat <- subset(dat, POS>=min_POS)
  if(!is.na(max_POS)) dat <- subset(dat, POS>=max_POS)
  messager("BIOMART::",nrow(dat),"SNPs left after trimming.")
  return(dat)
}

