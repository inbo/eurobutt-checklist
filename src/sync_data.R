# Data Sync from Google Sheets
# Automatically pulls raw data from Google Spreadsheet and saves to data/raw/
# Run this before processing to ensure you have the latest data

# Load dependencies
library(readr)
library(here)

# Google Sheets URLs (published as CSV)
SHEETS_URLS <- list(
  distribution = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSrKN8_XbQ4Vo-VrtUiqAtS5im3QxkHBNSJHPSLmrkM5C1PIC7DOg-oboRcEJZtWp_qsi802YRlRp8C/pub?gid=979140000&single=true&output=csv",
  taxa = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSrKN8_XbQ4Vo-VrtUiqAtS5im3QxkHBNSJHPSLmrkM5C1PIC7DOg-oboRcEJZtWp_qsi802YRlRp8C/pub?gid=1559651428&single=true&output=csv",
  regions = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSrKN8_XbQ4Vo-VrtUiqAtS5im3QxkHBNSJHPSLmrkM5C1PIC7DOg-oboRcEJZtWp_qsi802YRlRp8C/pub?gid=2076261682&single=true&output=csv",
  references = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSrKN8_XbQ4Vo-VrtUiqAtS5im3QxkHBNSJHPSLmrkM5C1PIC7DOg-oboRcEJZtWp_qsi802YRlRp8C/pub?gid=1083424499&single=true&output=csv",
  rlc = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSrKN8_XbQ4Vo-VrtUiqAtS5im3QxkHBNSJHPSLmrkM5C1PIC7DOg-oboRcEJZtWp_qsi802YRlRp8C/pub?gid=1579699417&single=true&output=csv"
)

# Create output directory if it doesn't exist
raw_dir <- here("data", "raw")
if (!dir.exists(raw_dir)) {
  dir.create(raw_dir, recursive = TRUE)
}

# Download and save each sheet
message("Syncing data from Google Sheets...")

for (sheet_name in names(SHEETS_URLS)) {
  tryCatch({
    message(sprintf("  Downloading %s...", sheet_name))
    data <- read_csv(SHEETS_URLS[[sheet_name]], show_col_types = FALSE)
    output_path <- file.path(raw_dir, sprintf("%s.csv", sheet_name))
    write_csv(data, output_path, na = "")
    message(sprintf("    ✓ Saved %d rows to %s", nrow(data), basename(output_path)))
  }, error = function(e) {
    warning(sprintf("  ✗ Failed to download %s: %s", sheet_name, e$message))
  })
}

message("Data sync complete!")
