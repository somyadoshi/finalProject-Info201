# Load libraries
library("shiny")
library("dplyr")
library("ggplot2")
library("maps")
library("reshape")
library("mapproj")

# Load the dataframe
median_value <- read.csv("data/State_MedianValuePerSqft_AllHomes.csv", stringsAsFactors = FALSE)
sales_prices <- read.csv("data/Sale_Prices_State.csv")
zhvi <- read.csv("data/State_Zhvi_Summary_AllHomes.csv")
data <- read.csv("data/State_Zhvi_AllHomes.csv", stringsAsFactors = FALSE)
 
# Start Shiny Server
shinyServer(function(input, output) {
  
  # Make the table
  output$table <- renderTable(bordered = TRUE, spacing = "m", width = "200", {
    highest_value_by_year <- select(median_value, contains(input$year))
    highest_value_by_year <- mutate(highest_value_by_year, Highest_Home_Value_of_the_Year = apply(highest_value_by_year[1:50, ], 1, max)) 
    highest_value_by_year <- mutate(highest_value_by_year, State = median_value$RegionName)
    highest_value_by_year <- select(highest_value_by_year, State, Highest_Home_Value_of_the_Year)
    highest_value_by_year <- arrange(highest_value_by_year, -Highest_Home_Value_of_the_Year)  
  })
  
  # Make the bar graph
  output$plot <- renderPlot({
    if (input$data == "House Prices") {
      selected <-select(sales_prices, RegionName, X2018.08)
      price <- filter(selected, RegionName == input$state1 | RegionName == input$state2)
      c4 = c("coral", "chartreuse3")
      price = cbind(price, c4)
      ggplot(data = price, aes(x = RegionName, y = X2018.08))+ geom_bar(stat = "identity", fill = c4) + ggtitle("Median House Prices in Aug 2018 (Most Recent)") +
        xlab("States") + ylab("Prices") 
    } else  {
      selected <-select(zhvi, RegionName, Zhvi)
      price <- filter(selected, RegionName == input$state1 | RegionName == input$state2)
      c4 = c("coral", "chartreuse3")
      price = cbind(price, c4)
      ggplot(data = price, aes(x = RegionName, y = Zhvi))+ geom_bar(stat = "identity", fill = c4) + ggtitle("Zillow Home Value Index in Aug 2018 (Most Recent)") +
        xlab("States") + ylab("Value Index")
    }
  })
  
  # Make the map
  data$X2008 <- (data$X2008.01 + data$X2008.02 + data$X2008.03 + data$X2008.04 +
                   data$X2008.05 + data$X2008.06 + data$X2008.07 + data$X2008.08 +
                   data$X2008.09 + data$X2008.10 + data$X2008.11 + data$X2008.12) / 12
  
  data$X2009 <- (data$X2009.01 + data$X2009.02 + data$X2009.03 + data$X2009.04 + 
                   data$X2009.05 + data$X2009.06 + data$X2009.07 + data$X2009.08 + 
                   data$X2009.09 + data$X2009.10 + data$X2009.11 + data$X2009.12) / 12
  
  data$X2010 <- (data$X2010.01 + data$X2010.02 + data$X2010.03 + data$X2010.04 + 
                   data$X2010.05 + data$X2010.06 + data$X2010.07 + data$X2010.08 + 
                   data$X2010.09 + data$X2010.10 + data$X2010.11 + data$X2010.12) / 12
  
  data$X2011 <- (data$X2011.01 + data$X2011.02 + data$X2011.03 + data$X2011.04 + 
                   data$X2011.05 + data$X2011.06 + data$X2011.07 + data$X2011.08 + 
                   data$X2011.09 + data$X2011.10 + data$X2011.11 + data$X2011.12) / 12
  
  data$X2012 <- (data$X2012.01 + data$X2012.02 + data$X2012.03 + data$X2012.04 + 
                   data$X2012.05 + data$X2012.06 + data$X2012.07 + data$X2012.08 + 
                   data$X2012.09 + data$X2012.10 + data$X2012.11 + data$X2012.12) / 12
  
  data$X2013 <- (data$X2013.01 + data$X2013.02 + data$X2013.03 + data$X2013.04 + 
                   data$X2013.05 + data$X2013.06 + data$X2013.07 + data$X2013.08 + 
                   data$X2013.09 + data$X2013.10 + data$X2013.11 + data$X2013.12) / 12
  
  data$X2014 <- (data$X2014.01 + data$X2014.02 + data$X2014.03 + data$X2014.04 + 
                   data$X2014.05 + data$X2014.06 + data$X2014.07 + data$X2014.08 + 
                   data$X2014.09 + data$X2014.10 + data$X2014.11 + data$X2014.12) / 12
  
  data$X2015 <- (data$X2015.01 + data$X2015.02 + data$X2015.03 + data$X2015.04 + 
                   data$X2015.05 + data$X2015.06 + data$X2015.07 + data$X2015.08 + 
                   data$X2015.09 + data$X2015.10 + data$X2015.11 + data$X2015.12) / 12
  
  data$X2016 <- (data$X2016.01 + data$X2016.02 + data$X2016.03 + data$X2016.04 + 
                   data$X2016.05 + data$X2016.06 + data$X2016.07 + data$X2016.08 + 
                   data$X2016.09 + data$X2016.10 + data$X2016.11 + data$X2016.12) / 12
  
  data$X2017 <- (data$X2017.01 + data$X2017.02 + data$X2017.03 + data$X2017.04 + 
                   data$X2008.05 + data$X2008.06 + data$X2008.07 + data$X2008.08 + 
                   data$X2008.09 + data$X2008.10 + data$X2008.11 + data$X2008.12) / 12
  
  data$X2018 <- (data$X2018.01 + data$X2018.02 + data$X2018.03 + data$X2018.04 + 
                   data$X2018.05 + data$X2018.06 + data$X2018.07 + data$X2018.08 + 
                   data$X2018.09 + data$X2018.10) / 10
  
  filtered_data <- data %>% select(RegionName, X2008, X2009, X2010, X2011, X2012, X2013, X2014, X2015, X2016, X2017, X2018)
  
  comparison_map <- function(dataPoint, year) {
    states <- map_data("state")
    names(dataPoint) <- c("region", "year", "Index") 
    
    graph <- ggplot(states) + geom_map(data = states, map = states,
                                       aes(x = long, y = lat, map_id = region),
                                       fill = "#ffffff", color = "#ffffff", size = 0.15)
    graph <- graph + geom_map(data = dataPoint, map = states,
                              aes(fill = Index, map_id = region),
                              color = "#ffffff", size = 0.15) + ggtitle("Home Value Index for All Homes in the United States")
    graph <- graph + scale_fill_continuous(low = 'thistle2', high = 'darkred', 
                                           guide = 'colorbar')
    graph <- graph + coord_map("albers", lat0 = 39, lat1 = 45) 
    graph <- graph + theme(panel.border = element_blank())
    print(graph)
  }
  
  subset_df <- reactive({
    dataPoint <- select(filtered_data, RegionName, paste0("X", input$input_year))
    dataPoint <- dataPoint %>% mutate(RegionName = tolower(RegionName))
    dataPoint <- melt(dataPoint, id = "RegionName", value.name = "Index")
    return(dataPoint)
  })
  
  output$map <- renderPlot({
    comparison_map(subset_df(), input$input_year())
  })
  
  
  
  #Making the Trend Plots
  user_interest <- reactive({
    
    if( input$trend=="all"){
      user_interest <- read.csv("data/State_Zhvi_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="per_sq_ft" ) {
      user_interest <- read.csv("data/State_MedianValuePerSqft_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="top" ) {
      user_interest <- read.csv("data/State_Zhvi_TopTier.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="bot" ) {
      user_interest <- read.csv("data/State_Zhvi_BottomTier.csv" , header = TRUE , stringsAsFactors = FALSE)
    }  else if( input$trend=="increase" ) {
      user_interest <- read.csv("data/State_PctOfHomesIncreasingInValues_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="decrease" ) {
      user_interest <- read.csv("data/State_PctOfHomesDecreasingInValues_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
    }
    
    if( input$loc!="all" ){
      user_interest <- filter(user_interest , RegionName==input$loc)
    }
    
    user_interest <- select( user_interest , 4:length(user_interest) )
    
  })
  
  output$trend <- renderPlot({
    
    years <- colnames(user_interest())
    
    if(input$loc=="all"){
      means <- c()
      for( i in user_interest()){
        mn <- summarize( user_interest() , mean=mean(i , na.rm=TRUE) )
        means <- rbind( means , mn)
      }
    } else {
      means <- t(user_interest())
    }
    
    if(input$trend=="increase" | input$trend=="decrease"){
      y_lab = "Percent of Homes (%)"
      title = "Percent of Homes Changing Value Across Time"
      y_units <- NULL
    } else if(input$trend=="per_sq_ft"){
      y_lab = "Home Value per Square Foot ($)"
      title = "Home Values Across Time"
      y_units <- scale_y_continuous(labels = scales::dollar)
    } else {
      y_lab = "Home Values ($)"
      title = "Home Values Across Time"
      y_units <- scale_y_continuous(labels = scales::dollar)
    }
    
    df <- data.frame( years,means,stringsAsFactors = FALSE )
    return(  ggplot(data=df) + geom_point( mapping = aes( df$years,df$mean ) ) + labs( title=title,x="Year",y=y_lab) + 
               scale_x_discrete( breaks=c("X1996.07","X1997.07","X1998.07","X1999.07","X2000.07","X2001.07","X2002.07","X2003.07",
                                          "X2004.07","X2005.07","X2006.07","X2007.07","X2008.07","X2009.07","X2010.07","X2011.07",
                                          "X2012.07","X2013.07","X2014.07","X2015.07","X2016.07","X2017.07","X2018.07") , labels=(seq(1996,2018)) ) + y_units  )  
    
  })
  
}) # End of shinyServer
