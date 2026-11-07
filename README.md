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

## Personal reflection

I had never really understood or maybe even thought? how a package actually
worked. Honestly I just used them and did not think of the mechanics. So doing
this homework actually was very enlightening of not only learning how to
build a package but also how they actually works.

I also found myself challenged to know what part of my code to pick for each 
function, if I was leaving something out but to make sure in the end it was
going to have the same results as my other assignments.

Finally, since starting this homework I have been thinking on how to actually
apply this to my work and not only to this assignment. I have also worked with
languages, coding, but till this class I never went this far and specifically
for this homework had never created a package.