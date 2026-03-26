# Local Development Setup

## Prerequisites

- **R** (>= 3.5.0) - Download from https://cran.r-project.org/
- **RStudio** (optional but recommended) - Download from https://rstudio.com/products/rstudio/download/

## Installation

### 1. Install Dependencies

Open RStudio or R console and run:

```r
# Install required packages
remotes::install_deps()
```

Or manually install all packages listed in `DESCRIPTION`:

```r
install.packages(c(
  "tidyverse", "tidylog", "magrittr", "here", "janitor",
  "digest", "rgbif", "readr", "dplyr", "ggplot2", "gam"
))
```

### 2. Set Up Google Sheets Authentication

The scripts access data from a Google Spreadsheet. To enable this:

#### Option A: Interactive OAuth Flow (Recommended)
1. Open RStudio and load the project (`eurobutt-checklist.Rproj`)
2. Run `dwc_mapping.Rmd` or `wrl_values.Rmd`
3. On first run, a browser window will open asking for Google Sheets API permission
4. Grant access - this creates `.httr-oauth` token locally
5. **The token is automatically .gitignored and never committed**

#### Option B: Use Environment Variable
1. If you already have a Google OAuth token, save it as `.httr-oauth` in the `src/` directory
2. Do NOT commit it - it's in `.gitignore`

## Running Scripts

### Via RStudio
1. Open `eurobutt-checklist.Rproj` in RStudio
2. Open either:
   - `src/dwc_mapping.Rmd` - Darwin Core format transformation
   - `src/wrl_values.Rmd` - Weighted red list calculations
3. Click **"Run All"** or use `Ctrl+Alt+R`

### Via R Console
```r
library(rmarkdown)
rmarkdown::render("src/dwc_mapping.Rmd")
rmarkdown::render("src/wrl_values.Rmd")
```

## Data Flow

```
Google Spreadsheet (source)
    ↓
src/dwc_mapping.Rmd → data/processed/taxon.csv, distribution.csv, vernacularname.csv
    ↓
GBIF harvest-ready dataset

src/wrl_values.Rmd → data/processed/wrl_values_*.csv
    ↓
Conservation priority metrics
```

## Security Notes

- `.httr-oauth` tokens are **never** committed to git
- Delete `.httr-oauth` locally to force re-authentication on next run
- Tokens are temporary and expire - re-authenticate as needed

## Troubleshooting

### "tidyverse not found" error
- Run `install.packages("tidyverse")` in R console
- Restart RStudio after installation

### Google Sheets access denied
- Delete `src/.httr-oauth`
- Re-run the script to trigger fresh authentication
- Ensure you have access to the spreadsheet

### Paths not found
- Make sure you're running scripts from the project root (RStudio does this automatically)
- If running manually, use `here::here()` paths or set working directory with `setwd()`

## Project Structure

```
eurobutt-checklist/
├── src/                    # R Markdown processing scripts
│   ├── dwc_mapping.Rmd    # Transform to Darwin Core format
│   └── wrl_values.Rmd     # Calculate weighted red list values
├── data/
│   ├── raw/               # Source data (from Google Sheets)
│   ├── interim/           # Intermediate calculations
│   └── processed/         # Final GBIF-ready outputs
├── DESCRIPTION            # R package dependencies
└── README.md              # Project documentation
```
