% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/snp_group_colorDict.R
\name{snp_group_colorDict}
\alias{snp_group_colorDict}
\title{Assign colors to each SNP group}
\usage{
snp_group_colorDict(invert = FALSE)
}
\arguments{
\item{invert}{Whether to invert the order of the dictionary.}
}
\value{
A named list (\emph{group_key:color_value}).
}
\description{
Assign colors to each SNP group as defined in 
\link[echodata]{snp_group_filters}.
}
\examples{
colorDict <- echodata::snp_group_colorDict()
}
