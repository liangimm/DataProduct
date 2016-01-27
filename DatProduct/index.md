---
title       : Holiday to Malaysia by Shiny Application
subtitle    : Data Product Assignment
author      : Koid Liang Imm
job         : Programmer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<h2>Data Product Assignment</h2>

This peer assessed assignment has two parts. That are
create a Shiny application and deploy it on Rstudio's servers
and Use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about the shiny application.

A Shiny Project, containing at least two parts, that are ui.R andserver.R

The title i find, tourist malaysia. The visitor, he/she can choice the selection then the shiny application will server response to their selection and display the information.


To create the shiny application, you need to loading libraries below <br/>
<b>Loading Libraries</b> <br/>

install.packages("shiny") <br/>
library(shiny)

---

<h2>ui.R</h2>

<p><b>radioButtons</b>, it used to select an item from a list. </p>
<p> radioButtons("dist", "Select a state to Explore:",
                 c("Kedah" = "Langkawi Island",
                   "Perak" = "Pangkor Island"
                   ) </p>
                   
<b>dist</b>, it is radio button element id. It will link to server.R.
<h4>Display reactive output</h4> <br/>
<p><b>textOutput</b>, it used to display the text output, like textOutput('dynamicText') </p>
<p><b>imageOutput</b>, it used to display the image output, like imageOutput("image2")</p>


---

<h2>The ui.R example code </h2>


<p>The code below, visitor can be choice the selection, <b>radioButtons</b>, server will display the related information to the <b>textOutput</b> and <b>imageOutput</b>. <br/>

shinyUI(pageWithSidebar(<br/>
  headerPanel("Holiday to Malaysia"),
  sidebarPanel(
    radioButtons("dist", "Select a state to Explore:",
                 c("Kedah" = "Langkawi Island",
                   "Perak" = "Pangkor Island"
                   )) <br/>
  ),<br/>
  mainPanel(
    h3('Time to Explore'), 
    h4('Journey into world oldest rainforests, leaving behinf only fleeting footprints and a mountain of memories'),<br/>
    p(textOutput('dynamicText')),<br/>
    imageOutput("image2")<br/>
  ) 
))

---
<h2>The server.R example code </h2>


<p>The selection from <b>input$dist</b>, server will checking the conditional then display the output to <b>textOutput</b> <p> 

library(shiny)<br/>
shinyServer(function(input, output) {<br/>
  output$dynamicText <- renderText({<br/>
    if (input$dist =='Langkawi Island')<br/>
    sprintf('Off the coast of Kedah is a cluster of 99 islands offering the best of many worlds: beautiful beaches, world- class infrastructure, mangroves rich in flora and fauna, ultra- cheap duty-free shopping and fascinating legends.  %s', input$dist)<br/>
 else<br/>
   sprintf('Its charming mix of fishing settlements and resorts, is a fascinating and convenient holiday destination. It presents the visitor with a rare chance to live near fishermen and observe their lifestyle and also to simply enjoy the fine beaches and resort amenities. %s', input$dist)
  }) 
  
---

<h2>The server.R example code 2 </h2>

<p>The selection from <b>input$dist</b>, not only the text information. The image, <b>imageOutput("image2")</b> will more attraction.</p>

  <br/>
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

slidify("index.Rmd")
