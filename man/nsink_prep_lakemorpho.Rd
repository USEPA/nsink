% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nsink_prep_data.R
\name{nsink_prep_lakemorpho}
\alias{nsink_prep_lakemorpho}
\title{Prepare lake morphology data for N-Sink}
\usage{
nsink_prep_lakemorpho(data_dir)
}
\arguments{
\item{data_dir}{Base directory that contains N-Sink data folders.  Data may
be downloaded with the \code{\link{nsink_get_data}} function.}
}
\value{
A tibble of the lake morphology data
}
\description{
Standardizes lake morphology from the lake morphology tables.
}
\keyword{internal}
