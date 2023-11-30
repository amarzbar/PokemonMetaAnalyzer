library(DT)
library(shiny)
library(cluster)
library(dplyr)
library(caret)
library(rpart)
library(ggplot2)
library(lattice)
# Read the Pokemon data
pokemon_data <- read.csv("pokemon_data_smogon.csv")
pokemon_data$BST <- rowSums(pokemon_data[, c("HP", "Attack", "Defense", "Special.Attack", "Special.Defense", "Speed")])
# Filter data to exclude "National Dex"
training_data <- subset(pokemon_data, Formats != "National Dex")

# Train the decision tree model
set.seed(123)
model <- rpart(Formats ~ BST, data = training_data, method = "class")




ui <- fluidPage(
  titlePanel("Pokémon Meta-Analyzer"),
  
  tabsetPanel(
    tabPanel("Table",
             DTOutput("pokemonTable")),
    tabPanel("Analysis",
             sidebarLayout(
               sidebarPanel(
                 checkboxGroupInput("selectedRankings", "Select Rankings:", 
                                    choices = unique(pokemon_data$Formats),
                                    selected = c())
               ),
               mainPanel(
                 plotOutput("scatterPlot"),
                 textOutput("predictionOutput")
               )
             )
    )
  )
)

server <- function(input, output) {
  output$pokemonTable <- renderDT({
    datatable(pokemon_data, options = list(pageLength = 10), rownames = FALSE)
  })
  
  # Reactive expression for filtered and predicted data
  filtered_and_predicted_data <- reactive({
    # Filter data based on selected rankings
    filtered_data <- pokemon_data[pokemon_data$Formats %in% input$selectedRankings, ]
    
    # Select relevant columns for clustering
    clustering_data <- pokemon_data[pokemon_data$Formats %in% input$selectedRankings, ]
    
    # Predict using the decision tree model
    predictions <- predict(model, newdata = clustering_data, type = "class")
    
    # Add predicted tier to the data
    filtered_data$PredictedTier <- as.factor(predictions)
    print(filtered_data)
    filtered_data
  })
 
  output$scatterPlot <- renderPlot({
    ggplot() +
      geom_point(data = filtered_and_predicted_data(), aes(as.numeric(PredictedTier), y = BST, color = "Predicted Tier"), size = 3) +
      geom_point(data = pokemon_data[pokemon_data$Formats %in% input$selectedRankings, ], aes(x = as.numeric(as.factor(Formats)), y = BST, color = "Actual Tier"), size = 2, shape = 17) +
      labs(title = "Comparison of Actual and Predicted Tiers",
           x = "Actual Tier",
           y = "Predicted Tier",
           ) +
      coord_cartesian(xlim = c(0, 15), ylim = c(0, 1000)) +
      theme_minimal()
  })
  
  
  output$predictionOutput <- renderDT({
    # Display the prediction for National Dex
    national_dex_prediction <- predict(model, newdata = pokemon_data[pokemon_data$Formats == "National Dex", ], type = "class")
    glimpse(national_dex_prediction)
  })
}

shinyApp(ui = ui, server = server)
