## Tidy data concept

counts_df <- data.frame(
  day = c("Monday", "Tuesday", "Wednesday"),
  wolf = c(2, 1, 3),
  hare = c(20, 25, 30),
  fox = c(4, 4, 4)
)

## Reshaping multiple columns in category/value pairs

library(tidyr)
counts_gather <- gather(counts_df,
                        key = "species",
                        value = "count",
                        wolf:fox)

counts_spread <- spread(counts_gather, key = species, value = count)

## Exercise 1

counts_spread1 <- spread(counts_gather[-8,], key = species, value = count, fill=0)
counts_spread1

## Read comma-separated-value (CSV) files

surveys <- read.csv("data/surveys.csv", na.strings="")

## Subsetting and sorting

library(dplyr)
surveys_1990_winter <- filter(surveys, year == 1990, month %in% 1:3)

surveys_1990_winter <- select(surveys_1990_winter, -year)

sorted <- arrange(surveys_1990_winter, desc(species_id), weight)

## Exercise 2

ex2 <- select(
  filter(surveys, species_id == "RO"),
  record_id, sex, weight
)

## Grouping and aggregation

surveys_1990_winter_gb <- group_by(surveys_1990_winter, species_id)

counts_1990_winter <- summarize(surveys_1990_winter_gb, count = n())

## Exercise 3

DM <- filter(surveys, species_id == "DM")
DM_gb <- group_by(DM, month)
summarize(DM_gb, weight = mean(weight, na.rm = TRUE),
                 hindfoot_length = mean(hindfoot_length, na.rm = TRUE))

## Pivot tables through aggregate and spread

surveys_1990_winter_gb <- group_by(surveys_1990_winter, ...)
counts_by_month <- ...(surveys_1990_winter_gb, ...)
pivot <- ...

## Transformation of variables

prop_1990_winter <- mutate(...)

## Exercise 4

...

## Chaining with pipes

prop_1990_winter_piped <- surveys %>%
  filter(year == 1990, month %in% 1:3) %>%
  select(-year) %>% # select all columns but year
  group_by(species_id) %>% # group by species_id
  summarize(counts = n()) # summarize with counts
  ... # mutate into proportions
