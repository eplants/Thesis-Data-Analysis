# Import Data
Quadrats <- read.csv('data/EdithQuadrats.csv')

# Load ggplot 2 and dplyr
library(ggplot2)
library(dplyr)

# Select F. askewi and multiply all live/dead values by 4 to convert from 0.25m quadrats to 1m quadrats
riddellii_7 <- Quadrats %>% 
  select(Site, Species, Quadrat, Live, Dead) %>% 
  filter(Species == "P. riddellii") %>%
  mutate(Live_1m = Live * 4) %>%
  mutate(Dead_1m = Dead * 4) %>%
  select(Site, Live_1m, Dead_1m) %>%
  filter(Site == "7") %>%
  select(Live_1m, Dead_1m)

# Add Total for all Live
mean(riddellii_7$Live_1m, na.rm=TRUE)
mean(riddellii_7$Dead_1m, na.rm=TRUE)
sum(riddellii_7$Live_1m, na.rm=TRUE)
sum(riddellii_7$Dead_1m, na.rm=TRUE)

# Load mean and totals for F. askewi and P. riddellii
riddelliMean <- read.csv('data/RiddelliiMean.csv')
riddelliTotal <- read.csv('data/RiddelliiTotal.csv')
askewiMean <- read.csv('data/AskewiAvg.csv')
askewiTotal <- read.csv('data/AskewiTotals.csv') 

# Graph basic bar graph comparing Live and Dead
ggplot(data=riddelliMean, aes(x=Site, y=Number.of.Individuals , fill=Status)) + geom_bar(stat="identity", position=position_dodge()) + scale_fill_manual(values=c("#d1ea56", "#55e4af")) + theme_bw()

ggplot(data=riddelliTotal, aes(x=Site, y=Number.of.Individuals , fill=Status)) + geom_bar(stat="identity", position=position_dodge()) + scale_fill_manual(values=c("#d1ea56", "#55e4af")) + theme_bw()

ggplot(data=askewiMean, aes(x=Site, y=Number.of.Individuals , fill=Status)) + geom_bar(stat="identity", position=position_dodge()) + scale_fill_manual(values=c("#d1ea56", "#55e4af")) + theme_bw()

ggplot(data=askewiTotal, aes(x=Site, y=Number.of.Individuals , fill=Status)) + geom_bar(stat="identity", position=position_dodge()) + scale_fill_manual(values=c("#d1ea56", "#55e4af")) + theme_bw()