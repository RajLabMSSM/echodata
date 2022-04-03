#' Standardize the locus subset
#'
#' After querying a subset of the full summary statistics,
#' this function converts it into a standardized format
#' that the rest of \emph{echolocatoR} can work with.
#'
#' @export 
#' @importFrom dplyr %>% rename mutate arrange mutate_at 
#' @importFrom data.table fread data.table fwrite
#' @examples
#' BST1 <- echodata::BST1
#' #### Screw up Freq to see if function can fix it and infer MAF ####
#' BST1$rsid <- BST1$SNP
#' BST1 <- data.frame(BST1)[,!colnames(BST1) %in% c("MAF","SNP")]
#' BST1[c(10,30,55),"Freq"] <- 0
#' BST1[c(12,22),"Freq"] <- NA
#'
#' subset_path <- file.path(tempdir(),"BST1.tsv")
#' data.table::fwrite(BST1, subset_path)
#' query_mod <- echodata::standardize(subset_path = subset_path,
#'                                    locus = "BST1")
standardize <- function(query,
                        subset_path=NULL,
                        locus=NULL,
                        colmap = construct_colmap(),
                        return_dt = TRUE,
                        nThread = 1, 
                        verbose = TRUE){ 
   
    messager("Standardizing summary statistics subset.",v=verbose) 
    # ------ Required columns ------ #
    #### Rename main cols ####
    query <- standardise_main_colnames(query=query,
                                       colmap=colmap, 
                                       verbose=verbose)
    #### Impute StdErr ####
    query <- standardize_stderr(query=query,
                                colmap=colmap,
                                verbose=verbose)
    #### Gene col ####
    query <- standardize_Gene(query=query, 
                                  colmap=colmap,
                                  locus=locus,
                                  verbose=verbose) 
    # ------ Optional columns ------ # 
    #### Add ref/alt alleles if available ####
    query <- standardize_a1_a2(query=query,
                               colmap=colmap,
                               verbose=verbose) 
    ### MAF ####
    query <- standardize_maf(query=query, 
                             colmap=colmap,
                             verbose=verbose)
    #### N_cases/N_controls ###
    query <- standardize_ncas_ncon(query=query,
                                   colmap=colmap,
                                   verbose=verbose)
    #### proportion_cases ####
    query <- standardize_proportion_cases(query=query, 
                                         colmap=colmap, 
                                         verbose=verbose)
    #### sample size #### 
    query_mod <- get_sample_size(dat = query,
                                 method = colmap$sample_size,
                                 force_new = FALSE,
                                 verbose=verbose)
    #### Impute t-stat #### 
    ## Assign renamed values  
    colmap$Effect <- "Effect"; colmap$StdErr <- "StdErr"
    ## Impute 
    query <- calculate_tstat(dat=query,
                             colmap=colmap,
                             verbose=verbose)
    #### P ####
    query_mod <- standardize_p(query=query,
                               verbose=verbose) 
    #### leadSNP ####
    query <- assign_lead_snp(dat = query, 
                             verbose = verbose) 
    #### Remove duplicate columns ####
    query_mod <- data.frame(query_mod)[,!duplicated(colnames(query_mod))]
    ## Only convert to numeric AFTER removing NAs
    ## (otherwise as.numeric will turn them into 0s)
    query <- standardize_coltypes(query=query, 
                                  verbose=verbose) 
    ## Get just one SNP per location (just pick the first one)
    query <- standardize_1snp_per_coord(query=query,
                                        verbose=verbose)
    # Trim whitespaces
    ## Extra whitespace causes problems when you try
    ## to make space-delimited files.
    query <- standardize_trimws(query=query, 
                                verbose=verbose)
    #### Report #### 
    messager("+ Standardized query:",
             formatC(dim(query)[1], big.mark = ","), "SNPs",
             "x",
             formatC(dim(query)[2],big.mark = ","),
             "columns.",
             v=verbose)
    #### Save ####
    if(!is.null(subset_path)){
        messager("++ Saving standardized query ==>",subset_path,
                 v=verbose)
        dir.create(dirname(subset_path), 
                   showWarnings = FALSE, recursive = TRUE)
        data.table::fwrite(query_mod,
                           subset_path,
                           sep = "\t",
                           nThread = nThread)
    } 
    #### Return ####
    if(isFALSE(return_dt) && !is.null(subset_path)){
        return(subset_path) 
    } else { 
        return(data.table::data.table(query_mod))
    } 
}
