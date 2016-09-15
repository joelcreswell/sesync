# Libraries
library(ggplot2)
library(dplyr)

# Data
species <- read.csv("data/species.csv", stringsAsFactors = FALSE)
surveys <- read.csv("data/surveys.csv", na.strings = "", stringsAsFactors = FALSE)

# User Interface
in1 <- selectInput("pick_species",
                   label = "Pick a species",
                   choices = unique(species[["species_id"]]))
out2 <- plotOutput("species_plot")
title <- textOutput("plot_title")
out4 <- dataTableOutput("species_plot_data")
side <- sidebarPanel("Options", in1, title)
main <- mainPanel(out2)
tab <- tabPanel("Species",
                sidebarLayout(side, main))
tab2 <- tabPanel("Data", out4)
ui <- navbarPage(title = "Portal Project", tab, tab2)

# Server
server <- function(input, output) {
  output[["species_plot"]] <- renderPlot(
    surveys %>%
      filter(species_id == input[["pick_species"]]) %>%
      ggplot(aes(x = year)) +
      geom_bar()
  )
  output[["plot_title"]] <- renderText(
    paste(
      select(
        filter(species, species_id == input[["pick_species"]]),
        -species_id, -taxa
      ),
      collapse = " "
    )
  )
  output[["species_plot_data"]] <- renderDataTable(
    surveys %>%
      filter(species_id == input[["pick_species"]])
  )
  
}

# Create the Shiny App
shinyApp(ui = ui, server = server)