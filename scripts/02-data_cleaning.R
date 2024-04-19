#### Preamble ####
# Purpose: Clean and format the downloaded data
# Author: Ping-Jen (Emily) Su
# Date: 17 April 2024 
# Contact: emily.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Data downloaded

#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)
library(arrow)

# Read the CSV file, specifying that the first row contains column names
df <- read_csv("data/raw_data/raw_data.csv")

# Optionally, you may need to clean or transform specific columns here

# Convert 'interest_rate' column to numeric
df <- df %>%
  filter(!is.na(interest_rate)) %>%
  mutate(interest_rate = as.numeric(interest_rate)) %>% 
  filter(!(debt_to_income_ratio=='NA'))

#### Save data ####
write_parquet(df, "data/analysis_data/analysis_data.parquet")
write_csv(df, "data/analysis_data/analysis_data.csv") 


