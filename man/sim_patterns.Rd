% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/doc_patterns.R
\docType{data}
\name{sim_patterns}
\alias{sim_patterns}
\alias{sim_area}
\alias{sim_pat_clust}
\alias{sim_pat_rand}
\alias{sim_pat_reg}
\title{Simulated Patterns (sample data)}
\format{
A set of \href{https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry}{WKBs}
of class \code{\link[wk:is_wk_wkb]{wk_wkb}} containing the study area and three simulated patterns.

\tabular{lll}{
\strong{Dataset name} \tab \strong{Description}\cr
\code{sim_area}      \tab study area\cr
\code{sim_pat_reg}   \tab simulated regular pattern\cr
\code{sim_pat_rand}  \tab simulated random pattern\cr
\code{sim_pat_clust} \tab simulated clustered pattern\cr
}

The study area is a square of 100 m x 100 m. A set of n = 100 objects were
created and latter placed according to the designated spatial distribution.
The size distribution and shapes of the objects are inspired by measurements
of canopy gaps. The areas of the objects range from 1.6 m2 to 57.7 m2 with
an arithmetic mean of 9.7 m2 and a median of 5.5 m2. The total area of all
objects is 969.7 m2, meaning 9.7\% of the study area is covered by objects.

For the \code{sim_pat_reg} dataset, the objects were arranged in a strict
regular manner. A centric systematic grid was constructed, and the objects
of the set were then randomly rotated and randomly placed by locating the
centroids of the objects exactly on the matching randomly numbered grid
points, resulting in a regular arrangement of objects with a constant
distance of the centroids of 10 m.

For the \code{sim_pat_rand} dataset with randomly distributed objects, we
generated a realisation of the Binomial process with intensity 0.01 m^-2,
meaning one point per 100 m2. The objects were again randomly rotated and
numbered and objects put on matching points with their centroid as close to
the point as possible without overlapping other objects.

The \code{sim_pat_clust} dataset represents a clustered configuration. Again,
we first created a point pattern with 100 points and then put the randomly
numbered objects on the points. The point pattern was a realisation of
Matern’s cluster process with w = 0.0006 m^-2 or 6 cluster centres per ha,
a dispersion radius of R = 10 m and on average y = 16.6 points per cluster.

We used the R-package spatstat (Baddeley et al. 2015) for simulating
the Binomial process and Matern’s cluster process.
}
\source{
Nuske et al. 2009
}
\usage{
sim_area

sim_pat_clust

sim_pat_rand

sim_pat_reg
}
\description{
The simulated patterns were created for testing the Adapted Pair Correlation
Function presented in Nuske et al. (2009).
}
\examples{
ds <- pat2dists(area=sim_area, pattern=sim_pat_reg, max_dist=25, n_sim=3)

}
\references{
Baddeley A., Rubak E. and Turner, R. (2015): Spatial Point Patterns:
Methodology and Applications with R. Chapman and Hall/CRC, London.
https://doi.org/10.1201/b19708

Nuske, R.S., Sprauer, S. and Saborowski, J. (2009): Adapting the
pair-correlation function for analysing the spatial distribution of canopy
gaps. Forest Ecology and Management, 259(1): 107–116.
https://doi.org/10.1016/j.foreco.2009.09.050
}
\keyword{datasets}
