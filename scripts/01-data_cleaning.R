#### Preamble ####
# Purpose: Clean the downloaded NBA data from basketball-reference.com
# Author: Janssen Myer Rambaud
# Date: 1 April 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: Make sure pre-downloaded .csv is in /data/raw_data/

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
nba_team_data <- read_csv("./data/raw_data/raw_data.csv")

## CLEAN DATA
cleaned_data <- nba_team_data |>
  drop_na() |>
  select(`Season`, `FG`, `FGA`, `3P`, `3PA`, `FT`, `FTA`, `ORB`, `DRB`, `TRB`, `AST`, `STL`, `BLK`, `TOV`, `PF`, `PTS`, `FG%`, `3P%`, `FT%`, `Pace`, `FT/FGA`, `ORtg`)



#### Save data ####
write_csv(cleaned_data, "./data/analysis_data/analysis_data.csv")
