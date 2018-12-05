# Load libraries

# Loading the dataframe

# Start Shiny Server
shinyServer(function(input, output) {
  
  # Icon to be used in the map
  
  # Filter the ufo sightings with provided input
  
  # Make graph
  
  # Create text
  
}) # End of shinyServer




server <- function( input , output ){
  # user_interest <- reactive({
  #   all_home_values <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_Zhvi_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
  #   # top_home_values <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_Zhvi_TopTier.csv" , header = TRUE , stringsAsFactors = FALSE)
  #   # bot_home_values <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_Zhvi_BottomTier.csv" , header = TRUE , stringsAsFactors = FALSE)
  # })
  
  all_home_values <- read.csv("~/Desktop/INFO_201/finalProject-Info201/zillow_data/State_Zhvi_AllHomes.csv" , header = TRUE , stringsAsFactors = FALSE)
  values <- select( all_home_values , 4:length(user_interest) )
  years <- colnames(values)
  means <- c()
  for( i in values){
    mn <- summarize( v , mean=mean(i , na.rm=TRUE) )
    means <- rbind( means , mn) 
  }
  
  df <- data.frame(years,means)  
  
  output$scatter <- renderPlot{(
    ggplot(df) + geom_point(df , mapping = aes(df$years,df$mean))
  )}
}









# # Load libraries

# # Loading the dataframe
# 
# # Start Shiny Server
# shinyServer(function(input, output) {
#   
#   # Icon to be used in the map
#   
#   # Filter the ufo sightings with provided input
#   
#   # Make graph
#   
#   # Create text
#   
# }) # End of shinyServer
