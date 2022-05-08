#' Find pages
#' 
#' Find html files on GitHub Pages.
#' @inheritParams github_list_files
#' @keywords internal 
github_find_pages <- function(creator = "RajLabMSSM",
                              repo = "Fine_Mapping_Shiny",
                              branch = "master",
                              local_repo = NULL,
                              return_table = TRUE,
                              save_path = NULL) {
    requireNamespace("data.table")
    if (is.null(local_repo)) {
        filelist <- github_list_files(
            creator = creator,
            repo = repo,
            query = "*.*.html$",
            branch = branch,
            return_download_api = FALSE
        )
    } else {
        filelist <- gsub("^[.][/]", "", list.files(
            path = local_repo,
            pattern = "*.*.html$",
            full.names = TRUE,
            recursive = TRUE
        ))
    }
    if(length(filelist)==0) {
        message("WARNING: No files identified.")
        return(NULL)
    }
    gh_pages_url <- paste(paste0("https://", creator, ".github.io"), 
                          repo,sep="/")
    gh_pages_links <- paste(gh_pages_url, filelist, sep="/")
    if (return_table) {
        links_df <- data.table::data.table(
            creator = creator,
            repo = repo,
            dir = unlist(
                lapply(
                    filelist,
                    function(x) {
                        strsplit(x, "/")[[1]][1]
                    }
                )
            ),
            subdir = unlist(
                lapply(
                    filelist,
                    function(x) {
                        strsplit(x, "/")[[1]][2]
                    }
                )
            ),
            url = gh_pages_links,
            link = paste0(
                "<a href='",
                gh_pages_links,
                "' target='blank'>",
                filelist, "</a>"
            )
        )
        if (!is.null(save_path)) {
            messager(paste("Writing links to ==>", save_path))
            data.table::fwrite(links_df, save_path, sep = ",")
            # utils::write.table(
            #     paste(pages[["link"]], collapse = "\n\n"),
            #     "results.md"
            # )
        }
        return(links_df)
    } else {
        return(gh_pages_links)
    }
}
