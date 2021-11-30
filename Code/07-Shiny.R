# Shiny

# Shiny cheat sheet:
# https://shiny.rstudio.com/images/shiny-cheatsheet.pdf

# Gallery of shiny apps:
# https://shiny.rstudio.com/gallery/

# Tutorial info:
# https://shiny.rstudio.com/tutorial/

# Upload your app to:
# http://www.shinyapps.io/


# Template -------------------------------------------------------------------------

library(shiny)

ui <- fluidPage(
  
)

server <- function(input, output){
  
}

shinyApp(ui = ui, server = server)





# Example 1 ------------------------------------------------------------------------

ui <- fluidPage("Hello world",
                sliderInput(inputId = "num",
                            label = "Choose a number",
                            value = 25, min = 1, max = 100),
                plotOutput("hist")
)

server <- function(input, output){
  output$hist = renderPlot({
    title = "Hist title"
    hist(rnorm(input$num), main = title)
  })
}

shinyApp(ui = ui, server = server)



# Example 2 ------------------------------------------------------------------------

library(ISLR)
data(Auto)

ui <- fluidPage(
  
  headerPanel("Visualization of Auto data from ISLR package"),
  
  sidebarPanel(
    selectInput("xvar", label = "Select X variable:", names(Auto)[1:7],
                selected = names(Auto)[1]),
    selectInput("yvar", label = "Select Y variable:", names(Auto)[1:7],
                selected = names(Auto)[2])
  ),
  
  mainPanel(
    plotOutput("scatter"),
    
    "The correlations for the selected variables:",
    
    verbatimTextOutput("cor")
  )
)

server <- function(input, output){
  
  selectedData <- reactive({
    Auto[, c(input$xvar, input$yvar)]
  })
  
  output$scatter <- renderPlot({
    plot(selectedData())
  })
  
  output$cor <- renderPrint({
    cor(selectedData())
  })
}

shinyApp(ui = ui, server = server)



# Example 3 ------------------------------------------------------------------------

library(maps)
library(ggplot2)


# Code that generated statedata:
#
#data(state)
#statedf <- data.frame(state.x77, state.region)
#rownames(statedf) <- tolower(rownames(statedf))
#statedf$region <- rownames(statedf)
#
#usa <- map_data("state")
#
#library(dplyr)
#
#newdf <- inner_join(usa, statedf, by = "region")
#newdf <- subset(newdf, select = -c(subregion, state.region))
#
#statedata <- newdf



# Code for removing map axis lines and labels taken from:
# http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html

ditch_the_axes <- theme(
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank()
)

# App

load("Data/statedata.RData")

ui <- fluidPage(
  headerPanel("Visualization of US State Facts and Figures R Data"),
  
  mainPanel(
    selectInput("var", label = "Select variable:", names(statedata)[6:13])
  ),
  
  plotOutput("map")
)

server <- function(input, output){
  
  selectedVar <-  reactive({
    statedata[,input$var]
  })
  
  selectedVarIndex <-  reactive({
    c(which(names(statedata) == input$var))
  })
  
  output$map <- renderPlot({
    ggplot(data = statedata) + geom_polygon(aes(x = long, y = lat, group = group, fill = selectedVar()), color = "white") + 
      coord_fixed(1.3) + scale_fill_continuous(name = names(statedata)[selectedVarIndex()]) + ditch_the_axes
  })
}

shinyApp(ui = ui, server = server)
