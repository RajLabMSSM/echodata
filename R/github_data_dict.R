github_data_dict <- function(named_list) {
    data_dict <- list()
    for (x in names(named_list)) {
        dat <- named_list[[x]]
        data_dict[[x]] <- as.list(stats::setNames(
            dat,
            basename(dirname(dirname(dat)))
        ))
    }
    # Add the locus dir as a bonus
    data_dict$locus_dir <- as.list(stats::setNames(
        dirname(dirname(dat)),
        basename(dirname(dirname(dat)))
    ))
    # Dataset dir
    data_dict$dataset_dir <- dirname(dirname(dirname(dat)))[1]
    # Dataset name
    data_dict$dataset_type <- basename(dirname(dirname(dirname(
        dirname(dat)
    ))))[1]
    # data
    data_dict$dataset <- basename(dirname(dirname(dirname(dat))))[1]
    return(data_dict)
}
