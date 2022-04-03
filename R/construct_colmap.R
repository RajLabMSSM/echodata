#' Target column map
#'
#' This function wraps all column name mappings for the full
#' GWAS/QTL summary statistics file specified by \code{fullSS_path}
#'  (i.e. the "target").
#'
#' @param munged Whether \code{fullSS_path} have already been
#' standardised/filtered  full summary stats
#' with \link[MungeSumstats]{format_sumstats}.
#' If \code{munged=FALSE} you'll need to provide the necessary
#'  column names to the \code{colmap} argument.
#' @param CHR Name of the chromosome column in the full summary stats
#' file.
#' Can be "chr1" or "1" format.
#' (\emph{default: ="CHR"})
#' @param POS Name of the genomic position column in the full summary
#' stats file.
#' Must be in units of basepairs.
#' (\emph{default: ="POS"})
#' @param SNP Name of the SNP RSID column in the full summary stats file.
#' (\emph{default: ="SNP"})
#' @param P Name of the p-value column in the full summary stats file.
#' Raw p-values are preferred, but if not available corrected p-values
#' (e.g. FDR) can be used instead.
#' (\emph{default: ="P"})
#' @param Effect Name of the effect size column in the full summary stats file.
#' Effect size is preferred, but if not available other metrics like Beta for
#' Odds Ratio can be used instead.
#' (\emph{default: ="Effect"})
#' @param StdErr Name of the standard error
#' column in the full summary stats file.
#' You can also set \code{stderr="calculate"} to infer standard error
#' using: \code{effect / tstat}.
#' (\emph{default: ="StdErr"})
#' @param tstat Name of the t-statistic column in the full
#' summary stats file.
#' This column is not necessary unless \code{stderr="calculate"}
#' or the standard error column is missing.
#' (\emph{default: ="t-stat"})
#' @param Locus Name of the locus column in the full summary stats file.
#' (\emph{default: ="Locus"})
#' @param Freq Name of the allele frequency column in the full
#'  summary stats file.
#' Effect allele frequency is preferred, but the non-effect allele can
#' be provided instead (though this may be less accurate).
#' This column is not necessary unless \code{MAF="calculate"} or
#'  the MAF column is missing.
#' (\emph{default: ="Freq"})
#' @param MAF Name of the minor allele frequency column in the
#' full summary stats file.
#' Can be inferred from \strong{freq} if missing from the dataset.
#' (\emph{default: ="MAF"})
#' @param A1 Name of the effect/risk allele column in the full
#' summary stats.
#'  \strong{\emph{IMPORTANT}}: Make sure this actually the case for your
#'   full summary stats file.
#' Unfortunately, different studies report different kinds of allele
#' information in a non-standardized way.
#' Meaning that A1/A2 can refer to any number of things:
#'  \describe{
#'  \item{effect/other alleles}{in the case of diseases}
#'  \item{ref/alt alleles}{where ref is the reference genome being used}
#'  \item{major/minor alleles}{This dichotomy holds true for bi-allelic
#'   SNPs but not necessary multi-allelic SNPs}
#'  }
#'  This makes comparing summary stats across GWAS/QTL datasets very
#'  confusing for several reasons:
#'  \describe{
#'  \item{Multi-allelic SNPs}{SNPs can have more than just 2 possible
#'  alleles (multi-allelic SNPs). Even if you compare the same SNP
#'  between two studies, you may accidentally be comparing
#'  totally different alleles.}
#'  \item{Valence}{The valence (+/-) of per-SNP GWAS effect sizes/beta
#'   can be relative to different allele types between studies.
#'  For example, let's say in one GWAS study your effect size for
#'   SNP A is 1.5 relative to the major allele in one study,
#'   and the minor allele happens to be the one found in the reference genome.
#'   You then try to compare that effect size to that of the same
#'   SNP in another GWAS.
#'   But, the valence of the effect sizes in the 2nd GWAS study are all
#'   relative to the reference genome (instead of the minor allele),
#'   giving the same SNP a value of -1.2. If you took the effect sizes
#'    at face value you'd say the signals are in opposite directions.
#'   But once you take into account how the valences were determined in
#'    each study you realize that they're actually both positive relative
#'     to the major allele.}
#'  }
#' This process of reversing per-SNP valences based on aligning the alleles
#'  is known as allele flipping.
#' This is important when comparing individual SNPs, but can also have an
#' impact on colocalization results.
#' @param Gene For QTL studies, the name of the \[e\]gene column in the
#' full summary stats file (\emph{default: "gene"}).
#' This column will be used for filtering summary stats if supplying a named
#' list of gene:Locus pairs to \code{loci}.
#' @param N_cases Name of the column in the full summary stats that has
#'  the number of case subjects in the study.
#' This can either be per SNP sample sizes, or one number repeated
#' across all rows.
#' Proxy cases (e.g. relatives of people with the disease being investigated)
#' should be included in this estimate if any were used in the study.
#' This column is not necesssary if \code{N_cases} parameter is provided.
#' (\emph{default: ="N_cases"})
#' @param N_controls Name of the column in the full summary stats that
#'  has the number of control subjects in the study.
#'  This can either be per SNP sample sizes, or one number repeated across
#'   all rows.
#'  This column is not necesssary if \code{N_controls} parameter is provided.
#' (\emph{default: ="N_controls"})
#' @param N_cases The number of case subjects in the study.
#'  Instead of providing a redundant \strong{N_cases} column,
#'  you can simply enter one value here.
#' @param N_controls The number of control subjects in the study.
#'  Instead of providing a redundant \strong{N_controls} column,
#'  you can simply enter one value here.
#' @param proportion_cases The proportion of total subjects in the
#' study that were cases.
#'  if \code{proportion_cases="calculate"} then this is inferred:
#'  \code{N_controls / N_controls}.
#' @param sample_size The overall sample size of the study.
#' If none is given, and \strong{N_cases} and \strong{N_controls}
#' columns are present,
#' then sample_size is inferred to be: \code{max(N_cases) + max(N_controls)}.
#'
#' @export
#' @examples
#' colmap <- echolocatoR::construct_colmap(munged=TRUE)
construct_colmap <- function(munged = FALSE,
                             CHR="CHR",
                             POS="POS",
                             SNP="SNP",
                             P="P",
                             Effect="Effect",
                             StdErr="StdErr",
                             tstat="tstat",
                             Locus="Locus",
                             Freq="Freq",
                             MAF="MAF",
                             A1="A1",
                             A2="A2",
                             Gene="Gene",
                             N_cases="N_cases",
                             N_controls="N_controls",
                             proportion_cases="calculate",
                             sample_size=NULL,
                             verbose = TRUE){
    
    colmap <- as.list(environment())
    ## If already munged with MungeSumstats, 
    ## replace certain standardised colnames.
    if(munged){
        messager(
            "Assuming fullSS_path summary stats have already been",
            "processed with MungeSumstats.",
            v=verbose)
        mss_colmap <- list(CHR="CHR",
                           POS="BP",
                           SNP="SNP",
                           P="P",
                           Effect="BETA",
                           StdErr="SE",
                           MAF="MAF",
                           Freq="FRQ",
                           N_cases="N_CAS",
                           N_controls="N_CON",
                           A1="A1",
                           A2="A2",
                           Gene="GENE")
        for(x in names(mss_colmap)){
            colmap[[x]] <- mss_colmap[[x]]
        }
    }
    return(colmap)
}
