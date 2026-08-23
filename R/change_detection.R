# ============================================
# NDVI Change Detection (2015-2025)
# Dehradun, Uttarakhand, India
# Data: Landsat 8/9 Level-2 Surface Reflectance (USGS EarthExplorer)
# ============================================
# Install required packages (run once)
# install.packages(c("terra", "sf"))
library(terra)
library(sf)

# ---- Load 2015 bands ----
# Please place your downloaded Landsat bands in data/2015/ and data/2025/
red_2015 <- rast("data/2015/LC08_L2SP_146039_20151111_20200908_02_T1_SR_B4.TIF")
nir_2015 <- rast("data/2015/LC08_L2SP_146039_20151111_20200908_02_T1_SR_B5.TIF")

# ---- Load 2025 bands ----
red_2025 <- rast("data/2025/LC09_L2SP_146039_20251114_20251115_02_T1_SR_B4.TIF")
nir_2025 <- rast("data/2025/LC09_L2SP_146039_20251114_20251115_02_T1_SR_B5.TIF")

# ---- Align 2025 bands to 2015 grid ----
# Landsat scenes from different dates can have slightly different extents,
# so we resample 2025 bands to match the 2015 grid before comparing them.
nir_2025 <- resample(nir_2025, nir_2015)
red_2025 <- resample(red_2025, red_2015)

# ---- Calculate NDVI ----
# NDVI = (NIR - Red) / (NIR + Red)
ndvi_2015 <- (nir_2015 - red_2015) / (nir_2015 + red_2015)
ndvi_2025 <- (nir_2025 - red_2025) / (nir_2025 + red_2025)

# ---- Change Detection ----
# Positive values = vegetation gain, Negative values = vegetation loss
ndvi_change <- ndvi_2025 - ndvi_2015

# ---- Visualize the result ----
plot(ndvi_change,
     main = "NDVI Change 2015-2025 (Dehradun, Uttarakhand)",
     col = colorRampPalette(c("red", "yellow", "green"))(100),
     range = c(-0.3, 0.3))
