#### Preamble ####
# Purpose: Tests that the data includes data with reasonable values
# Author: Ping-Jen (Emily) Su
# Date: 17 April 2024 
# Contact: emily.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Data downloaded

#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####

analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

# Test to ensure the data frame exists after loading.
test_that("Data frame is created", {
  expect_true(exists("data"))
})

# Check the class/type of variables in the data frame to match expectations.
test_that("Check class", {
  expect_type(analysis_data$interest_rate, "double")
  # Add more expectations for other variables
})


# Verify that the data frame contains the specific columns expected.
test_that("Data frame has correct columns", {
  expect_true(all(c("activity_year", "lei", "derived_msa_md") %in% names(data)))
})
