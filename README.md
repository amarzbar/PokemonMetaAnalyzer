# PokemonMetaAnalyzer
RShiny Application that performs Statisitical Analysis on the Base Stat Total (BST) of all pokemon to determine their meta relavance 

## smabdurrazak branch
Showcasing best Shiny practices as well as frontend implementation

### Feature List (Complete) :checkered_flag:

- Restructure codebase
     - separate `ui.R`, `server.R` for readability
     - create `global.R` to handle dependencies and file sourcing
     - create `data.R` file to read and prepare all data resources
     - create `resources` folder to hold all data files and external scripts
     - create `/www` folder to contain `stylesheet.css` and `script.js`
     - create `mod` folder to contain all app modules 
     - create `docs` folder to contain all dev-related documentation

### Feature List (Working) :spiral_notepad:

- create landing /w navigation
- create `shiny.router`
- implement new app to highlight sections of [Mastering Shiny](https://mastering-shiny.org/)
     - code modularization
     - dynamic UI
     - add to this list as ideas generate
- implement features from [Outstanding UI](https://unleash-shiny.rinterface.com/)
     - namely js on frontend
     - emphasized further in [Javascript for R](https://book.javascript-for-r.com/)
     - potentially implement OOP
     - potentially implement React
     - add to this list as ideas generate

### Codebase

```
├── global.R
├── ui.R
├── server.R
├── www
│   ├── stylesheet.css
│   └── script.js
├── src
│   ├── data.R
│   ├── resource
│   │   ├── parsescript2
│   │   ├── PKparser
│   │   ├── pokemon_abilities.csv
│   │   ├── pokemon_data.csv
│   │   ├── pokemon_data_smogon.csv
│   │   ├── scrape-pokemon-web
│   │   ├── smogonparse_extra
│   │   └── smogontiering
│   └── mod
├── docs
├── README.md
└── .gitignore
```
