# Chargement des bibliothèques nécessaires
library(shiny)
library(ggplot2)

# Définition de l'interface utilisateur
ui <- fluidPage(
  titlePanel("Template de Shiny App"),
  sidebarLayout(
    sidebarPanel(
      textInput("text", "Entrez du texte:", "Hello, Shiny!"),
      actionButton("plot", "Générer un graphique")
    ),
    mainPanel(
      textOutput("textOutput"),
      plotOutput("plotOutput")
    )
  )
)

# Définition de la logique serveur
server <- function(input, output) {
  output$textOutput <- renderText({
    input$text
  })
  
  observeEvent(input$plot, {
    output$plotOutput <- renderPlot({
      data <- data.frame(
        x = rnorm(100),
        y = rnorm(100)
      )
      ggplot(data, aes(x, y)) +
        geom_point() +
        theme_minimal() +
        ggtitle(input$text)
    })
  })
}

# Exécution de l'application Shiny
shinyApp(ui = ui, server = server)
