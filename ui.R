# Load libraries

shinyUI(
  navbarPage(
   # theme = shinytheme("darkly"),
    "Name",

    # panel
    tabPanel(
      h4("Tab name"),
      titlePanel("Title"),
      sidebarLayout(
        sidebarPanel(
          checkboxInput("values" , "Choose Values:", "All Home Values")
        ), # End of sideparPanel
        mainPanel(
          plotOutput("scatter")
        ) # End of mainPanel
      ) # End of sidebarLayout
    ) # End of tabPanel
  ) # End of navbarPage
) # End of shiny







# ui <- fluidPage(
#   
#   titlePanel("Plot n ish")
#   ,
#   sidebarLayout(
#     sidebarPanel(
#       p("pick yo ish")
#       ,
#       checkboxInput("values" , "Choose Values:" , "All" , "All Home Values" , "Top Tier Home Values" , "Bottm Tier Home Values" )
#       
#     )
#   )
# )








# # Load libraries
# 
# shinyUI(
#   navbarPage(
#     theme = shinytheme("darkly"),
#     "Name",
#     
#     # panel
#     tabPanel(
#       h4("Tab name"),
#       titlePanel("Title"),
#       sidebarLayout(
#         sidebarPanel(
#           
#         ), # End of sideparPanel
#         mainPanel(
#           
#         ) # End of mainPanel
#       ) # End of sidebarLayout
#     ) # End of tabPanel
#   ) # End of navbarPage
# ) # End of shiny