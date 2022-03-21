#' Order loci
#'
#' Order loci by UCS size, or alphabetically.
#' @param dat Fine-mapped summary statistics data.
#' @param by_ucs_size Sort by Union Credible Set (UCS) size.
#' @param descending Sort \code{by_ucs_size} in descending order.
#' @param verbose Print messages.
#' @keywords export
#' @examples
#' merged_DT <- echodata::get_Nalls2019_merged()
#' merged_DT2 <- echodata::order_loci(dat=merged_DT)
order_loci <- function(dat,
                       by_ucs_size=FALSE,
                       descending=TRUE,
                       verbose=FALSE){
  if(by_ucs_size){
    messager("+ Ordering loci by UCS size.",v=verbose)
    locus_order <- echoannot:::get_CS_counts(merged_DT = dat)
    dat$Locus <- factor(dat$Locus,
                        levels = locus_order$Locus,
                        ordered = TRUE)
  } else{
    messager("+ Ordering loci alphabetically.",v=verbose)
    if(descending){
      dat$Locus <- factor(dat$Locus,
                          levels = rev(sort(unique(dat$Locus))),
                          ordered = TRUE)
    } else {
      dat$Locus <- factor(dat$Locus,
                          levels = sort(unique(dat$Locus)),
                          ordered = TRUE)
    }
  }
  return(dat)
}
