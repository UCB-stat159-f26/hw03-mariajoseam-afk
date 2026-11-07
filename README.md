# TennisCareerPlots

This is an R package to get the career matches of a tennis player from
[Tennis Abstract](https://www.tennisabstract.com) and plot them in a scatter
plot similar to the New York Times graphic of Serena Williams's matches. It is
part of HW1, HW2, and HW3 of the class STAT 259.


## Installation

```r
# install.packages("devtools")
devtools::install_github("UCB-stat159-f26/hw03-mariajoseam-afk")
```
## Usage

```r
library(TennisCareerPlots)

sabalenka <- get_career("Aryna Sabalenka")
plot_career(sabalenka)

nadal <- get_career("rafael nadal")
plot_career(nadal)
```

`get_career()` accepts names like "Aryna Sabalenka", "aryna sabalenka" or
"ArynaSabalenka". It gives a data base with the player's age, 
the opponent's age, the age difference and the result.

## File structure

```
.
├── DESCRIPTION            
├── NAMESPACE             
├── LICENSE                
├── LICENSE.md           
├── README.md
├── ai_documentation.txt   
├── instructions.md        
├── hw03-mariajoseam-afk.Rproj
├── R/
│   ├── player.R           
│   ├── download.R         
│   ├── process.R          
│   ├── ages.R             
│   ├── get_career.R       
│   └── plot.R             
├── man/
│   ├── get_career.Rd      
│   └── plot_career.Rd
└── tests/
    ├── testthat.R
    └── testthat/
        └── test-process.R 
```
