#' List files in GitHub repo
#'
#' Search for files within a public GitHub repository and return their paths.
#'
#' @param creator Repo creator name
#'  (can be organization or individual GitHub account name).
#' @param repo GitHub repository name.
#' @param branch Which branch to search.
#' @param query Query substring.
#' @param return_download_api Return the link to download each file
#' (instead of its path).
#' @param verbose Print messages.
#' @inheritParams httr::timeout
#'
#' @return A list of paths.
#'
#' @export
#' @importFrom httr GET message_for_status content timeout
github_list_files <- function(creator = "RajLabMSSM",
                              repo = "Fine_Mapping_Shiny",
                              branch = c("main", "master"),
                              query = NULL,
                              return_download_api = TRUE,
                              seconds = 5*60,
                              verbose = TRUE) {
    repo_api <- paste(
        "https://api.github.com/repos", creator, repo,
        paste0("git/trees/", branch[1], "?recursive=1"),
        sep="/"
    )
    httr::timeout(seconds = seconds)
    req <- httr::GET(repo_api)
    httr::message_for_status(req)
    filelist <- unlist(lapply(httr::content(req)$tree, "[", "path"),
        use.names = FALSE
    )
    messager(paste(
        length(filelist), "files found in GitHub repo:",
        file.path(creator, repo)
    ), v = verbose)
    if (!is.null(query)) {
        # query_string <- "*Nalls23andMe_2019.*UKB.multi_finemap.csv.gz"
        bool <- grepl(query, filelist)
        filelist <- filelist[bool]
        messager(paste(length(filelist), "files found matching query."),
            v = verbose
        )
    }
    if (return_download_api) {
        filelist <- paste(
            "https://github.com", creator, repo, "raw",
            branch, filelist,
            "/"
        )
    }
    return(filelist)
}
