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
#'     LD_panels = "1KGphase3") 
portal_query <- function(dataset_types = NULL,
                         datasets = NULL,
                         phenotypes = NULL,
                         loci = NULL,
                         LD_panels = c("UKB", "1KGphase1", "1KGphase3"),
                         file_types = c("multi_finemap", "LD", "plot"),
                         results_dir = tempdir(),
                         overwrite = FALSE,
                         nThread = 1,
                         verbose = TRUE) {
    dataset_type <- URL <- dataset <- locus <- NULL;
    # echoverseTemplate:::source_all()
    # echoverseTemplate:::args2vars(portal_query)
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
    messager("+", nrow(meta), "datasets remain after filtering.", v = verbose)
    if(nrow(meta)==0) stop("Stopping.")
    #### Find URLs ####
    file_type_dict <- c(
        "multi_finemap" = ".multi_finemap.csv.gz",
        "LD" = ".LD.csv.gz",
        "plot" = ".png"
    )
    shiny_data_url <- paste(
        "https://github.com/RajLabMSSM",
        "Fine_Mapping_Shiny/raw/master/www/data",
        sep="/"
    )
    file_urls <- lapply(file_types, 
                        function(ftype) {
        messager("+ Searching for", ftype, "files...", v = verbose)
        remote_finemap <- github_list_files(
            creator = "RajLabMSSM",
            repo = "Fine_Mapping_Shiny",
            query = file_type_dict[[ftype]],
            # IMPORTANT! not "main"
            # like other repos for some reason
            branch = "master",
            verbose = FALSE
        )
        return(data.table::data.table(URL = remote_finemap, 
                                      file_type = ftype))
    }) |> data.table::rbindlist() |>
        # make sure to remove anything that's not in the data folder
        # (e.g. icons)
        subset(startsWith(URL, shiny_data_url))

    #### Format url results ####
    file_filt <- file_urls %>%
        dplyr::mutate(url_strip = gsub(
            paste0(shiny_data_url, "/"), "", URL
        )) %>%
        tidyr::separate(
            col = "url_strip", sep = "/",
            into = c("dataset_type", "dataset", "locus"),
            remove = FALSE,
            extra = "drop"
        ) %>%
        subset(dataset_type %in% unique(meta$dataset_type) &
            dataset %in% unique(meta$dataset))

    ## Let's just download the loci of interest.
    if (!is.null(loci)) file_filt <- subset(file_filt, locus %in% loci)
    messager("+", nrow(file_filt), "unique files identified.", v = verbose)
    ## Filter by LD panel
    file_filt <- file_filt[grepl(
        paste(LD_panels, collapse = "|"),
        file_filt$URL
    ), ]

    ### Download files ####
    local_finemap <- github_download_files(
        filelist = unique(file_filt$URL),
        download_dir = results_dir,
        overwrite = overwrite,
        nThread = nThread,
        verbose = verbose
    )
    messager("+ Returning local file paths.", v = verbose)
    return(local_finemap)
}
