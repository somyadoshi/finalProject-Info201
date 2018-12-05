# Load libraries
library("shiny")
library("shinythemes")

zillow_url <- a("this Zillow page", href = "https://www.zillow.com/research/data/")

shinyUI(
  navbarPage(
   theme = shinytheme("united"),
    "Zillow Homes Data",
   
    # Overview Panel
    tabPanel(
      h4("Overview"),
        mainPanel(
        h2("Overview"),
         p("The purpose behind creating this interactive Shiny platform is to allow potential home-buyers to explore various 
           data regarding homes in the United States according to the states they are interested in. Our app provides insight on the highest median 
           value per squarefoot for all homes in every state by year, the comparison of house prices and the home value index 
           between two states, and the home value index trends across all states by year. As the home values and prices are rapidly increasing in the 
           Seattle area, we were inspired to examine data regarding homes all across the country and look for trends."),
         h2("Data"),
         p("The various datsets used in this app were all retrieved from", zillow_url, ". These data sets from Zillow Research contain data from 1996 to 2018; however, 
           for the sake of relevance, we have only included data ranging from 2007 to 2018. There are two categories that these datasets belong to: Home Values 
           and Home Listings and Sales. According to Zillow's website, the Zillow Home Value Index (ZHVI) is 'a smoothed, seasonally adjusted measure of the median estimated 
          home value across a given region and housing type. It is a dollar-denominated alternative to repeat-sales indices.' The Median Home Values per Sqft for All Homes by State,
          the Home Value Index of the Current Month, and the Home Value Index of All Homes dataset belong to the Home Value Index category and contain data for every state. 
           The Sales Prices dataset came from the Home Listings and Sales category and includes the most recent month's data for each state."),
        h2("Audience and Questions"),
        p("Our targeted users include anyone who is looking to purchase a home in the near future or investors. Our app includes data that is relevant to those who want to compare the sales
           prices or home value index of two states. This can be integral in helping users decide where to purchase a new home. For example, users may ask 'How did sale prices between California 
          and Washington differ in August 2018?' Our app also includes data of the highest median value per squarefoot per state. This allows the users to see the highest home value of the year in every state.
          For example, users may want to gage the difference in home values among states and view changes over the years to see where investments can pay off. Additionally, our app displays a map to give the users an idea of the average home value index
          per state over the years. This can answer any questions users may have regarding specific regions of the United States, as it is easy to compare all states at once.
           For future analysis of similar data, we can expand our app to benefit those who are not only interested in comparing among states, but also among more specific categories, such as counties or cities.")
        ) # End of mainPanel
    ), # End of Overview tabPanel
   
    # About Us Panel
    tabPanel(
      h4("About Us"),
      titlePanel("About Us"),
        mainPanel(
          p("This project was created for a University of Washington Seattle course titled Informatics 201: Technical Foundations during Fall Quarter of 2018."),
          br(),
          p("Please check out the group members below:"),
          br(),
          a("Li Ding", href = "https://www.linkedin.com/in/liding54"),
          br(),
          p("Junior studying Industrial and Systems Engineering and minoring in Informatics"), 
          br(),
          p("Somya Doshi"),
          p("Sophomore hoping to study Computer Science and Engineering"),
          br(),
          p("Ashray Silwal"),
          p("Sophomore hoping to study Human Centered Design and Engineering or Informatics"),
          br(),
          p("Dav Studentio"),
          p("Senior studying Psychology and Physics")
        ) # End of mainPanel
    ), # End of About Us tabPanel
   
    # Table Panel
    tabPanel(
      h4("Highest Median Value per State"),
      titlePanel("Highest Median Value Per SqFt for All Homes in Each State by Year"),
      sidebarLayout(
        sidebarPanel(
          selectInput("year", "Select a Year to Sort Highest Home Value Per State:", c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"))
        ), # End of sideparPanel
        mainPanel(
          p("This table displays the highest median home value per squarefoot for all homes in each state by year. By selecting a specific year between 2007 and 2017,
            the table will show each states' highest home value of that year. Since 2018 is not yet complete, there is no data for the later months of the year, so we decided
            it would make more sense statistically to omit all of 2018's data because it may not accurately represent the highest home value of this year."),
          br(),
          tableOutput("table")
        ) # End of mainPanel
      ) # End of sidebarLayout
    ), # End of Table tabPanel
   
    # Bar Graph Panel
    tabPanel(
      h4("Comparison of House Prices/Home Value Index of Two States"),
      titlePanel("Comparison of Median House Prices and Zillow Home Value Index Scores of Two States"),
      sidebarLayout(
        sidebarPanel( 
          radioButtons("data", "View:",
                       c("House Prices", "Zillow Home Value Index")
          ),
          selectInput("state1","Select a State:",
                      list("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", 
                           "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", 
                           "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", 
                           "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina",
                           "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", 
                           "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming")
          ),
          selectInput("state2","Select a State:",
                      list("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware",
                           "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", 
                           "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", 
                           "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina",
                           "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
                           "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming")
          )
        ), # End of sideparPanel
        mainPanel(
          p("The bar graphs below allow for comparisons of two states in the median house prices or the home value index. By selecting a specific dataset to analyze, such as
            house prices or home value index, and then selecting two states, the bar graphs will show the comparison of those values between those two states. This contains
            data from August 2018, as that is the last month in which Zillow has the complete data and will be most relevant to buyers."),
          br(),
          plotOutput("plot")
        ) # End of mainPanel
      ) # End of sidebarLayout
    ), # End of Bar Graph tabPanel
   
   # Map Panel
   tabPanel(
     h4("Home Value Index Trends Across States"),
     titlePanel("Home Value Index for All Homes in the United States"),
     sidebarLayout(
       sidebarPanel(
         selectInput("input_year", "Select a Year to View Trends Across the U.S.:",
                     choices = as.list(c("2008":"2018")))
       ), # End of sideparPanel
       mainPanel(
         p("This map allows for an easy and quick visualization of the trends across the United States over the last 10 years. By selecting a year between 2008 and 2018, 
            the map will show the average home value index for every state by color. The darker the state, the higher the average home value index. Not only does this map 
            allow for easy visualization of trends across states, it also allows for easy visualization of trends over the years."),
         br(),
         plotOutput("map", width = "100%", height = "450px")
       ) # End of mainPanel
     ) # End of sidebarLayout
   ) # End of tabPanel
  ) # End of navbarPage
) # End of shiny
