

shinyServer(function(input,output){
  
  #text_to_code <- reactive({input$bar_code_text})
  example_dataset <- reactive(if(input$bar_code_text==""){
    return(NULL)
  }else{
    example_labels <- uniqID_maker(user = FALSE, string = input$bar_code_text , level = 1:input$level)
    
  })
  
  observeEvent(input$changes,{
    if(is.null(example_dataset())){
      return(NULL)
    }else{
      cat("creating pdf \n")
      pdf_file_path <- paste0(getwd(),"/www/")
      cat("file_location: ",pdf_file_path)
      create_PDF(Labels = example_dataset(),name = paste0(pdf_file_path,"code"),type=input$type)
      #system2("open", paste0(pdf_file_path,"code.pdf"))
      # output$pdfview <- renderUI({
      #  # pdf('www/code.pdf')
      #   tags$iframe(style="height:600px; width:100%", src="code.pdf")
      # })
    }
  })
 
  
  output$code <- renderPlot(
    {
      if(input$bar_code_text==""){
        return(NULL)
      }else{
        
        qrcode_gen(example_dataset()$label[1])
      }
    }
  )

  output$pdf_download <- downloadHandler(
    filename = function() {
      "code.pdf"
    },
    content = function(file) {
      file.copy("www/code.pdf", file)
    }
  )
}
)