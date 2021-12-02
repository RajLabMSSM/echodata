test_that("github_find_pages works", {
    
    #### Test Fine_Mapping_Shiny repo #####
    testthat::expect_error(
        echodata:::github_find_pages(creator = "RajLabMSSM", 
                                     repo = "Fine_Mapping_Shiny",
                                     branch = "master")
    )
    #### Test Fine_Mapping repo ####
    ## Table mode
    links_df <- echodata:::github_find_pages(creator = "RajLabMSSM",
                                  repo = "Fine_Mapping",
                                  branch = "master")
    testthat::expect_true(methods::is(links_df,"data.table"))
    ## Vector mode
    gh_pages_links <- echodata:::github_find_pages(creator = "RajLabMSSM",
                                  repo = "Fine_Mapping",
                                  branch = "master",
                                  return_table = FALSE)
    testthat::expect_true(methods::is(gh_pages_links,"character"))
    testthat::expect_gte(length(gh_pages_links), 200)
})
