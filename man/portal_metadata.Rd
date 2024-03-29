% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/portal_metadata.R
\name{portal_metadata}
\alias{portal_metadata}
\title{Import metadata}
\usage{
portal_metadata(verbose = TRUE, timeout = 60)
}
\arguments{
\item{verbose}{Print messages.}

\item{timeout}{Number of seconds before timeout.}
}
\description{
Import metadata for all fine-mapping results files stored on
 the \href{https://github.com/RajLabMSSM/Fine_Mapping_Shiny}{
echolocatoR Fine-mapping Portal}.
}
\examples{
meta <- portal_metadata()
}
