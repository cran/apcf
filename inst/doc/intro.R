## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE)
library(apcf)

## -----------------------------------------------------------------------------
# it's advised against setting n_sim < 199
dists <- pat2dists(area=sim_area, pattern=sim_pat_reg, 
                   max_dist=25, n_sim=9, verbose=FALSE)
head(dists)

## -----------------------------------------------------------------------------
pcf <- dists2pcf(dists, r=0.2, r_max=25, stoyan=0.15, n_rank=1)
head(pcf)

## ---- fig.width=4, fig.height=3.5---------------------------------------------
plot(pcf)

