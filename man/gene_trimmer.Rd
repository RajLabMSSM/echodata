% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gene_trimmer.R
\name{gene_trimmer}
\alias{gene_trimmer}
\title{Remove all SNPs outside of of a given gene.}
\usage{
gene_trimmer(dat, gene, min_POS = NA, max_POS = NA)
}
\description{
Get the min/max coordinates of a given gene 
(including known regulatory regions, introns, and exons).
Remove any SNPs from the data.frame that fall outside these coordinates.
}
\seealso{
Other SNP filters: 
\code{\link{filter_snps}()},
\code{\link{limit_snps}()}
}
\concept{SNP filters}
\keyword{internal}
