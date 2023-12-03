# Read the Pokemon data
pokemon_data <- read.csv("src/resource/pokemon_data_smogon.csv")
pokemon_data$BST <- rowSums(pokemon_data[, c("HP", "Attack", "Defense", "Special.Attack", "Special.Defense", "Speed")])
# Filter data to exclude "National Dex"
training_data <- subset(pokemon_data, Formats != "National Dex")

# Train the decision tree model
set.seed(123)
model <- rpart(Formats ~ BST, data = training_data, method = "class")