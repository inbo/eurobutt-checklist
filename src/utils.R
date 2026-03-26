# Utility functions for data processing
# Used by dwc_mapping.Rmd and wrl_values.Rmd

library(tidyverse)

#' Validate Darwin Core Format
#'
#' Check if data conforms to Darwin Core requirements
#'
#' @param data Data frame to validate
#' @param type Type of Darwin Core ("taxon", "distribution", "vernacularname")
#'
#' @return List with validation results
validate_darwin_core <- function(data, type = "taxon") {
  results <- list(
    valid = TRUE,
    errors = character(),
    warnings = character()
  )

  if (type == "taxon") {
    required_cols <- c("taxonID", "scientificName", "kingdom")
    missing <- setdiff(required_cols, names(data))
    if (length(missing) > 0) {
      results$valid <- FALSE
      results$errors <- c(results$errors, sprintf("Missing columns: %s", paste(missing, collapse = ", ")))
    }
    if (anyNA(data$taxonID)) {
      results$warnings <- c(results$warnings, "taxonID contains NA values")
    }
  }

  if (type == "distribution") {
    required_cols <- c("taxonID", "locationID", "occurrenceStatus")
    missing <- setdiff(required_cols, names(data))
    if (length(missing) > 0) {
      results$valid <- FALSE
      results$errors <- c(results$errors, sprintf("Missing columns: %s", paste(missing, collapse = ", ")))
    }
  }

  if (type == "vernacularname") {
    required_cols <- c("taxonID", "vernacularName", "language")
    missing <- setdiff(required_cols, names(data))
    if (length(missing) > 0) {
      results$valid <- FALSE
      results$errors <- c(results$errors, sprintf("Missing columns: %s", paste(missing, collapse = ", ")))
    }
  }

  return(results)
}

#' Check Data Integrity
#'
#' Validate input data for completeness and consistency
#'
#' @param taxa Taxa data frame
#' @param distribution Distribution data frame
#' @param regions Regions data frame
#'
#' @return List with validation results
check_data_integrity <- function(taxa, distribution, regions) {
  results <- list(
    valid = TRUE,
    errors = character(),
    warnings = character()
  )

  # Check for empty data frames
  if (nrow(taxa) == 0) {
    results$errors <- c(results$errors, "Taxa data is empty")
    results$valid <- FALSE
  }

  if (nrow(distribution) == 0) {
    results$errors <- c(results$errors, "Distribution data is empty")
    results$valid <- FALSE
  }

  # Check for missing values in key columns
  if (anyNA(taxa$scientific_name)) {
    results$warnings <- c(results$warnings, "Missing values in taxa$scientific_name")
  }

  if (anyNA(distribution$region_code)) {
    results$warnings <- c(results$warnings, "Missing values in distribution$region_code")
  }

  # Check for orphaned distributions (region_code not in regions)
  orphaned_codes <- setdiff(unique(distribution$region_code), regions$region_code)
  if (length(orphaned_codes) > 0) {
    results$warnings <- c(results$warnings,
      sprintf("Unknown region codes: %s", paste(orphaned_codes, collapse = ", ")))
  }

  return(results)
}

#' Log Validation Results
#'
#' Pretty-print validation results
#'
#' @param results List from validation functions
log_validation <- function(results) {
  if (results$valid) {
    message("✓ Validation passed")
  } else {
    message("✗ Validation failed")
  }

  if (length(results$errors) > 0) {
    message("Errors:")
    for (err in results$errors) {
      message(sprintf("  - %s", err))
    }
  }

  if (length(results$warnings) > 0) {
    message("Warnings:")
    for (warn in results$warnings) {
      message(sprintf("  - %s", warn))
    }
  }

  invisible(results)
}
