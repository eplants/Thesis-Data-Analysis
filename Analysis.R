## Data analysis, using lengths obtained through Mark-Recapture Study

# Load ggplot 2 and dplyr
library(ggplot2)
library(dplyr)

# Import Data
RecaptureLengths <- read.csv('data/MarkRecaptureLengths.csv')

#Remove the last column
RecaptureLengths <- RecaptureLengths %>%
  select(Species, Site, Length, Year, River)

ggplot(data=RecaptureLengths, aes(x=Species, y=Length , fill=as.factor(Year))) + geom_boxplot() + facet_grid(. ~ Site)

## Sabine ##

# Filter to only have the Sabine River
Sabine <- RecaptureLengths %>%
  filter(River == "Sabine") %>%
  select(Length, Site, Species)

# Create box plot comparing the average length between sites
ggplot(data=Sabine, aes(x=Species, y=Length , fill=as.factor(Site))) + geom_boxplot()

# Filter to only have the Sabine River
Sabine2 <- RecaptureLengths %>%
  filter(River == "Sabine") %>%
  select(Length, Site, Species, Year)

# Create box plot comparing the average length between sites, facet by year
ggplot(data=Sabine2, aes(x=Species, y=Length , fill=as.factor(Site))) + geom_boxplot() + facet_grid(. ~ Year)

# Create box plot comparing the average length between years, facet by site
ggplot(data=Sabine2, aes(x=Species, y=Length , fill=as.factor(Year))) + geom_boxplot() + facet_grid(. ~ Site)

## Neches ##
 
# Filter to only have the Neches River
Neches <- RecaptureLengths %>%
  filter(River == "Neches") %>%
  select(Length, Site, Species, Year) 

# Create box plot comparing the average length between years, facet by site
ggplot(data=Neches, aes(x=Species, y=Length , fill=as.factor(Year))) + geom_boxplot() + facet_grid(. ~ Site)

## Site 1, Sabine ##

# Select site 1 to compare histograms vs year
Site1 <- RecaptureLengths %>%
  filter(Site == "1") %>%
  select(Species, Length, Year)

# Create histogram to compare frequency over years
ggplot(data=Site1, aes(x=Length)) + geom_histogram(binwidth=10, colour="black", fill="white") + facet_grid(. ~ Year) + scale_x_continuous(breaks=seq(0,100,10)) + theme_bw() + ylab("Frequency") + xlab("Length(mm)")

# Create box plot comparing the average length between years
ggplot(data=Site1, aes(x=Species, y=Length , fill=as.factor(Year))) + geom_boxplot()


## Site 2, Sabine ##

# Select site 2 to compare histograms vs year
Site2 <- RecaptureLengths %>%
  filter(Site == "2") %>%
  select(Length, Year)

# Create histogram to compare frequency over years
ggplot(data=Site2, aes(x=Length)) + geom_histogram(binwidth=10, colour="black", fill="white") + facet_grid(. ~ Year) + scale_x_continuous(breaks=seq(0,100,10)) + theme_bw() + ylab("Frequency") + xlab("Length(mm)")

