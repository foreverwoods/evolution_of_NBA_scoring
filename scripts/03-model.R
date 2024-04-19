#### Preamble ####
# Purpose: Models
# Author: Janssen Myer Rambaud
# Date: 1 April 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R, 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

set.seed(111)

#### Read data ####
nba_data <- read_parquet("./data/analysis_data/analysis_data.parquet")

### Model data ####

scoring_model <- 
  stan_glm(
    formula = PTS ~  
    data = nba_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 111
  )


#### Save model ####

saveRDS(
  scoring_model,
  file = "models/scoring_model.rds"
)
