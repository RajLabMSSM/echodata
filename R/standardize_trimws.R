standardize_trimws <- function(query, 
                               verbose=TRUE){
    
    cols_to_be_rectified <- names(query)[
        vapply(query, is.character, logical(1))
    ]
    if(length(cols_to_be_rectified)>0){
        messager("++ Removing extra whitespace", v=verbose)
        query <- query |>
            dplyr::mutate_at(.vars = cols_to_be_rectified,
                             .funs = trimws )
    } 
    return(query)
}