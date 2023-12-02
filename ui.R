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