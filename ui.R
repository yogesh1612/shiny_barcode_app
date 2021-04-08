library('baRcodeR') 
library('qrcode')
library('shiny')


shinyUI(fluidPage(
  
  title = "Barcode Shiny App",
  titlePanel(title=div(img(src="logo.png",align='right'),"Barcode ShinyApp")),
  
  sidebarPanel(
    textInput("bar_code_text","Enter Text"),
    numericInput('level',label = "Enter level",min=1, max=50,value = 1),
    selectInput("type",label="Select Type",choices = c("Barcode"="linear","QR Code" = "matrix"),selected = "linear",),
    actionButton("changes", "Apply Changes", icon("refresh")),
    
  ),
  mainPanel(
    
    tabsetPanel(type="tabs",
            tabPanel("Overview",
                     h3(p("How to use this App")),
                     hr(),
                     p("Input: Enter Text/URL in input text bar & then select no of QR/Barcod required"),
                     hr(),
                     p("Output: After submitting all the inputs, User can download generated codes from download tab")),
            #tabPanel("Generated Code",
             #        h4("Generated QR Code"),
              #       plotOutput("code")),
            tabPanel("Downloads", 
                     uiOutput("pdfview"),
                     p('Download PDF'),
                     downloadButton("pdf_download",label = "Download PDF")
                  )
    
    )
  )
))