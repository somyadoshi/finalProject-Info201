# Project Proposal

## Project Description

* The dataset we will be working on is the dataset that tells us the House Values for all cities in United State. This data is collected from the [Zillow Research Database](https://www.zillow.com/research/data/). The dataset includes the data from 1996 to 2018.
* Our target audience is people who are planning to buy a new house and investors. We'll only use the data from the last 10 years i.e. from 2008 to 2018 because it would be the most relevant choice for our audience.
* Questions we will be answering will be:
  - Changes and trends in housing prices from state to state.
  - Locations of the biggest increases and decreases in a particular state.
  - Highest and lowest median home value per square foot.

## Technical Description
* The format of our final project would be Shiny app to make an interactive map that users can change the time period from 2008 to 2018. The user could also input a state which will return the locations of the biggest increases and decreases in that particular state and a plot which shows the graph of mean increase/decrease the state from 2008 to 2018. 
* The data wrangling we would be using will be reshaping and reformatting. We are filtering all the values after 2008. We will be using three CSV files. First has a data about bottom tier homes, second one has the data about top tier homes and the last one has data about median home value per square feet. 
* We will be using `leaflet` and `ploty` library to make a map. We would also be using `ggplot2` library to make a graph. 
* The question we will be answering using statistical analysis is the trends of the housing prices in the past 10 years.
* One of our major challenges would be effectively representing our data visually and getting the `shiny` infrastructure running.
