#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rsconnect)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Riverdale Twitter Analysis"),
   navbarPage(title = "Content",
              tabPanel("Introduction",
                       p("In this project I analyzed tweets about the CW television show Riverdale. Riverdale is a television show on the CW network that airs on Wednesday nights from 8-9 pm. The target audience of the show is teenagers and young adults. Because of the target age range, many fans of the show are very vocal about their opinions on Twitter. I will compare the tweets using the hashtag #Riverdale that were posted during and shortly after the episode aired for two episodes."),
                       mainPanel(imageOutput("riverdalelogo"))
                       ),
              tabPanel("Sentiment Analysis",
                       sidebarLayout(
                         sidebarPanel(
                           radioButtons(inputId = "sp",
                                        label = "Episode",
                                        choices = c("Episode 8", "Episode 9"),
                                        selected = "Episode 8")
                         ),
                       mainPanel(imageOutput("sentimentplot"))
                       )
                       ),
              tabPanel("Word Clouds",
                       sidebarLayout(
                         sidebarPanel(
                           radioButtons(inputId = "wc",
                                        label = "Episode",
                                        choices = c("Episode 8", "Episode 9"),
                                        selected = "Episode 8")
                         ),
                         mainPanel(imageOutput("wordclouds"))
                       )
              ),
              tabPanel("Emoji Analysis",
                       sidebarLayout(
                         sidebarPanel(
                           radioButtons(inputId = "e",
                                        label = "Episode",
                                        choices = c("Episode 8", "Episode 9"),
                                        selected = "Episode 8")
                         ),
                         mainPanel(imageOutput("emojis"))
                       )
              )

   )
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$riverdalelogo <- renderImage({
      return(list(
        src = "riverdale.png",
        contentType = "image/png",
        alt = "riverdale"
      ))
    
  }, deleteFile = FALSE)
  
  output$sentimentplot <- renderImage({
    if (is.null(input$sp))
      return(NULL)
    
    if (input$sp == "Episode 8") {
      return(list(
        src = "ep8sentiment.png",
        contentType = "image/png",
        alt = "Ep 8"
      ))
    } else if (input$sp == "Episode 9") {
      return(list(
        src = "ep9sentiment.png",
        filetype = "image/png",
        alt = "Ep 9"
      ))
    }
    
  }, deleteFile = FALSE)
  
  output$wordclouds <- renderImage({
    if (is.null(input$wc))
      return(NULL)
    
    if (input$wc == "Episode 8") {
      return(list(
        src = "ep8 wordcloud.png",
        contentType = "image/png",
        alt = "Ep 8"
      ))
    } else if (input$wc == "Episode 9") {
      return(list(
        src = "ep9 wordcloud.png",
        filetype = "image/png",
        alt = "Ep 9"
      ))
    }
    
  }, deleteFile = FALSE)
  
  output$emojis <- renderImage({
    if (is.null(input$e))
      return(NULL)
    
    if (input$e == "Episode 8") {
      return(list(
        src = "ep8 emojis.png",
        contentType = "image/png",
        alt = "Ep 8"
      ))
    } else if (input$e == "Episode 9") {
      return(list(
        src = "ep9 emojis.png",
        filetype = "image/png",
        alt = "Ep 9"
      ))
    }
    
  }, deleteFile = FALSE)
}



# Run the application 
shinyApp(ui = ui, server = server)

