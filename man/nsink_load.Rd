% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nsink_load.R
\name{nsink_load}
\alias{nsink_load}
\title{Load an existing N-Sink analysis folder}
\usage{
nsink_load(input_folder, base_name = "nsink_", projection = NULL, ...)
}
\arguments{
\item{input_folder}{Folder that contains nsink files produced by
\code{\link{nsink_build}}}

\item{base_name}{A base name used to assign objects to the global environment.}

\item{projection}{An optional CRS specified as a either an
EPSG code (as numeric) or WKT (as string).
Useful if projection is returned as unknown.}

\item{...}{Passes to \code{\link{nsink_calc_removal}} for the off network
arguments: \code{off_network_lakes}, \code{off_network_streams},
and \code{off_network_canalsditches}.}
}
\value{
Creates several lists in the global environment that would normally
        be created when running an N-Sink analysis.  These include:
        a \code{\link{nsink_prep_data}} object,
        a \code{\link{nsink_calc_removal}} object, and a
        \code{\link{nsink_generate_static_maps}} object
}
\description{
Load an existing N-Sink analysis folder
}
\examples{
\dontrun{
library(nsink)

aea <- 5072
nsink_build(nsink_get_huc_id("Niantic River")$huc_12, aea,
            output_folder = "nsink_output", samp_dens = 300)
nsink_load(input_folder = "nsink_output",
           base_name = "nsink_")
}
}
