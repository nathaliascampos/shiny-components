
library(shiny)
library(shinydashboard)
library(feathericons)
library(shinyBS)

# load functions
source('functions/others.R')

# load modules
source('modules/mod_card.R')
source('modules/mod_box.R')

ui <- dashboardPage(
    dashboardHeader(), 
    dashboardSidebar(
        
        use_feather_icons(), 
        
        includeCSS('www/custom.css'),
        
        sidebarMenu(
            menuItem("Widgets", tabName = 'card', icon = icon('box')),
            menuItem("Boxes", tabName = 'box', icon = icon('box'))
            
        )
    ), 
    dashboardBody(
        tabItems(
            tabItem(tabName = 'box', mod_box_ui('mod_box')),
            tabItem(tabName = 'card', mod_card_ui('mod_card'))
        )
    )
)
    
# Define server logic required to draw a histogram
server <- function(input, output) {
    
}

# Run the application 
shinyApp(ui = ui, server = server)
