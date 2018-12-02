# Load libraries

shinyUI(
  navbarPage(
    theme = shinytheme("darkly"),
    "Name",
    
    # map panel
    tabPanel(
      h4("Tab name"),
      titlePanel("Title"),
      sidebarLayout(
        sidebarPanel(
          
        ), # End of sideparPanel
        mainPanel(
          
        ) # End of mainPanel
      ) # End of sidebarLayout
    ) # End of tabPanel
  ) # End of navbarPage
) # End of shiny