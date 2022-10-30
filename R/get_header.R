#' Get file header
#' 
#' Reading in this way is more robust and able to handle bgz format.
#' @param path Path to local file or remote URL.
#' @param colnames_only Whether to return only column names 
#' (default: \code{TRUE}), or the first \code{n} rows as well.
#' @param verbose Print messages.
#' @inheritParams data.table::fread
#' @inheritParams base::readLines
#' @export
#' @examples 
#' tmp <- tempfile(fileext = ".tsv.gz")
#' data.table::fwrite(echodata::BST1, file = tmp, sep = "\t") 
#' header <- echodata::get_header(path=tmp)
get_header <- function(path,
                       colnames_only=TRUE,
                       nrows=2L,
                       nThread=1L,
                       verbose=TRUE){
    
    #### Parquet ####
    if(grepl("\\.parquet$|\\.pq$",path,ignore.case = TRUE)){
        header <- read_parquet(path=path,
                               verbose=verbose)
        if(!is.null(nrows) && 
           !is.infinite(nrows)){
            header <- header[seq_len(nrows),]
        }
        return(header)
    } 
    #### Remote bgz #####
    ## Remote bgz files are a little trickier ####
    ## You have to download them first.
    if((!is_local(path)) & (endsWith(path,".bgz"))){
        tmp <- file.path(tempdir(), basename(path))
        ## Only download it if you have to
        if(!file.exists(tmp)){
            utils::download.file(url = path, 
                                 destfile = tmp) 
        } 
        path <- tmp
    }  
    #### Determine if VCF ####
    if(is.null(nrows)) nrows <- -2L
    is_vcf <-  any(endsWith(tolower(path),c(".vcf",".vcf.gz",".vcf.bgz")))
    if(is_vcf){
        header <- data.table::fread(text = readLines(con = path, 
                                                     n = nrows+1000),
                                    skip = "#CHROM",
                                    nThread = nThread, 
                                    nrows = nrows)
    } else {
        ### Reading in this way is more robust and able to handle bgz format.
        header <- data.table::fread(text=readLines(con = path,
                                                   n = nrows+1L),
                                    nThread = nThread)
    }
    
  if(colnames_only) header <- colnames(header)
  return(header)
}
