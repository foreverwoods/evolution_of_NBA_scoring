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

threes_model <- 
  stan_glm(
    formula = PTS ~ `3PA` + `3P%`,
    data = nba_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 111
  )


#### Save model ####

saveRDS(
  threes_model,
  file = "models/threes_model.rds"
)


scoring_model <- 
  stan_glm(
    formula = PTS ~ `3PA` + `3P%` + `FGA` + `FG%` + `FTA` + `FT%`,
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


intangibles_model <- 
  stan_glm(
    formula = PTS ~ `ORB` + `AST` + `Pace` + `TOV`,
    data = nba_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 111
  )


#### Save model ####

saveRDS(
  intangibles_model,
  file = "models/intangibles_model.rds"
)


defense_model <- 
  stan_glm(
    formula = PTS ~  STL + BLK + PF + DRB,
    data = nba_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 111
  )


#### Save model ####

saveRDS(
  defense_model,
  file = "models/defense_model.rds"
)

