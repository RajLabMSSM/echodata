#' Find Consensus SNPs
#'
#' Find Consensus SNPs in \link[echolocatoR]{finemap_loci} output.
#' 
#' @param dat Fine-mapping results data.
#' @param credset_thresh The minimum mean Posterior Probability
#'  (across all fine-mapping methods used) of SNPs to be included in 
#'  the "mean.CS" column.
#' @param consensus_thresh The minimum number of fine-mapping tools 
#' in which a SNP is in the Credible Set in order to be included in the 
#' "Consensus_SNP" column.
#' @param sort_by_support Whether to sort SNPs by the "Support" column.
#' @param exclude_methods Whether to exclude results from 
#' certain fine-mapping methods when mean/consensus columns.
#' @param verbose Print messages. 
#' @export
#' @importFrom dplyr %>% arrange desc
#' @examples
#' BST1 <- echodata::find_consensus_snps(dat = echodata::BST1)
find_consensus_snps <- function(dat,
                                credset_thresh = .95,
                                consensus_thresh = 2,
                                sort_by_support = TRUE,
                                exclude_methods = NULL,
                                verbose = TRUE) {
    Consensus_SNP <- Support <- NULL;
    messager("Identifying Consensus SNPs...", v = verbose)
    exclude_methods <- append(exclude_methods, "mean")
    # Find SNPs that are in the credible set for all fine-mapping tools
    CS_cols <- colnames(dat)[endsWith(colnames(dat), ".CS")]
    CS_cols <- CS_cols[!(CS_cols %in% paste0(exclude_methods, ".CS"))]
    if (consensus_thresh == "all") {
        consensus_thresh <- length(CS_cols)
    }
    messager("+ support_thresh =", consensus_thresh)
    # Get the number of tools supporting each SNP
    ## Make sure each CS is set to 1
    support_sub <- subset(dat, select = CS_cols) %>% data.frame()
    support_sub[sapply(support_sub, function(e) {
        e > 1
    })] <- 1
    dat$Support <- rowSums(support_sub, na.rm = TRUE)
    dat$Consensus_SNP <- dat$Support >= consensus_thresh
    # Sort
    if (sort_by_support) {
        dat <- dat %>% 
            dplyr::arrange(
            dplyr::desc(Consensus_SNP),
            dplyr::desc(Support)
        )
    }

    #### Calculate mean PP ####
    messager("+ Calculating mean Posterior Probability (mean.PP)...")
    PP.cols <- grep(".PP", colnames(dat), value = TRUE)
    PP.cols <- PP.cols[!(PP.cols %in% paste0(exclude_methods, ".PP"))]
    PP.sub <- subset(dat, select = c("SNP", PP.cols)) %>%
        data.frame() # %>% unique()
    PP.sub[is.na(PP.sub)] <- 0
    if (NCOL(PP.sub[, -1]) > 1) {
        dat$mean.PP <- rowMeans(PP.sub[, -1])
    } else {
        dat$mean.PP <- PP.sub[, -1]
    }
    dat$mean.CS <- ifelse(dat$mean.PP >= credset_thresh, 1, 0)

    # PP.sub %>% arrange(desc(mean.PP)) %>% head()
    messager("+", length(CS_cols), "fine-mapping methods used.")
    messager(
        "+", formatC(dim(subset(dat, Support > 0))[1], big.mark = ","),
        "Credible Set SNPs identified."
    )
    messager(
        "+", formatC(dim(subset(dat, Consensus_SNP == TRUE))[1], big.mark = ","),
        "Consensus SNPs identified."
    )
    return(dat)
}
