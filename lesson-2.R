## The Editor

vals <- seq(1,100)

vals <- seq(from=1,
            to=100)

## Vectors

counts <- c(4, 3, 7, 5)

## Lists

x <- list(list(1, 2), c(3, 4))
y <- c(list(1, 2), c(3, 4))

## Factors

education <- factor(c("college", "highschool", "college", "middle"),
                 levels = c("middle", "highschool", "college"),
                 ordered=TRUE)

## Data Frames

df<- data.frame(education, counts)

## Exercise 1

species <- c("frog","zebra","blue","seven")
count <- c(2,9,426,3)

data <- data.frame(species, count)

## Names

names(df) <- c("ed","ct")

## Subsetting ranges

days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
weekdays <- days[2:6]
weekend <- days[c(1,7)]

## Exercise 2

weekdays1 <- days[-c(1,7)]

mwf <- days[seq(2, 6, by = 2)]

## Anatomy of a function

first <- function(x) {
  result <- x[1, 1]
  return(result)
}

## Exercise 3
# Subset data frame to give the results "highschool", "college"

df[2:3,1]

## Distributions and statistics

x <- rnorm(..., mean = .., sd = ...)
y <- r...(n = 100, size = 50, ...)

fit <- ...

## Exercise 4

...

## Install missing packages

requirements <- c('dplyr',
                  'ggplot2',
                  'leaflet',
                  'RSQLite',
                  'rgdal',
                  'rgeos',
                  'raster',
                  'shiny',
                  'sp',
                  'tidyr',
                  'tmap')
missing <- setdiff(requirements,
                   rownames(installed.packages()))

if (length(missing) != 0) {
  install.packages(missing)
}
