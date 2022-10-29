#' Convert from GRanges to BED format
#' 
#' Convert \link[GenomicRanges]{GRanges} object to BED format 
#' and save as a text file.
#' @param grlist A list of \link[GenomicRanges]{GRanges} objects. 
#' Can also be a single non-list \link[GenomicRanges]{GRanges} object.
#' 
#' @param save_dir Where to save the BED file.
#' @param gzip Whether the BED file should be gzip compressed. 
#' @param verbose Print messages.
#' @inheritParams data.table::fwrite
#' @importFrom data.table as.data.table fwrite
#' @importFrom parallel mclapply
#' @importFrom dplyr select 
#' @export
#' @examples 
#' gr <- echodata::dt_to_granges(dat = echodata::BST1)
#' bed_path <- echodata::granges_to_bed(grlist = gr)
granges_to_bed <- function(grlist,
                           save_dir = tempdir(),
                           sep = "\t",
                           nThread = 1,
                           gzip = FALSE, 
                           verbose = TRUE) {
    
    seqnames <- start <- end <- strand <- NULL;
    if(!is.list(grlist)) grlist <- list(grlist)
    if(all(is.null(names(grlist)))) {
        names(grlist) <- paste0("granges",seq_len(length(grlist)) )
    }
    messager("Converting",length(grlist),
             "GRanges object to separate BED files.",
             v=verbose)
    BED_paths <- parallel::mclapply(
        names(grlist),
            function(name,
                     .gzip = gzip) {
                #### Convert ####
                GR <- grlist[[name]]
                BED <- data.table::as.data.table(GR) |>
                    dplyr::select(
                        chrom = seqnames,
                        chromStart = start,
                        chromEnd = end,
                        strand
                    ) 
                #### Save ####
                BED_path <- file.path(save_dir, paste0(
                    gsub(":", "-", name),
                    ".bed.txt"
                ))
                if(.gzip) BED_path <- paste0(BED_path, ".gz")
                dir.create(dirname(BED_path),
                           recursive = TRUE,
                           showWarnings = FALSE)
                messager("Saving BED file ==>",BED_path,v=verbose)
                data.table::fwrite(BED, BED_path,
                                   sep = sep,
                                   col.names = FALSE, 
                                   quote = FALSE,
                                   nThread = 1
                ) 
                return(BED_path) 
            },
            mc.cores = nThread
    ) |> unlist() 
    return(BED_paths)
}
