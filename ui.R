library('baRcodeR') 
library('qrcode')
library('shiny')


shinyUI(fluidPage(
  
  title = "Barcode Shiny App",
  titlePanel(title=div(img(src="logo.png",align='right'),"Barcode ShinyApp")),
  
  sidebarPanel(
    conditionalPanel(condition = "input.tabselected==1",
                     textInput("bar_code_text","Enter Text")
                     ),
    conditionalPanel(condition = "input.tabselected==2",
                     textInput("bar_code_text","Enter Text")
                     ),
    conditionalPanel(condition = "input.tabselected==3",
                     textInput("bar_code_text","Enter Text"),
                     numericInput('level',label = "Enter level",min=1, max=50,value = 1),
                     selectInput("type",label="Select Type",choices = c("Barcode"="linear","QR Code" = "matrix"),selected = "linear",),
                     actionButton("changes", "Apply Changes", icon("refresh"))
                     ),
  ),
  mainPanel(
    
    tabsetPanel(type="tabs",
            tabPanel("Overview",value=1,
                     h3(p("How to use this App")),
                     hr(),
                     p("Input: Enter Text/URL to the input text bar in sidebar panel"),
                     hr(),
                     p("Output: Tab-2 will generate QR code and Tab-3 will give you option to download as pdf")),
            tabPanel("Generated QR Code",value = 2,
                   h4("Generate QR Code"),
                  plotOutput("code")),
            tabPanel("Downloads", value=3,
                     uiOutput("pdfview"),
                     p('Download PDF'),
                     downloadButton("pdf_download",label = "Download PDF")
                  ),id="tabselected"
    
    )
  )
))