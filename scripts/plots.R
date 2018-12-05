library("shiny")
library("dplyr")
library("ggplot2")
library("knitr")






ui <- fluidPage(

  titlePanel("Home Value Trends")
  ,
  sidebarLayout(
    sidebarPanel(
      p("Trend Analysis Options")
      ,
       radioButtons( "trend" , label = "Choose Trend to Examine:" ,
                    choices = list( "All Home Values"="all" , "Home Value per Sqr. Ft."="per_sq_ft" ,
                          "Top Tier Home Values"="top" , "Bottom Tier Home Values"="bot" ,
                          "Increasing Home Values"="increase" , "Decreasing Home Values"="decrease") )
      ,
      selectInput( "loc" , label = "Choose Location:" , choices = list( "All"="all" ,
                                                     "Alabama"="Alabama" , "Alaska"="Alaska" , "Arizona"="Arizona" , "Arkansas"="Arkansas" ,
                                                     "California"="California" , "Colorado"="Colorado" , "Connecticut"="Connecticut" ,
                                                     "Delaware"="Delaware" , "Florida"="Florida" , "Georgia"="Georgia" , "Hawaii"="Hawaii" ,
                                                     "Idaho"="Idaho" , "Illinois"="Illinois" , "Indiana"="Indiana" , "Iowa"="Iowa" ,
                                                     "Kansas"="Kansas" , "Kentucky"="Kentucky" , "Louisiana"="Louisiana" ,
                                                     "Maine"="Maine" , "Maryland"="Maryland" , "Massachusetts"="Massachusetts" , "Michigan"="Michigan" , "Minnesota"="Minnesota" , "Mississippi"="Mississippi" , "Missouri"="Missouri" , "Montana"="Montana" ,
                                                     "Nebraska"="Nebraska" , "Nevada"="Nevada" , "New Hampshire"="New Hampshire" , "New Jersey"="New Jersey" , "New Mexico"="New Mexico" , "New York"="New York" , "North Carolina"="North Carolina" , "North Dakota"="North Dakota" ,
                                                     "Ohio"="Ohio" , "Oklahoma"="Oklahoma" , "Oregon"="Oregon" ,
                                                     "Pennsylvania"="Pennsylvania" , "Rhode Island"="Rhode Island" ,
                                                     "South Carolina"="South Carolina" , "South Dakota"="South Dakota" ,
                                                     "Tennessee"="Tennessee" , "Texas"="Texas" ,
                                                     "Utah"="Utah" ,
                                                     "Vermont"="Vermont" , "Virginia"="Virginia" ,
                                                     "Washington"="Washington" , "West Virginia"="West Virginia" , "Wisconsin"="Wisconsin" , "Wyoming"="Wyoming") )
    )
    ,
    mainPanel(
      p("Plots for Trend Analysis")
      ,
      plotOutput("trend")
    )
  )

)





server <- function( input , output) {
  
  user_interest <- reactive({
    
    if( input$trend=="all"){
      user_interest <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_Zhvi_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="per_sq_ft" ) {
      user_interest <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_MedianValuePerSqft_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="top" ) {
      user_interest <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_Zhvi_TopTier.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="bot" ) {
      user_interest <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_Zhvi_BottomTier.csv" , header = TRUE , stringsAsFactors = FALSE)
    }  else if( input$trend=="increase" ) {
      user_interest <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_PctOfHomesIncreasingInValues_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
    } else if( input$trend=="decrease" ) {
      user_interest <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_PctOfHomesDecreasingInValues_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
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

}





shinyApp( ui=ui , server=server )


