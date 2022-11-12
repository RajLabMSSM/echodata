#' Search and download fine-mapping files
#'
#' Search the \href{https://github.com/RajLabMSSM/Fine_Mapping_Shiny}{
#' echolocatoR Fine-mapping Portal}
#' for fine-mapping results, LD, and locus plots.
#'
#' @param dataset_types Dataset types to search for
#'  (e.g. "GWAS", "QTL").  
#' @param datasets Dataset names to search for
#'  (e.g. "Ripke_2014", "Wray_2018").  
#' @param phenotypes Phenotypes to search for
#' (e.g. "Schizophrenia", "Major Depressive Disorder").  
#' @param loci Locus names to search for
#' (e.g. "BST1", "CHRNB1", "LRRK2").  
#' @param LD_panels LD panels to search for,
#' or results generated using different LD panels
#' (e.g. "UKB", "1KGphase1", "1KGphase3").  
#' @param file_types File types to search for:
#' \itemize{
#' \item{"multi_finemap":}{Fine-mapping results 
#' merged with GWAS/QTL summary statistics.}
#' \item{"LD":}{Linkage Disequilibrium with the lead SNP in each locus.}
#' \item{"plot" : }{Locus plots of fine-mapped results.}
#' }  
#' 
#' @param results_dir Where to save the matching queries.
#' @param overwrite Whether to overwrite previously saved queries
#' with the same names.
#' @param nThread Number of threads to parallelise downloads across.
#' @param as_datatable Return results organized in a 
#' \link[data.table]{data.table}. 
#' Otherwise, will return a list of local file paths.
#' @param verbose Print messages. 
#' @return List of local paths where the requested files were downloaded to.
#'
#' @export
#' @importFrom parallel detectCores
#' @importFrom data.table data.table rbindlist
#' @importFrom dplyr mutate
#' @importFrom tidyr separate
#' @examples 
#' local_finemap <- portal_query(
#'     dataset_types = "GWAS",
#'     phenotypes = c("schizophrenia", "parkinson"),
#'     file_types = "multi_finemap",
#'     loci = c("BST1", "CHRNB1", "LRRK2"),
#'     LD_panels="1KGphase3") 
portal_query <- function(dataset_types = NULL,
                         datasets = NULL,
                         phenotypes = NULL,
                         file_types = c("multi_finemap", "LD", "plot"),
                         loci = NULL,
                         LD_panels = c("UKB", "1KGphase1", "1KGphase3"),
                         results_dir = tempdir(),
                         overwrite = FALSE,
                         as_datatable = FALSE,
                         nThread = 1,
                         verbose = TRUE) {
    # echoverseTemplate:::source_all()
    # echoverseTemplate:::args2vars(portal_query)
    
    requireNamespace("echogithub")
    
    dataset_type <- path_local <- dataset <- locus <- link <- 
        url_strip <- link_raw <- NULL;
    
    #### Search metadata ####
    meta <- portal_metadata(verbose = verbose)
    meta <- if (!is.null(dataset_types)) {
        subset(meta, tolower(dataset_type) %in% tolower(dataset_types))
    } else {
        meta
    }

    meta <- if (!is.null(datasets)) {
        meta[grepl(paste(datasets, collapse = "|"), meta$dataset,
            ignore.case = TRUE), ]
    } else {
        meta
    }

    meta <- if (!is.null(phenotypes)) {
        meta[grepl(paste(phenotypes, collapse = "|"), meta$phenotype,
            ignore.case = TRUE), ]
    } else {
        meta
    }
    messager("+", formatC(nrow(meta),big.mark = ","),
             "dataset(s) remain after filtering.", v = verbose)
    if(nrow(meta)==0) stop("Stopping.")
    #### Find URLs ####
    file_type_dict <- c(
        "multi_finemap" = ".multi_finemap.csv.gz",
        "LD" = ".LD.csv.gz",
        "plot" = ".png"
    )
    shiny_data_url <- paste(
        "https://github.com/RajLabMSSM",
        ## "*.*: can be "blob" or "raw"
        "Fine_Mapping_Shiny/*.*/master/www/data",
        sep="/"
    )
    file_urls <- lapply(file_types, 
                        function(ftype) {
        messager("+ Searching for", ftype, "files...", v = verbose)
        dt <- echogithub::github_files(
            owner = "RajLabMSSM",
            repo = "Fine_Mapping_Shiny",
            query = paste0("www/data/.*",file_type_dict[[ftype]]),
            # IMPORTANT! not "main"
            branch = "master",
            verbose = verbose
        )
        return(cbind(dt,file_type = ftype))
    }) |> data.table::rbindlist(fill = TRUE) 

    #### Format url results ####
    file_filt <- file_urls |>
        dplyr::mutate(url_strip = gsub(paste0(shiny_data_url, "/"),"",link)) |>
        tidyr::separate(
            col = "url_strip", 
            sep = "/",
            into = c("dataset_type", "dataset", "locus"),
            remove = FALSE,
            extra = "drop"
        ) |>
        dplyr::select(-url_strip) |>
        subset(dataset_type %in% unique(meta$dataset_type) &
            dataset %in% unique(meta$dataset)) 
    #### Just download the loci of interest ####
    if (!is.null(loci)) file_filt <- subset(file_filt, locus %in% loci)
    messager("+", formatC(nrow(file_filt),big.mark = ","),
             "unique files identified.", v = verbose)
    #### Filter by LD panel #####
    file_filt <- file_filt[grepl(paste(LD_panels, collapse = "|"),
                                 file_filt$path, 
                                 ignore.case = TRUE), ]
    ### Download files ####
    local_file <- echogithub::github_files_download(
        ### "url" is a temporary file path meant for quick downloads.
        ## "link_raw" is a more permanent path that you would see in the browser
        filelist = file_filt[["link_raw"]],
        download_dir = results_dir,
        overwrite = overwrite,
        nThread = nThread,
        verbose = verbose)
    #### Return ####
    file_filt[,path_local:=local_file[unlist(link_raw)]]
    return(file_filt)
}
