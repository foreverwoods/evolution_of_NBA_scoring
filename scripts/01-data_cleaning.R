#### Preamble ####
# Purpose: Clean the downloaded NBA data from basketball-reference.com
# Author: Janssen Myer Rambaud
# Date: 1 April 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: Make sure pre-downloaded .csv is in /data/raw_data/

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
nba_team_data <- read_csv("./data/raw_data/raw_data.csv")

## CLEAN DATA
cleaned_data <- nba_team_data |>
  drop_na() |>
  filter(substr(Season, 1, 4) >= 2000) |>   ## substr because we need to strip first 4 vals in Season format ####-##
  select(`Season`, `FGA`, `3PA`, `FTA`, `ORB`, `DRB`, `AST`, `STL`, `BLK`, `TOV`, `PF`, `PTS`, `FG%`, `3P%`, `FT%`, `Pace`)



#### Save data ####
write_parquet(cleaned_data, "./data/analysis_data/analysis_data.parquet")

