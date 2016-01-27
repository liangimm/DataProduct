library(shiny)
shinyServer(function(input, output) {
  output$dynamicText <- renderText({
    if (input$dist =='Langkawi Island')
    sprintf('Off the coast of Kedah is a cluster of 99 islands offering the best of many worlds: beautiful beaches, world- class infrastructure, mangroves rich in flora and fauna, ultra- cheap duty-free shopping and fascinating legends.  %s', input$dist)
 else
   sprintf('Its charming mix of fishing settlements and resorts, is a fascinating and convenient holiday destination. It presents the visitor with a rare chance to live near fishermen and observe their lifestyle and also to simply enjoy the fine beaches and resort amenities. %s', input$dist)
 
  })
 
 # image2 sends pre-rendered images
 output$image2 <- renderImage({ 
   
   if (input$dist == "Langkawi Island") {
     return(list(
       src = "Langkawi.jpg",
       contentType = "image/JPG",
       alt = "Langkawi"
     ))
   }
   else
     return(list(
       src = "Pangkor-Island.jpg",
       contentType = "image/JPG",
       alt = "Pangkor"
     ))
   
 }, deleteFile = FALSE)
})



 
