#### Preamble ####
# Purpose: Clean NBA data downloaded
# Author: Janssen Myer Rambaud
# Date: 1 April 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)

#### Clean data ####


#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
