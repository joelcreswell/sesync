## Libraries and data

library(dplyr)
library(ggplot2)
surveys <- read.csv("data/surveys.csv", na.strings = "") %>%
  filter(!is.na(species_id), !is.na(sex), !is.na(weight))

## Constructing layered graphics in ggplot

ggplot(data = surveys,
       aes(x = species_id, y = weight)) +
  geom_point()


ggplot(data = surveys,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean",
             color = "red")

## Exercise 1

filter(surveys, species_id == "DM") %>%

ggplot(
       aes(x = year, y = weight, color = factor(sex))) +
  geom_point(stat = "summary",
             fun.y = "mean")

## Adding a regression line

levels(surveys$sex) <- c("Female", "Male")
surveys_dm <- filter(surveys, species_id == "DM")
ggplot(surveys_dm,
       aes(x = year, y = weight)) +
  geom_point(aes(shape = sex, color = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  geom_smooth(method = "lm",
              aes(group = sex, color = sex))

ggplot(data = surveys_dm,
       aes(x = year, y = weight, color = sex)) +
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  geom_smooth(method = "lm")

# Storing and re-plotting

year_wgt <- ggplot(data = surveys_dm,
                   aes(x = year,
                       y = weight,
                       color = sex)) +
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  geom_smooth(method = "lm")

year_wgt +
  scale_color_manual(values = c("darkblue", "darkgreen"))
                     
year_wgt <- year_wgt +
  scale_color_manual(values = c("darkblue", "darkgreen"))
year_wgt

## Exercise 2

ggplot(surveys_dm,
       aes(x = weight)) +
  geom_histogram(aes(fill = sex)) +
  scale_color_manual(values = c("green","purple"))

## Axes, labels and themes

histo <- ggplot(data = surveys_dm,
                aes(x = weight, fill = sex)) +
  geom_histogram(binwidth = 3, color = "white")
histo

histo <- histo +
  labs(title = "Dipodomys merriami weight distribution",
       x = "Weight (g)",
       y = "Count") +
  scale_x_continuous(limits = c(20, 60),
                     breaks = c(20, 30, 40, 50, 60)) +
histo + scale_fill_manual(values = c("green","purple"))

histo <- histo +
  theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = element_text(face = "bold", vjust = 2),
        axis.title.y = element_text(size = 13, vjust = 1),
        axis.title.x = element_text(size = 13, vjust = 0))
histo

## Facets

surveys_dm$month <- as.factor(surveys_dm$month)
levels(surveys_dm$month) <- c("January", "February", "March", "April", "May", "June",
                              "July", "August", "September", "October", "November", "December")

ggplot(data = surveys_dm,
       aes(x = weight, fill = sex)) +
  geom_histogram() +
  facet_wrap(~ month) +
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)")

ggplot(data = surveys_dm,
       aes(x = weight, fill = month)) +
  ...
  facet_wrap( ~ month) +
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)

## Exercise 3

...

