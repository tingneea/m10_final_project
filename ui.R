 # ui.R
library(shiny)

shinyUI(fluidPage(
  theme = "bootstrap.css",
  
  titlePanel(h1("Word Search")),
  
  hr(),
  
  fluidRow(
    
    column(6, offset=3,
           
           tabsetPanel(type = "tabs",
                       tabPanel("Classic",
                                textInput("phrase", label = "", value = ""),
                                tags$head(tags$style(type="text/css", "#phrase {width: 600px;}")),
                                
                                fluidRow(
                                  column(6,
                                         actionButton("goButton", "Next Word"),
                                         br(), br(),
                                         p("The predicted next word is...")
                                  ),
                                  column(6,
                                         p(textOutput("stats")),
                                         h2(textOutput("nextword"))
                                  )
                                )
                                
                       ),
                       tabPanel("Instant",
                                textInput("phrase2", label = "", value = ""),
                                tags$head(tags$style(type="text/css", "#phrase2 {width: 600px;}")),
                                
                                fluidRow(
                                  column(6,
                                         br(),br(),br(),
                                         "The predicted next word is..."
                                  ),
                                  column(6,
                                         p(textOutput("stats2")),
                                         h2(textOutput("nextword2"))
                                  )
                                )
                       )
           )
    )
  ),
  
  hr(),
  
  fluidRow(
    column(5, offset=1,
           
           wellPanel(
             h4("How to use this application?"),
             
             p("1. Enter a word or phase in the text box."),
             p("2. 'Classic' mode, click the 'Next Word' button.
                   'Instant' mode, a next word will be apprear automatically."),
             
             helpText(" ")
             )
           
             ),
    column(5,
           selectInput("lang",
                       label = "Which language should we use?",
                       choices = list("English (US)" = "en_us",
                                      "Librarian (Discworld)" = "ook",
                                      "Hodor (Westeros)" = "hodor"),
                       selected = "en_us"),
           checkboxInput("safemode",
                         label  = "Safe mode on (remove swear words, etc.)",
                         value = TRUE),
           br(),
           p("Reference ",
             a("Rpubs", href="http://rpubs.com/tingneea/capstone_final_project"),
             align="right")
          
    )
             )
           ))