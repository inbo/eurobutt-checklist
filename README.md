# National checklists and red lists for European butterflies

## Rationale

This repository contains the functionality to standardize the _National checklists and red lists for European butterflies_ to a [Darwin Core checklist](https://www.gbif.org/dataset-classes) that can be harvested by [GBIF](http://www.gbif.org).

The repository also includes the script to integrate red lists, calculate weighted red list values, and create the tables and figures for [Maes et al. (2019)](https://doi.org/10.1007/s10841-019-00127-z).

## Workflow

[source data](https://github.com/inbo/eurobutt-checklist/tree/master/data/raw) (maintained as a [Google Spreadsheet](https://docs.google.com/spreadsheets/d/1RvxpOYf2ZrTu9nsTLumoi-G-GGhh6_lV37TNtPiVES4/edit?usp=sharing)) → Darwin Core [mapping script](https://inbo.github.io/eurobutt-checklist/dwc_mapping.html) → generated [Darwin Core files](https://github.com/inbo/eurobutt-checklist/tree/master/data/processed)

[source data](https://github.com/inbo/eurobutt-checklist/tree/master/data/raw) → [analysis script](https://inbo.github.io/eurobutt-checklist/integrating_rl.html) → [tables and figures for Maes et al. (2019)](https://github.com/inbo/eurobutt-checklist/tree/master/reports)

## Published dataset

* [Dataset on the IPT](https://ipt.inbo.be/resource?r=eurobutt-checklist)
* [Dataset on GBIF](https://doi.org/10.15468/ye7whj)

## Repo structure

The repository structure is based on [Cookiecutter Data Science](http://drivendata.github.io/cookiecutter-data-science/) and the [Checklist recipe](https://github.com/trias-project/checklist-recipe). Files and directories indicated with `GENERATED` should not be edited manually.

```
├── README.md              : Description of this repository
├── LICENSE                : Repository license
├── eurobutt-checklist.Rproj : RStudio project file
├── .gitignore             : Files and directories to be ignored by git
│
├── data
│   ├── raw                : Source data from Google Spreadsheet, input for scripts GENERATED
│   ├── interim            : Interim data created for analysis GENERATED
│   └── processed          : Darwin Core output of mapping script GENERATED
│
├── docs                   : Repository website GENERATED
│
├── reports                : Figures and tables as output of analysis GENERATED
│
└── src
    ├── dwc_mapping.Rmd    : Darwin Core mapping script
    ├── integrating_rl.Rmd : Analysis script to integrate red lists
    ├── _site.yml          : Settings to build website in docs/
    └── index.Rmd          : Template for website homepage
```

## Getting Started

### Quick Start
1. Clone this repository: `git clone https://github.com/inbo/eurobutt-checklist.git`
2. Open `eurobutt-checklist.Rproj` in RStudio
3. Read [SETUP.md](./SETUP.md) for detailed installation instructions
4. Run `remotes::install_deps()` to install all dependencies
5. Open `src/dwc_mapping.Rmd` and click **Run All** to generate outputs

### Documentation

- **[SETUP.md](./SETUP.md)** - Development environment setup and OAuth authentication
- **[CONTRIBUTING.md](./CONTRIBUTING.md)** - Contribution guidelines and development workflow
- **[IMPROVEMENTS_SUMMARY.md](./IMPROVEMENTS_SUMMARY.md)** - Recent structural improvements

### Data Sync

To update raw data from Google Sheets:
```r
source("src/sync_data.R")
```

Or use the automated workflow that runs daily.

### Scripts

| Script | Purpose | Output |
|--------|---------|--------|
| `src/dwc_mapping.Rmd` | Transform to Darwin Core format | `data/processed/*.csv` |
| `src/wrl_values.Rmd` | Calculate weighted red list values | `data/processed/wrl_values_*.csv` |
| `src/sync_data.R` | Sync data from Google Sheets | `data/raw/*.csv` |

## Automation

This repository includes **GitHub Actions** for automated workflows:
- **Daily data sync** at 2 AM UTC
- **Automatic output rendering** on push/PR
- **Data validation** on all commits

See [GITHUB_ACTIONS_SETUP.md](./GITHUB_ACTIONS_SETUP.md) to set up the workflow.

## Project Structure

```
├── README.md                  : This file
├── SETUP.md                   : Setup instructions
├── CONTRIBUTING.md            : Contribution guidelines
├── DESCRIPTION                : R package dependencies
├── eurobutt-checklist.Rproj   : RStudio project file
│
├── src/
│   ├── dwc_mapping.Rmd       : Darwin Core mapping script
│   ├── wrl_values.Rmd        : Weighted red list calculation
│   ├── sync_data.R           : Google Sheets data sync
│   ├── utils.R               : Shared utility functions
│   ├── _site.yml             : Website config
│   └── index.Rmd             : Website template
│
├── data/
│   ├── raw/                  : Source data from Google Sheets
│   ├── interim/              : Intermediate calculations
│   └── processed/            : Final Darwin Core outputs
│
└── images/                    : Generated visualizations
```

## Contributors

[List of contributors](https://github.com/inbo/eurobutt-checklist/contributors)

## License

[MIT License](https://github.com/inbo/eurobutt-checklist/blob/master/LICENSE)
