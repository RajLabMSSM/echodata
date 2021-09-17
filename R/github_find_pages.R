github_find_pages <- function(creator = "RajLabMSSM",
                              repo = "Fine_Mapping_Shiny",
                              local_repo = NULL,
                              return_table = TRUE,
                              save_path = NULL) {
    if (is.null(local_repo)) {
        filelist <- github_list_files(
            creator = creator,
            repo = repo,
            query = "*.*.html",
            return_download_api = F
        )
    } else {
        filelist <- gsub("^[.][/]", "", list.files(
            path = local_repo,
            pattern = "*.*.html",
            full.names = TRUE,
            recursive = TRUE
        ))
    }
    gh_pages_url <- file.path(paste0("https://", creator, ".github.io"), repo)
    gh_pages_links <- file.path(gh_pages_url, filelist)
    if (return_table) {
        links_df <- data.frame(
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
            print(paste("Writing links to ==>", save_path))
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
