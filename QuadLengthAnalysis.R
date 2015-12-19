## Data analysis, using lengths obtained through quadrats ##

# Load ggplot 2 and dplyr
library(ggplot2)
library(dplyr)

# Import Data
QuadratLengths <- read.csv('data/LengthsQuadrats.csv')

## Sabine, Site 1 ##

# Select site 1 on the Sabine
Sabine1 <- QuadratLengths %>%
  filter(River == "Sabine") %>%
  filter(Site == "1") %>%
  select(Length, Heigth, Width)