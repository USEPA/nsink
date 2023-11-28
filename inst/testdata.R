library(nsink)
load("inst/testdata.rda")
niantic_data$fdr <- terra::unwrap(niantic_data$fdr)
niantic_data$impervious <- terra::unwrap(niantic_data$impervious)
niantic_data$nlcd <- terra::unwrap(niantic_data$nlcd)
niantic_data$raster_template <- terra::unwrap(niantic_data$raster_template)
niantic_removal$raster_method$removal <- terra::unwrap(niantic_removal$raster_method$removal)
niantic_removal$raster_method$type <- terra::unwrap(niantic_removal$raster_method$type)
huc <- nsink_get_huc_id("niantic")$huc_12
aea <- 5072
nsink_get_data(huc, "nsink_test_data")
niantic_data <- nsink_prep_data(huc, aea, "nsink_test_data/")
niantic_removal <- nsink_calc_removal(niantic_data)
niantic_static_maps <- nsink_generate_static_maps(niantic_data, niantic_removal,
                                             samp_dens = 3000)
niantic_static_avg <- mean(terra::values(niantic_static_maps$transport_idx),
                           na.rm = TRUE)
niantic_static_maps <- nsink_generate_static_maps(niantic_data, niantic_removal,
                                                  samp_dens = 900)
library(sf)
# Starting point
pt <- c(1948121, 2295822)
start_loc <- st_sf(st_sfc(st_point(c(pt)), crs = aea))
niantic_fp <- nsink_generate_flowpath(start_loc, niantic_data)
niantic_fp_removal <- nsink_summarize_flowpath(niantic_fp, niantic_removal)

huc <- "011000060405"
nsink_get_data(huc, "nsink_test_data")
horseneck_data <- nsink_prep_data(huc, aea, "nsink_test_data/")
horseneck_removal <- nsink_calc_removal(horseneck_data)
horseneck_static <- nsink_generate_static_maps(horseneck_data,
                                               horseneck_removal,
                                               samp_dens = 3000)
horseneck_static_avg <- mean(terra::values(horseneck_static$transport_idx),
                             na.rm = TRUE)

huc <- "010900040908"
nsink_get_data(huc, "nsink_test_data")
low_west_data <- nsink_prep_data(huc, aea, "nsink_test_data/")
low_west_removal <- nsink_calc_removal(low_west_data)
#Start Here
low_west_static <- nsink_generate_static_maps(low_west_data,
                                              low_west_removal,
                                               samp_dens = 3000)
low_west_static_avg <- mean(terra::values(low_west_static$transport_idx),
                             na.rm = TRUE)

huc <- "010900040906"
nsink_get_data(huc, "nsink_test_data",force = TRUE)
up_west_data <- nsink_prep_data(huc, aea, "nsink_test_data/")
up_west_removal <- nsink_calc_removal(up_west_data)
up_west_static <- nsink_generate_static_maps(up_west_data,
                                             up_west_removal,
                                               samp_dens = 2000)
up_west_static_avg <- mean(terra::values(up_west_static$transport_idx),
                            na.rm = TRUE)

rm(huc)
rm(niantic_static)
rm(horseneck_static)
rm(low_west_static)
rm(up_west_static)
niantic_data$fdr <- terra::wrap(niantic_data$fdr)
niantic_data$impervious <- terra::wrap(niantic_data$impervious)
niantic_data$nlcd <- terra::wrap(niantic_data$nlcd)
niantic_data$raster_template <- terra::wrap(niantic_data$raster_template)
niantic_removal$raster_method$removal <- terra::wrap(niantic_removal$raster_method$removal)
niantic_removal$raster_method$type <- terra::wrap(niantic_removal$raster_method$type)
up_west_data$fdr <- terra::wrap(up_west_data$fdr)
up_west_data$impervious <- terra::wrap(up_west_data$impervious)
up_west_data$nlcd <- terra::wrap(up_west_data$nlcd)
up_west_data$raster_template <- terra::wrap(up_west_data$raster_template)
up_west_removal$raster_method$removal <- terra::wrap(up_west_removal$raster_method$removal)
up_west_removal$raster_method$type <- terra::wrap(up_west_removal$raster_method$type)
low_west_data$fdr <- terra::wrap(low_west_data$fdr)
low_west_data$impervious <- terra::wrap(low_west_data$impervious)
low_west_data$nlcd <- terra::wrap(low_west_data$nlcd)
low_west_data$raster_template <- terra::wrap(low_west_data$raster_template)
low_west_removal$raster_method$removal <- terra::wrap(low_west_removal$raster_method$removal)
low_west_removal$raster_method$type <- terra::wrap(low_west_removal$raster_method$type)
horseneck_data$fdr <- terra::wrap(horseneck_data$fdr)
horseneck_data$impervious <- terra::wrap(horseneck_data$impervious)
horseneck_data$nlcd <- terra::wrap(horseneck_data$nlcd)
horseneck_data$raster_template <- terra::wrap(horseneck_data$raster_template)
horseneck_removal$raster_method$removal <- terra::wrap(horseneck_removal$raster_method$removal)
horseneck_removal$raster_method$type <- terra::wrap(horseneck_removal$raster_method$type)
niantic_static_maps$removal_effic <- terra::wrap(niantic_static_maps$removal_effic)
niantic_static_maps$loading_idx <- terra::wrap(niantic_static_maps$loading_idx)
niantic_static_maps$transport_idx <- terra::wrap(niantic_static_maps$transport_idx)
niantic_static_maps$delivery_idx <- terra::wrap(niantic_static_maps$delivery_idx)
save(list = ls(), file = "inst/testdata.rda", compress = "xz")

