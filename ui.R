library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Holiday to Malaysia"),
  sidebarPanel(
    radioButtons("dist", "Select a state to Explore:",
                 c("Kedah" = "Langkawi Island",
                   "Perak" = "Pangkor Island"
                   )) 
 
  ),
  mainPanel(
    h3('Time to Explore'), 
    h4('Journey into world oldest rainforests, leaving behinf only fleeting footprints and a mountain of memories'),
    p(textOutput('dynamicText')),
    imageOutput("image2")
  ) 
))






