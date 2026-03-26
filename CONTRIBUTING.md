# Contributing to EuroBuTT Checklist

Thank you for your interest in contributing! This document outlines our development process and guidelines.

## Getting Started

1. **Fork and clone** the repository
2. **Set up your environment** - Follow [SETUP.md](./SETUP.md)
3. **Install dependencies** - Run `remotes::install_deps()` in R
4. **Create a branch** - Use descriptive names: `feature/add-xyz` or `fix/issue-xyz`

## Development Workflow

### Working with Data

The project uses a **data pipeline approach**:

```
Google Spreadsheet (source of truth)
    ↓ (run src/sync_data.R)
data/raw/ (CSV snapshot)
    ↓ (run src/dwc_mapping.Rmd)
data/processed/ (Darwin Core format)
```

**To sync latest data:**
```r
source("src/sync_data.R")
```

### Making Changes

1. **Data processing**: Edit `src/dwc_mapping.Rmd`
2. **Analysis/calculations**: Edit `src/wrl_values.Rmd`
3. **Utilities**: Add functions to `src/utils.R`

### Testing Your Changes

Before committing:
- Run your script in RStudio (Ctrl+Alt+R or "Run All")
- Check that output files are generated in `data/processed/`
- Verify no new errors in the console

### Running Validation

```r
# Source utility functions
source("src/utils.R")

# Load your data and validate
taxa <- read_csv("data/processed/taxon.csv")
validation <- validate_darwin_core(taxa, type = "taxon")
log_validation(validation)
```

## Commit Messages

Use clear, descriptive commit messages:

```
feat: Add new feature description
fix: Describe what was fixed
docs: Update documentation
refactor: Refactor component X
test: Add tests for feature Y
```

**Always include the Co-authored-by trailer:**
```
Co-authored-by: Your Name <your.email@example.com>
```

## Pull Request Process

1. Push your branch and open a pull request
2. Describe what changed and why
3. Reference any related issues (`Closes #123`)
4. Wait for review and make requested changes
5. GitHub Actions will automatically run validation

## Automation

The repository has automated workflows:

- **Data sync** - Runs daily at 2 AM UTC via GitHub Actions
- **Output rendering** - Automatically renders R Markdown on pushes
- **Validation** - Checks Darwin Core compliance

These are defined in `.github/workflows/render-outputs.yml`

## Project Structure

```
eurobutt-checklist/
├── src/                      # R processing scripts
│   ├── dwc_mapping.Rmd      # Darwin Core transformation
│   ├── wrl_values.Rmd       # Weighted red list calculations
│   ├── sync_data.R          # Google Sheets sync
│   └── utils.R              # Shared utility functions
├── data/
│   ├── raw/                 # Source data from Google Sheets
│   ├── interim/             # Intermediate calculations
│   └── processed/           # Final GBIF-ready outputs
├── DESCRIPTION              # R package dependencies
├── SETUP.md                 # Development setup guide
└── README.md                # Project documentation
```

## Security & Secrets

⚠️ **IMPORTANT**: Never commit the following:
- `.httr-oauth` (Google API token)
- API keys or credentials
- Personal data

These files are in `.gitignore`. If you accidentally commit a secret:
1. Let us know immediately
2. We'll revoke the affected credentials
3. Commit a fix removing the secret

## Questions?

- Check [SETUP.md](./SETUP.md) for setup issues
- Review existing [issues](https://github.com/inbo/eurobutt-checklist/issues)
- Open a new issue if you find a bug or have a feature request

Thank you for contributing! 🦋
