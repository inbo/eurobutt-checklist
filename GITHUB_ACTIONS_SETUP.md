# GitHub Actions Workflow for EuroBuTT Checklist
# 
# File location: .github/workflows/render-outputs.yml
# 
# This workflow:
# - Syncs data from Google Sheets daily
# - Renders R Markdown scripts to HTML
# - Generates Darwin Core and WRL outputs
# - Commits updated files back to repository
#
# Copy the content below to .github/workflows/render-outputs.yml

---CONTENT-START---

name: Render Darwin Core and WRL Outputs

on:
  push:
    branches:
      - main
      - master
  pull_request:
    branches:
      - main
      - master
  schedule:
    # Run daily at 2 AM UTC to sync data from Google Sheets
    - cron: '0 2 * * *'

jobs:
  render-outputs:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      
      - name: Set up R
        uses: r-lib/actions/setup-r@v2
        with:
          r-version: 'latest'
      
      - name: Install system dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y libssl-dev libcurl4-openssl-dev
      
      - name: Install R dependencies
        run: |
          install.packages("remotes")
          remotes::install_deps()
        shell: Rscript {0}
      
      - name: Sync data from Google Sheets
        run: |
          source("src/sync_data.R")
        shell: Rscript {0}
      
      - name: Render Darwin Core mapping
        run: |
          rmarkdown::render("src/dwc_mapping.Rmd", output_format = "html_document")
        shell: Rscript {0}
      
      - name: Render Weighted Red List values
        run: |
          rmarkdown::render("src/wrl_values.Rmd", output_format = "html_document")
        shell: Rscript {0}
      
      - name: Commit generated files
        run: |
          git config user.name "GitHub Actions"
          git config user.email "actions@github.com"
          git add data/raw/*.csv data/interim/*.csv data/processed/*.csv images/*.jpg src/*.html
          git diff --quiet && git diff --staged --quiet || (git commit -m "chore: Update outputs from automated workflow" && git push)
        if: github.event_name == 'schedule' || github.ref == 'refs/heads/main'
        continue-on-error: true

---CONTENT-END---
