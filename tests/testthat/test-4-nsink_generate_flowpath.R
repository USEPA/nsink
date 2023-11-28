
context("nsink_generate_flowpath")
library(nsink)
library(sf)
load(system.file("testdata.rda", package="nsink"))
niantic_data$fdr <- terra::unwrap(niantic_data$fdr)
niantic_data$impervious <- terra::unwrap(niantic_data$impervious)
niantic_data$nlcd <- terra::unwrap(niantic_data$nlcd)
niantic_data$raster_template <- terra::unwrap(niantic_data$raster_template)
niantic_removal$raster_method$removal <- terra::unwrap(niantic_removal$raster_method$removal)
niantic_removal$raster_method$type <- terra::unwrap(niantic_removal$raster_method$type)
pt <- c(1948121,2295822)
start_loc <- st_sf(st_sfc(st_point(c(pt)), crs = aea))
start_loc_ll <- st_transform(start_loc, crs = 4326)
niantic_fp <- nsink_generate_flowpath(start_loc, niantic_data)


test_that("flowpath is generated", {
  expect_setequal(names(niantic_fp), c("flowpath_ends", "flowpath_network"))
})

test_that("prj check works", {
  expect_error(nsink_generate_flowpath(start_loc_ll,niantic_data))
})
