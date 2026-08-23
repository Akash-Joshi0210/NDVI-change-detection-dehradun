# NDVI-change-detection-dehradun
Satellite-based vegetation change detection using NDVI (Landsat 8/9) in QGIS and R

# 🌱 NDVI Change Detection – Dehradun, Uttarakhand (2015–2025)

Satellite-based vegetation change detection using NDVI (Normalized Difference Vegetation Index), built to support carbon project monitoring workflows aligned with methodologies like VM0047 (Verra).

## 📌 Overview
This project compares Landsat satellite imagery from **November 2015** and **November 2025** to detect vegetation gain/loss over a 10-year period in Dehradun, Uttarakhand, India. Same-season imagery was used to avoid seasonal (monsoon) bias in the results.

The workflow was implemented **twice** — once in **QGIS** (GUI-based) and once in **R** (script-based, reproducible) — to demonstrate both practical GIS skills and programmatic geospatial analysis.

## 🛰️ Data Source
- **Satellite:** Landsat 8 (2015) & Landsat 9 (2025)
- **Product:** Level-2 Surface Reflectance (Collection 2)
- **Source:** [USGS EarthExplorer](https://earthexplorer.usgs.gov/)
- **Bands used:** Band 4 (Red), Band 5 (Near-Infrared)

## 🔧 Methodology
1. Downloaded same-season Landsat scenes (Nov 2015, Nov 2025) for the study area
2. Calculated NDVI for each year: `NDVI = (NIR - Red) / (NIR + Red)`
3. Aligned rasters (resampling) to correct for extent mismatches between scenes
4. Computed NDVI difference (`NDVI_2025 - NDVI_2015`) to detect change
5. Clipped the result to a defined project boundary
6. Ran zonal statistics (mean, min, max) to quantify change within the boundary

## 🖥️ Tools Used
- **QGIS** – Raster Calculator, digitizing, Clip by Mask, Zonal Statistics
- **R** – `terra`, `sf` packages for raster processing and analysis

## 📊 Results
NDVI change map showing vegetation gain (green) and loss (red) between 2015 and 2025:

![NDVI Change Map](R/plot%205.png)

## 🔁 How to Run (R)
1. Download Landsat 8/9 Level-2 Surface Reflectance bands (B4, B5) from [USGS EarthExplorer](https://earthexplorer.usgs.gov/)
2. Place files in `data/2015/` and `data/2025/`
3. Run `R/change_detection.R`

## 📁 Repo Structure
