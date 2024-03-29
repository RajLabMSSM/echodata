% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reassign_lead_snps.R
\name{reassign_lead_snps}
\alias{reassign_lead_snps}
\title{Reassign lead SNPs}
\usage{
reassign_lead_snps(
  merged_dat,
  SNP = "SNP",
  P = "P",
  Effect = "Effect",
  grouping_vars = c("Dataset", "Locus"),
  nThread = 1,
  verbose = TRUE
)
}
\arguments{
\item{merged_dat}{Merged, multi-locus fine-mapping results data.}

\item{SNP}{Name of the SNP column.}

\item{P}{Name of the p-value column.}

\item{Effect}{Name of the Effect column.}

\item{grouping_vars}{Column names to group by when assigning lead SNPs.}

\item{nThread}{Number of threads to parallelise across.}

\item{verbose}{Print messages.}
}
\description{
Reassign lead SNPs per group.
}
\examples{
 
merged_dat <- get_Nalls2019_merged()
merged_dat2 <- reassign_lead_snps(merged_dat = merged_dat)
}
