## Data analysis, using lengths obtained through Quadrats

# Load ggplot 2 and dplyr
library(ggplot2)
library(dplyr)

# Import Data
QuadratLengths <- read.csv('data/LengthsQuadrats.csv')

# Filter to only have the Sabine River
Sabine <- QuadratLengths %>%
  filter(River == "Sabine") %>%
  select(Length, Site, Species)

# Create box plot comparing the average length between sites
ggplot(data=Sabine, aes(x=Species, y=Length , fill=as.factor(Site))) + geom_boxplot()

