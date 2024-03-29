% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fillNA_CS_PP.R
\name{fillNA_CS_PP}
\alias{fillNA_CS_PP}
\title{Fill NAs in PP and CS columns}
\usage{
fillNA_CS_PP(dat, fillNA_CS = 0, fillNA_PP = 0, verbose = TRUE)
}
\arguments{
\item{dat}{Fine-mapping results data.}

\item{fillNA_CS}{What to fill NA values in Credible Set ("*.CS") 
columns with.}

\item{fillNA_PP}{What to fill NA values in Posterior Probability ("*.PP")
columns with.}

\item{verbose}{Print messages.}
}
\value{
Modified \link[data.table]{data.table}
}
\description{
Fill NAs in columns with fine-mapping Posterior Probabilities 
(ending in ".PP") and and columns with Credible Set assignments 
(ending in ".CS").
}
\examples{
dat <- echodata::BST1 
dat <- echodata::fillNA_CS_PP(dat = dat)
}
\seealso{
Other general: 
\code{\link{createDT}()},
\code{\link{get_nrows}()},
\code{\link{get_os}()},
\code{\link{is_empty}()}
}
\concept{general}
