% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/methods-plotGeneSaturation.R
\docType{methods}
\name{plotGeneSaturation}
\alias{plotGeneSaturation}
\alias{plotGeneSaturation}
\alias{plotGeneSaturation,bcbioRNASeq-method}
\title{Plot Gene Detection Saturation}
\usage{
plotGeneSaturation(object, ...)

\S4method{plotGeneSaturation}{bcbioRNASeq}(object, interestingGroups,
  normalized = "tmm", minCounts = 0L, trendline = TRUE,
  color = scale_color_viridis(discrete = TRUE), title = TRUE)
}
\arguments{
\item{object}{Object.}

\item{...}{Additional arguments.}

\item{interestingGroups}{Category to use to group samples. In the plotting
functions, this will define color and shape, where applicable. If unset,
this is automatically determined by the metadata set inside the
\link{bcbioRNASeq} object. When set to \code{NULL}, this will default to
\code{sampleName}.}

\item{normalized}{Count normalization method. See \code{\link[=counts]{counts()}} documentation
for more information.}

\item{minCounts}{Numeric value for filtering the counts matrix before
plotting.}

\item{trendline}{Include a trendline for each group.}

\item{color}{Desired ggplot color scale. Defaults to
\code{\link[=scale_color_viridis]{scale_color_viridis()}}. Must supply discrete values. When set to
\code{NULL}, the default ggplot2 color palette will be used. If manual color
definitions are desired, we recommend using \code{\link[=scale_color_manual]{scale_color_manual()}}.}

\item{title}{Title.}
}
\value{
\link{ggplot}.
}
\description{
Plot Gene Detection Saturation
}
\examples{
load(system.file("extdata/bcb.rda", package = "bcbioRNASeq"))
plotGeneSaturation(bcb)
}
\seealso{
Other Quality Control Plots: \code{\link{plot53Bias}},
  \code{\link{plotCountDensity}},
  \code{\link{plotCountsPerGene}},
  \code{\link{plotExonicMappingRate}},
  \code{\link{plotGenderMarkers}},
  \code{\link{plotGenesDetected}}, \code{\link{plotGene}},
  \code{\link{plotIntronicMappingRate}},
  \code{\link{plotMappedReads}},
  \code{\link{plotMappingRate}},
  \code{\link{plotRRNAMappingRate}},
  \code{\link{plotTotalReads}}
}
\author{
Michael Steinbaugh, Rory Kirchner, Victor Barrera
}