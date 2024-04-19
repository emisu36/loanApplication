#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library(readr)

data <- read_csv("/Users/emsu3617/Desktop/social-media-analysis/loan/analysis_data.csv")
data$action_taken <- as.character(data$action_taken)
data$action_taken <- trimws(data$action_taken)  
data$action_taken <- factor(data$action_taken) 
data$action_taken <- factor(data$action_taken, levels = c(1, 2, 3),
                            labels = c("Loan originated", "Application approved but not accepted", "Application denied"))


# Define the user interface
ui <- fluidPage(
  titlePanel("Interactive Loan Data Visualization"),
  sidebarLayout(
    sidebarPanel(
      # Dropdown for selecting loan approval status
      selectInput("approvalStatus", "Select Loan Approval Status:",
                  choices = c("All", "Loan originated", "Application approved but not accepted"),
                  selected = "All"),
      # Optional: Sliders for filtering by income or loan amount
      sliderInput("incomeRange", "Income Range:",
                  min = min(data$income, na.rm = TRUE), max = max(data$income, na.rm = TRUE),
                  value = c(min(data$income, na.rm = TRUE), max(data$income, na.rm = TRUE))),
      sliderInput("loanAmountRange", "Loan Amount Range:",
                  min = min(data$loan_amount, na.rm = TRUE), max = max(data$loan_amount, na.rm = TRUE),
                  value = c(min(data$loan_amount, na.rm = TRUE), max(data$loan_amount, na.rm = TRUE)))
    ),
    mainPanel(
      plotlyOutput("plot")  # Output plot
    )
  )
)

server <- function(input, output) {
  # Reactive expression for filtering data
  filtered_data <- reactive({
    req(data)  # Ensure data is loaded
    
    # Filter based on action_taken
    if (input$approvalStatus == "All") {
      temp_data <- data  # No filtering if 'All' is selected
    } else {
      temp_data <- data %>%
        filter(action_taken == input$approvalStatus)
    }
    
    # Further filter based on sliders
    temp_data <- temp_data %>%
      filter(income >= input$incomeRange[1], income <= input$incomeRange[2],
             loan_amount >= input$loanAmountRange[1], loan_amount <= input$loanAmountRange[2])
    
    temp_data
  })
  
  # Plot output
  output$plot <- renderPlotly({
    req(filtered_data())  # Make sure there's data to plot
    p <- ggplot(filtered_data(), aes(x = income, y = loan_amount, color = action_taken)) +
      geom_point(alpha = 0.5) +
      labs(title = "Loan Amount vs. Income", x = "Income", y = "Loan Amount") +
      scale_color_manual(values = c("green", "red", "blue"))
    
    ggplotly(p)
  })
}

# Run the application
shinyApp(ui = ui, server = server)

