#' Adapted Pair Correlation Function
#'
#' A faster implementation of the Adapted Pair Correlation Function presented
#' in Nuske et al. (2009) in C++ using the library GEOS directly instead of
#' through PostGIS.
#'
#' The Adapted Pair Correlation Function transfers the concept of the Pair
#' Correlation Function from point patterns to patterns of objects of finite
#' size and irregular shape (eg. lakes within a country). The main tasks are
#' (i) the construction of null models by rondomizing the objects of the
#' original pattern within the study area, (ii) the edge correction by
#' determining the proportion of a buffer within the study area, and
#' (iii) the calculation of the shortest distances between the objects.
#'
#' This package mainly provides three functions:
#' - [pat2dists()] creates null models and calculates distances and ratios,
#' - [dists2pcf()] turns distances and ratios into an edge corrected PCF, and
#' - [plot()] plots Pair Correlation Functions.
#'
#'
#' @section Pattern to Distances & Ratios:
#' The task consists of two parts: creating null models / permutations and
#' calculating distances between all objects of a pattern and determining
#' the fraction of the perimeter a buffer inside the study area.
#' Permutations of the original pattern are achieved by randomly rotating
#' and randomly placing all objects within the study area without overlap.
#'
#' The resulting collection of distances and ratios of each null model and the
#' original pattern are returned as an object of class [dists] (a data.frame
#' with some additional attributes).
#'
#' The library GEOS (>= 3.4.0) is used for the geometrical analysis of the pattern.
#' Geodata are converted to GEOS Geometries. The GEOS functions are called
#' from C++ Functions which are integrated into R via Rcpp and wrapped in the
#' R function [pat2dists()].
#'
#'
#' @section Create an edge corrected PCF:
#' The [dists] objects are turned into [fv_pcf] objects by the function [dists2pcf()].
#' A C++ function finds all distances and ratios belonging to a null model or
#' the original pattern (marked with index 0) and calculates a density function
#' using the Epanechnikov kernel and Ripley's edge correction. Resulting in as
#' many PCFs as null models were created plus a PCF for the original pattern.
#' From the PCF of the null models a pointwise critical envelope is derived.
#' The arithmetic mean of all PCF of the null models is employed for a bias
#' correction of the empirical PCF and the upper and lower bound of the envelope.
#'
#'
#' @section Plot a PCF:
#' [plot.fv_pcf()] is an S3 method of the plot function for the class [fv_pcf].
#' It provides a nice plot of the empirical PCF together with the pointwise
#' critical envelope.
#'
#'
#' @references
#' Nuske, R.S., Sprauer, S. and Saborowski, J. (2009): Adapting the
#' pair-correlation function for analysing the spatial distribution of canopy
#' gaps. Forest Ecology and Management, 259(1): 107–116.
#' https://doi.org/10.1016/j.foreco.2009.09.050
#'
#' @name apcf-package
"_PACKAGE"
