#' Target column map
#'
#' This function wraps all column name mappings for the full
#' GWAS/QTL summary statistics file specified by \code{fullSS_path}
#'  (i.e. the "target").
#'
#' @param chrom_col Name of the chromosome column in the full summary stats
#' file.
#' Can be "chr1" or "1" format.
#' (\emph{default: ="CHR"})
#' @param position_col Name of the genomic position column in the full summary
#' stats file.
#' Must be in units of basepairs.
#' (\emph{default: ="POS"})
#' @param snp_col Name of the SNP RSID column in the full summary stats file.
#' (\emph{default: ="SNP"})
#' @param pval_col Name of the p-value column in the full summary stats file.
#' Raw p-values are preferred, but if not available corrected p-values
#' (e.g. FDR) can be used instead.
#' (\emph{default: ="P"})
#' @param effect_col Name of the effect size column in the full summary stats file.
#' Effect size is preferred, but if not available other metrics like Beta for
#' Odds Ratio can be used instead.
#' (\emph{default: ="Effect"})
#' @param stderr_col Name of the standard error
#' column in the full summary stats file.
#' You can also set \code{stderr_col="calculate"} to infer standard error
#' using: \code{effect / tstat}.
#' (\emph{default: ="StdErr"})
#' @param tstat_col Name of the t-statistic column in the full
#' summary stats file.
#' This column is not necessary unless \code{stderr_col="calculate"}
#' or the standard error column is missing.
#' (\emph{default: ="t-stat"})
#' @param locus_col Name of the locus column in the full summary stats file.
#' (\emph{default: ="Locus"})
#' @param freq_col Name of the allele frequency column in the full
#'  summary stats file.
#' Effect allele frequency is preferred, but the non-effect allele can
#' be provided instead (though this may be less accurate).
#' This column is not necessary unless \code{MAF_col="calculate"} or
#'  the MAF column is missing.
#' (\emph{default: ="Freq"})
#' @param MAF_col Name of the minor allele frequency column in the
#' full summary stats file.
#' Can be inferred from \strong{freq_col} if missing from the dataset.
#' (\emph{default: ="MAF"})
#' @param A1_col Name of the effect/risk allele column in the full
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
#' @param gene_col For QTL studies, the name of the \[e\]gene column in the
#' full summary stats file (\emph{default: "gene"}).
#' This column will be used for filtering summary stats if supplying a named
#' list of gene:Locus pairs to \code{loci}.
#' @param N_cases_col Name of the column in the full summary stats that has
#'  the number of case subjects in the study.
#' This can either be per SNP sample sizes, or one number repeated
#' across all rows.
#' Proxy cases (e.g. relatives of people with the disease being investigated)
#' should be included in this estimate if any were used in the study.
#' This column is not necesssary if \code{N_cases} parameter is provided.
#' (\emph{default: ="N_cases"})
#' @param N_controls_col Name of the column in the full summary stats that
#'  has the number of control subjects in the study.
#'  This can either be per SNP sample sizes, or one number repeated across
#'   all rows.
#'  This column is not necesssary if \code{N_controls} parameter is provided.
#' (\emph{default: ="N_controls"})
#' @param N_cases The number of case subjects in the study.
#'  Instead of providing a redundant \strong{N_cases_col} column,
#'  you can simply enter one value here.
#' @param N_controls The number of control subjects in the study.
#'  Instead of providing a redundant \strong{N_controls_col} column,
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
construct_colmap <- function(chrom_col="CHR",
                          chrom_type=NULL,
                          position_col="POS",
                          snp_col="SNP",
                          pval_col="P",
                          effect_col="Effect",
                          stderr_col="StdErr",
                          tstat_col="t-stat",
                          locus_col="Locus",
                          freq_col="Freq",
                          MAF_col="MAF",
                          A1_col = "A1",
                          A2_col = "A2",
                          gene_col="Gene",
                          N_cases_col="N_cases",
                          N_controls_col="N_controls",
                          N_cases=NULL,
                          N_controls=NULL,
                          proportion_cases="calculate",
                          sample_size=NULL){
  match.call()

}
