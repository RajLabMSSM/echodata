#' Get RSIDS from SNP coordinates
#'
#' Get RSIDS from SNP coordinates using Bioconductor genome references.
#' @param dat \link[data.table]{data.table} or 
#' \link[base]{data.frame} with SNP positions in the columns 
#' \code{CHR} and \code{POS}. Extra columns are allowed.
#' @param genome_build Which genome build \code{dat} is in
#' (e.g. "hg19" or "hg38").
#' @param drop_unannotated Drop SNPs that RSIDs couldn't be found for.
#' @param drop_duplicates Drop any duplicate SNPs rows.
#' @param snp_colname Name of the new column with RSIDs.
#' @param verbose Print messages. 
#' @returns \link[data.table]{data.table} with new columns for RSIDs. 
#' @export
#' @importFrom data.table data.table merge.data.table setnames 
#' @examples
#' dat <- dplyr::rename(echodata::BST1, SNP_old=SNP)
#' dat_annot <- echodata::coords_to_rsids(dat = dat)
coords_to_rsids <- function(dat,
                            genome_build = "hg19",
                            drop_unannotated = TRUE,
                            drop_duplicates = TRUE,
                            snp_colname = "SNP",
                            verbose = TRUE) {
    requireNamespace("BSgenome") 
    requireNamespace("GenomicRanges") 
    if(snp_colname %in% colnames(dat)){
        stop_msg <- paste(
            snp_colname, "is already a column name in dat.",
            "Either rename this column or set snp_colname=",
            "to a different value")
        stop(stop_msg)
    }
    messager("Searching for RSIDs using:", genome_build, v = verbose)
    if (tolower(genome_build) %in% c("hg19", "grch37")) {
        requireNamespace("SNPlocs.Hsapiens.dbSNP144.GRCh37")
        db <- SNPlocs.Hsapiens.dbSNP144.GRCh37::SNPlocs.Hsapiens.dbSNP144.GRCh37
    }
    if (tolower(genome_build) %in% c("hg38", "grch38")) {
        requireNamespace("SNPlocs.Hsapiens.dbSNP144.GRCh38")
        db <- SNPlocs.Hsapiens.dbSNP144.GRCh38::SNPlocs.Hsapiens.dbSNP144.GRCh38
    }
    if (class(dat)[1] == "GRanges") {
        gr.snp <- dat
    } else {
        gr.snp <- GenomicRanges::makeGRangesFromDataFrame(
            dat,
            keep.extra.columns  = TRUE,
            seqnames.field = "CHR",
            start.field = "POS",
            end.field = "POS"
        )
    }
    gr.rsids <- BSgenome::snpsByOverlaps(db, ranges = gr.snp, )
    rsids <- data.table::data.table(data.frame(gr.rsids))
    rsids$seqnames <- tolower(as.character(rsids$seqnames))
    dat$CHR <- tolower(as.character(dat$CHR))
    # Merge
    dat.annot <- data.table::merge.data.table(dat,
                                              rsids,
                                              all.x = !drop_unannotated,
                                              by.x = c("CHR", "POS"),
                                              by.y = c("seqnames", "pos")
    )
    if (drop_duplicates) {
        dat.annot <- dat.annot[!duplicated(dat.annot$RefSNP_id), ]
    }
    
    messager(nrow(dat.annot), "/", nrow(dat), "SNPs annotated with RSIDs.",
             v = verbose
    )
    if(snp_colname != "RefSNP_id"){
        data.table::setnames(dat.annot, "RefSNP_id", snp_colname)
    }
    return(dat.annot)
}