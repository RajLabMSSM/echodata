#' Assign lead SNP
#' 
#' Assign lead SNP by creating a new boolean column "leadSNP" 
#' indicating whether a SNP has the smallest p-value ("P).
#' If multiple rows have the same p-value, 
#'  the one with the largest effective size ("Effect") is used as the lead SNP.
#' @param dat Fine-mapping data.table.
#' @param verbose Print messages.
#' @returns Modified data.table.
#' @export 
#' @importFrom dplyr arrange desc
#' @importFrom utils head
#' @examples 
#' dat <- echodata::assign_lead_snp(dat = echodata::BST1)
assign_lead_snp <- function (dat, 
                             verbose = TRUE) {
    P <- Effect <- NULL;
    if (sum(dat$leadSNP, na.rm = TRUE) == 0) {
        messager("+ leadSNP missing. Assigning new one by min p-value.", 
                v = verbose)
        top.snp <- utils::head(
            dplyr::arrange(dat, P, dplyr::desc(Effect)))[1, 
        ]$SNP
        dat$leadSNP <- dat$SNP == top.snp
    }
    return(dat)
}
