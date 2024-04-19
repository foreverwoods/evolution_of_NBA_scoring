## Overview

Breaking down how scoring has changed in the National Basketball Association (NBA) throughout the past 24 years (since 2000) and what it may entail for the future.

**Overarching Question:** What drove the rise in scoring in the NBA since the 2000s, and what will scoring look like in the future?

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data collected from basketball-reference.com.
-   `data/analysis_data` contains the raw data which is cleaned for use in analysis and for the model.
-   `model` contains fitted models. 
-   `other` contains sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, clean, test, and model data.

## Data Download Clarification

The data downloaded is from https://www.basketball-reference.com/ and will downloaded prior since there are no
current R packages for retrieving NBA data, the most recent `nbastatR` is deprecated and outdated. As such,
there is no script for downloading the data and it the downloaded data will be uploaded in the data folder.


## Statement on LLM usage

There was no LLM usage throughout the development of this paper.
