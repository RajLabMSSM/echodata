#' Store \code{fullSS_dat}
#'
#' Save downsampled genome-wide summary statistics from different GWAS to disk.
#'
#' \itemize{
#' \item{"Nalls2019"}{Parkinson's Disease GWAS from
#' \href{https://doi.org/10.1016/S1474-4422(19)30320-5}{
#' Nalls et al. 2019} (excluding 23andMe data).}
#' \item{"Kunkle2019"}{Alzheimer's Disease GWAS from
#' \href{https://doi.org/10.1038/s41588-019-0358-2}{
#' Kunkle et al. 2019}.}
#' }
#'
#' @param save_dir Path to save the example summary statistics to.
#' It is usually best to provide the absolute path
#'  rather than the relative path.
#' @param dataset Name of the example GWAS dataset to use.
#' @param nThread Number of threads to use.
#' @param verbose Print messages.
#'
#' @return Path to saved summary statistics file.
#'
#' @export
#' @examples
#' fullSS_path <- example_fullSS()
example_fullSS <- function(save_dir = tempdir(),
                           dataset = c("Nalls2019", "Kunkle2019"),
                           nThread = 1,
                           verbose = TRUE) {
    dataset <- tolower(dataset[1])
    fullSS_path <- file.path(
        save_dir,
        paste0(dataset, ".fullSS_subset.tsv")
    )
    dat <- if (dataset == "kunkle2019") {
        echodata::Kunkle2019
    } else if (dataset == "nalls2019") {
        echodata::Nalls2019
    } else {
        all_datasets <- c("Nalls2019", "Kunkle2019")
        stop_msg <- paste0(
            "dataset must be one of:\n",
            paste0(" - ", all_datasets, collapse = "\n")
        )
        stop(stop_msg)
    }

    messager("Writing file to ==>", fullSS_path, v = verbose)
    dir.create(dirname(fullSS_path),
        showWarnings = FALSE, recursive = TRUE
    )
    data.table::fwrite(
        x = dat,
        file = fullSS_path,
        nThread = nThread,
        sep = "\t"
    )
    return(fullSS_path)
}
