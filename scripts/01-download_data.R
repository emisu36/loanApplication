#### Preamble ####
# Purpose: Samples and saves the data from downloaded csv
# Author: Ping-Jen (Emily) Su
# Date: 17 April 2024 
# Contact: emily.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Dataset downloaded from https://ffiec.cfpb.gov/data-publication/snapshot-national-loan-level-dataset/2022



#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)

#### Download data ####
# Define the file path
file_path <- "data/raw_data/2022_public_lar_csv.csv"


# Read the first 5 lines
lines <- read_lines(file_path, skip = 0, n_max = 1501)

data_frame <- tibble(lines)

# Split each line by comma
data_frame <- strsplit(lines, ",", fixed = TRUE)

# Convert the list of vectors to a data frame
df <- as.data.frame(do.call(rbind, data_frame))

# Set column names based on the first row
colnames(df) <- as.character(data_frame[[1]])

# Remove the first row (since it contains column names)
df <- df[-1, ]


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(df, "data/raw_data/raw_data.csv") 

         
