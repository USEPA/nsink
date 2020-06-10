nsink
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![R build
status](https://github.com/jhollist/nsink/workflows/R-CMD-check/badge.svg)](https://github.com/jhollist/nsink/actions)
[![Codecov test
coverage](https://codecov.io/gh/jhollist/nsink/branch/master/graph/badge.svg)](https://codecov.io/gh/jhollist/nsink?branch=master)
<!-- badges: end -->

The `nsink` package is an R implementation of the methods described in
[Kellogg et. al (2010)](https://doi.org/10.1016/j.ecoleng.2010.02.006).
Previous implementation of this approach relied on a manual, vector
based approach that was time consuming to prepare. This approach uses a
hybrid raster-vector approach that takes very relatively little time to
set up for each new watershed and relies on readily available data.
Total run times vary, but range from minutes up to 5 hours depending on
options selected. Previous versions took weeks of manual data
manipulation.

As of 2020-06-10 user functions for the `nsink` package are:

  - `nsink_get_data()` - Pass HUC, get data, use cache to avoid repeat
    downloads
  - `nsink_prep_data()` - Prepares data by clipping to specified HUC,
    standardizing projections, standardizing raster extents. Outputs
    will be HUC level for HUC, flow direction, streams, waterbodies,
    impervious, and soils.
  - `nsink_calc_removal()` - implemented now as purely raster, might be
    able to do hybrid approach (see lines 384+ in working\_nsink.Rmd).
    Use a method argument for c(“raster”, “hybrid”). Maybe not here?  
  - `nsink_generate_flowpath()` - This generates a single flowpath for a
    point selected on the landscape. The flowpath is contstructed of the
    raster flow direction generated flowpath on land, and then uses the
    NHDPlus flowpath once the raster flowpath intersects the NHDPlus
    flowpath.
  - `nsink_summarize_flowpath()` - Summarizes flowpath removal and
    returns a list with flowpath rasters for removal and type, the total
    removal for the flowpath, and a summary data frame of removal per
    segment along the flowpath.
  - `nsink_generate_static_maps()` - Function to create static maps for
    a HUC. Four static maps are created:
      - Nitrogen Removal Efficiency
      - Nitrogen Loading Index
      - Nitrogen Transport Index
      - Nitrogen Delivery Index
  - `nsink_plot_removal()` - Plot function to quickly visualize the
    Nitrogen Removal Efficiency rasters.
  - `nsink_plot_transport()` - Plot function to quickly visualize the
    Nitrogen Transport Index rasters.
  - `nsink_plot_delivery()` - Plot function to quickly visualize the
    Nitrogen Delivery Index rasters.
  - `nsink_build()` - Convenience function to run an N-Sink analysis on
    a 12-digit HUC. All base datasets, prepared data, and derived static
    maps are saved to an output folder. The expected use of this
    function is to provide the basis for building an N-Sink application
    outside of R (e.g. with ArcGIS)
  - `nsink_load()` - Another convenience function that will load the
    results of `nsink_build()` into R. This makes it easier to continue
    to work in R on an `nsink` analysis if build for a given watershed
    has already occurred.

## Installation

At this time we plan on maintaining the `nsink` package as a GitHub only
package and thus it won’t be available directly from CRAN. You may use
the `install_github()` function from the `remotes` package to install
it. The code below will take care of installing `remotes` and installing
`nsink` from the GitHub repository.

``` r
install.packages("remotes")
remotes::install_github("jhollist/nsink", build_vignettes = TRUE)
```

And then to load up the package and view the “Introduction to nsink”
vignette:

``` r
library(nsink)
vignette("intro", package = "nsink")
```
