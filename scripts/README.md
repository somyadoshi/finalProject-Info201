# Project Proposal

## Project Description

* The dataset we will be working on is the dataset that tells us the House Values for all states in the United States. This data is collected from the [Zillow Research Database](https://www.zillow.com/research/data/). The dataset includes the data from 1996 to 2018.
* Our target audience is people who are planning to buy a new house and investors. We'll only use the data from the last 10 years i.e. from 2007 to 2017/18 because it would be the most relevant choice for our audience.
* Questions we will be answering will be regarding changes and trends in housing prices from state to state.

## Technical Description
* The format of our final project would be an interactive Shiny app in which choose to view the data based on state and year. We will display the data through tables, bar graphs, and a United States map. 
* The data wrangling we would be using will be reshaping and reformatting. We are filtering out all the values before 2007. We will be using four CSV files. First has data about all homes, second one has data about all homes in the most current month, third has data about sales prices, and the last has data about median home value per squarefoot. 
* We will be using `leaflet` and `ploty` library to make a map. We would also be using `ggplot2` library to make a graph. 
* The question we will be answering using statistical analysis is the trends of the housing prices in the past 10 years.
* One of our major challenges would be effectively representing our data visually and getting the `shiny` infrastructure running.

## Final Project 
Please view our complete final project [here](https://liiiding.shinyapps.io/zillow_homes/).
