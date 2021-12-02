test_that("github_find_pages works", {
    
    #### Test Fine_Mapping_Shiny repo #####
    nolinks <- echodata:::github_find_pages(creator = "RajLabMSSM", 
                                     repo = "Fine_Mapping_Shiny",
                                     branch = "master") 
    testthat::expect_length(nolinks, 0)
    
    #### Test Fine_Mapping repo ####
    ## Table mode
    links_df <- echodata::: github_find_pages(creator = "RajLabMSSM",
                                  repo = "Fine_Mapping",
                                  branch = "master")
    ## Internet connection on GHA MacOS fails sometimes
    if(!is.null(links_df)){
        testthat::expect_true(methods::is(links_df,"data.table"))    
    } else {
        testthat::expect_null(links_df)
    }
    
    ## Vector mode
    gh_pages_links <- echodata:::github_find_pages(creator = "RajLabMSSM",
                                  repo = "Fine_Mapping",
                                  branch = "master",
                                  return_table = FALSE) 
    ## Internet connection on GHA MacOS fails sometimes
    if(!is.null(gh_pages_links)){
        testthat::expect_true(methods::is(gh_pages_links,"character"))
        testthat::expect_gte(length(gh_pages_links), 200)    
    } else {
        testthat::expect_null(gh_pages_links)
    }
})
