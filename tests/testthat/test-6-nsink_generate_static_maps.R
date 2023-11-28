context("nsink_generate_static_maps")
library(nsink)
library(sf)
load(system.file("testdata.rda", package="nsink"))
niantic_data$fdr <- terra::unwrap(niantic_data$fdr)
niantic_data$impervious <- terra::unwrap(niantic_data$impervious)
niantic_data$nlcd <- terra::unwrap(niantic_data$nlcd)
niantic_data$raster_template <- terra::unwrap(niantic_data$raster_template)
niantic_removal$raster_method$removal <- terra::unwrap(niantic_removal$raster_method$removal)
niantic_removal$raster_method$type <- terra::unwrap(niantic_removal$raster_method$type)
horseneck_data$fdr <- terra::unwrap(horseneck_data$fdr)
horseneck_data$impervious <- terra::unwrap(horseneck_data$impervious)
horseneck_data$nlcd <- terra::unwrap(horseneck_data$nlcd)
horseneck_data$raster_template <- terra::unwrap(horseneck_data$raster_template)
horseneck_removal$raster_method$removal <- terra::unwrap(horseneck_removal$raster_method$removal)
horseneck_removal$raster_method$type <- terra::unwrap(horseneck_removal$raster_method$type)
low_west_data$fdr <- terra::unwrap(low_west_data$fdr)
low_west_data$impervious <- terra::unwrap(low_west_data$impervious)
low_west_data$nlcd <- terra::unwrap(low_west_data$nlcd)
low_west_data$raster_template <- terra::unwrap(low_west_data$raster_template)
low_west_removal$raster_method$removal <- terra::unwrap(low_west_removal$raster_method$removal)
low_west_removal$raster_method$type <- terra::unwrap(low_west_removal$raster_method$type)
up_west_data$fdr <- terra::unwrap(up_west_data$fdr)
up_west_data$impervious <- terra::unwrap(up_west_data$impervious)
up_west_data$nlcd <- terra::unwrap(up_west_data$nlcd)
up_west_data$raster_template <- terra::unwrap(up_west_data$raster_template)
up_west_removal$raster_method$removal <- terra::unwrap(up_west_removal$raster_method$removal)
up_west_removal$raster_method$type <- terra::unwrap(up_west_removal$raster_method$type)
skip_on_ci()
niantic_static <- nsink_generate_static_maps(niantic_data, niantic_removal,
                                             samp_dens = 3000)
low_west_static <- nsink_generate_static_maps(low_west_data, low_west_removal,
                                              samp_dens = 3000)
up_west_static <- nsink_generate_static_maps(up_west_data, up_west_removal,
                                             samp_dens = 2000)
test_that("static maps are generated correctly", {

  expect_setequal(names(niantic_static), c("removal_effic", "loading_idx",
                                         "transport_idx", "delivery_idx"))

  expect_equal(mean(terra::values(niantic_static$transport_idx), na.rm = TRUE),
               niantic_static_avg, tolerance = 0.1)

  expect_setequal(names(low_west_static), c("removal_effic", "loading_idx",
                                                "transport_idx", "delivery_idx"))
  expect_equal(mean(terra::values(low_west_static$transport_idx), na.rm = TRUE),
               low_west_static_avg, tolerance = 0.1)

  expect_setequal(names(up_west_static), c("removal_effic", "loading_idx",
                                                "transport_idx", "delivery_idx"))
  expect_equal(mean(terra::values(up_west_static$transport_idx), na.rm = TRUE),
               up_west_static_avg, tolerance = 0.3)
})

test_that("static maps have positive values", {
  expect_gte(min(terra::values(niantic_static$removal_effic), na.rm = TRUE), 0)
  expect_gte(min(terra::values(niantic_static$loading_idx), na.rm = TRUE), 0)
  expect_gte(min(terra::values(niantic_static$transport_idx), na.rm = TRUE), 0)
  expect_gte(min(terra::values(niantic_static$delivery_idx), na.rm = TRUE), 0)
})
