#' Store info necessary for Z-score
#'
#' Store the info about the full vector (length, mean, standard deviation),
#' so that you can later accurately compute Z-scores
#' when you're only working with a subset of the data.
#'
#' These functions are necessary for \code{PAINTOR}.
#' @keywords internal
#' @importFrom stats sd
zscore_get_mean_and_sd <- function(fullSS,
                                   target_col="statistic",
                                   Effect="beta",
                                   stderr_col="se",
                                   use_saved=TRUE,
                                   output_path){
  if(use_saved & file.exists(output_path)){
    messager("Reading in:",output_path,"...")
    z.info <- readRDS(output_path)
  } else {
    messager("Extracting mean and standard deviation from",fullSS,"...")
    if(target_col=="calculate"){
      target_col <- "t_stat"
      sample_x <- data.table::fread(fullSS, nThread = 1,
                                    select=c(Effect, stderr_col),
                                    col.names = c("Effect","StdErr"))
      sample_x <- subset(calculate_tstat(sample_x), select = target_col)
    }else {
      sample_x <- data.table::fread(fullSS, nThread = 1, select=c(target_col))
    }
    sample.mean <- mean(sample_x[[1]], na.rm = TRUE)
    sample.stdv <- stats::sd(sample_x[[1]])
    z.info <- list(file.name=fullSS,
                   colname=target_col,
                   sample.mean=sample.mean,
                   sample.stdv=sample.stdv,
                   sample.min=min(sample_x[[1]]),
                   sample.max=max(sample_x[[1]]))
    saveRDS(z.info, file = output_path )
  }
  return(z.info)
}
