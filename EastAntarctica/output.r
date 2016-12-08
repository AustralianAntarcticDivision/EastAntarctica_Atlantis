library(shiny)
biomass = read.table("output/outputBoxBiomass.txt", header = TRUE)
biomass = aggregate(biomass[,-(1:2)], by = list(Time = biomass$Time), FUN = sum)
codes = colnames(biomass)[-1]
L = length(codes)

shinyApp(
  ui = fluidPage(
    titlePanel("Atlantis output - biomass"),
    sidebarLayout(
      sidebarPanel(
        selectInput("codes", "Codes", codes, selected = codes, multiple = TRUE, size = 10, selectize = FALSE),
        checkboxInput("log", "Log scale", TRUE)
      ),
      mainPanel(plotOutput("biomass"))
    )
  ),
  server = function(input, output, session) {
    output$biomass = renderPlot({
      bss = biomass[,input$codes,drop=FALSE]
      if (!all(bss == 0))
      {
        R = range(bss)
        if (diff(R)==0) R = min(R) + c(0,1)
        if (input$log) R[R==0] = min(bss[bss>0])
        matplot(biomass$Time/365, bss, pch=19, log=ifelse(input$log, 'y', ''), col = 1:ncol(bss), xlab = 'Years', ylab = 'Biomass', ylim = R)
      }
      else
      {
        plot(c(0,max(biomass$Time)/365), c(0,1), type='n', xlab = 'Years', ylab = 'Biomass')
        text(0.5*max(biomass$Time)/365, 0.5, 'Zero biomass at all times')
      }
      
      legend("right", input$codes, pch=19, col = 1:ncol(bss))
    })
  }
)