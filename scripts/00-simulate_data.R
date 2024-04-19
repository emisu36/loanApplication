#### Preamble ####
# Purpose: Simulates the data for loan application
# Author: Emily (Ping-Jen) Su
# Date: 17 April 2024 
# Contact: emily.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: -
# Any other information needed? -


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(tidyr)
library(purrr)

# Set seed for reproducibility
set.seed(123)

# Define the number of rows
num_rows <- 1000

# Simulate data
simulated_data <- tibble(
  activity_year = rep(2022, num_rows),
  lei = sample(letters, num_rows, replace = TRUE),
  derived_msa_md = sample(10000:99999, num_rows, replace = TRUE),
  state_code = sample(letters[1:5], num_rows, replace = TRUE),
  county_code = sample(100:999, num_rows, replace = TRUE),
  census_tract = sample(100000000:999999999, num_rows, replace = TRUE),
  conforming_loan_limit = sample(c("C", "NC"), num_rows, replace = TRUE),
  derived_loan_product_type = sample(c("Conventional:First Lien", "FHA:First Lien"), num_rows, replace = TRUE),
  derived_dwelling_category = sample(c("Single Family (1-4 Units):Site-Built", "Other"), num_rows, replace = TRUE),
  derived_ethnicity = sample(c("Not Hispanic or Latino", "Ethnicity Not Available"), num_rows, replace = TRUE),
  derived_race = sample(c("Asian", "Black or African American", "Race Not Available"), num_rows, replace = TRUE),
  derived_sex = sample(c("Male", "Female", "Sex Not Available"), num_rows, replace = TRUE),
  action_taken = sample(0:3, num_rows, replace = TRUE),
  purchaser_type = sample(0:2, num_rows, replace = TRUE),
  preapproval = sample(0:2, num_rows, replace = TRUE),
  loan_type = sample(1:3, num_rows, replace = TRUE),
  loan_purpose = sample(1:3, num_rows, replace = TRUE),
  lien_status = sample(1:2, num_rows, replace = TRUE),
  reverse_mortgage = sample(1:2, num_rows, replace = TRUE),
  open_end_line_of_credit = sample(1:2, num_rows, replace = TRUE),
  business_or_commercial_purpose = sample(1:2, num_rows, replace = TRUE),
  loan_amount = sample(100000:500000, num_rows, replace = TRUE),
  combined_loan_to_value_ratio = runif(num_rows, min = 80, max = 100),
  interest_rate = runif(num_rows, min = 5, max = 8),
  property_value = sample(100000:700000, num_rows, replace = TRUE),
  occupancy_type = sample(1:3, num_rows, replace = TRUE)
)

# Display the first few rows of the simulated data
head(simulated_data)
