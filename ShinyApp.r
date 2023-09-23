

setwd("~/Desktop/PokemonMetaAnalyzer")
pokemon_data = read.csv("pokemon_data_modified.csv")



library(shiny)

ui <- fluidPage(
)

server <- function(input, output) {
  pokemon_data$BST <- rowSums(pokemon_data[, c("HP", "Att", "Def", "S.Att", "S.Def", "Spd")])  

}


shinyApp(ui = ui, server = server)