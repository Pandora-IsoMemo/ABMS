library(shiny)
library(ABM)

tagList(
  navbarPage(
    title = paste("ABMS", packageVersion("ABMS")),
    theme = shinythemes::shinytheme("flatly"),
    position = "fixed-top",
    collapsible = TRUE,
    id = "tab",
    tabPanel(
      title = "Tab",
      sidebarLayout(
        sidebarPanel(
          width = 2,
          actionButton("example", "Create Example")
        ),
        mainPanel(
          tableOutput("example_table")
        ),
      )
    )
  ),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  )
)
