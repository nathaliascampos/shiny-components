
source('functions/cards.R')

mod_card_ui <- function(id){
    ns <- NS(id)
    
    tagList(
        # h4('Widgets', class = 'page-title'), 
        
        # Info card 
        infoCard(
            title = 'Title', 
            value = "250.000", 
            subtitle = 'Since last month', 
            subvalue = 5.40, 
            icon = 'dollar'
        ),
        infoCard(
            title = 'Title', 
            value = "250.000", 
            subtitle = 'Since last month', 
            subvalue = 5.40, 
            icon = 'user'
        ),
        infoCard(
            title = 'Title', 
            value = "250.000", 
            subtitle = 'Since last month', 
            subvalue = 5.40, 
            icon = 'user', 
            icon_style = 'square'
        ),
        infoCard(
            title = 'Title', 
            value = "250.000", 
            subtitle = 'Since last month', 
            subvalue = -5.40, 
            icon = 'user', 
            icon_style = 'square'
        ), 
        
        # Info card 2 
        infoCard2(title = 'Total Hours', value = '8.4', icon = 'briefcase'), 
        infoCard2(title = 'Total Hours', value = '8.4', icon = 'briefcase'), 
        infoCard2(title = 'Total Hours', value = '8.4', badge = 3.5, icon = 'dollar-sign'),
        infoCard2(title = 'Total Hours', value = '8.4', badge = -3.5, icon = 'dollar-sign'), 
        
        box(width = 12, solidHeader = TRUE, 
            infoCard2(title = 'Total Hours', value = '8.4', icon = 'briefcase', color = 'grey')
        ), 
        
        # Simple card
        box(width = 12, solidHeader = TRUE, 
            simpleCard(), simpleCard(), simpleCard()
        ), 
        
        # Simple card 2
        box(width = 12, solidHeader = TRUE, 
            simpleCardIcon(text = 'Total', number = 50, icon = 'list'), 
            simpleCardIcon(text = 'Total', number = 29, icon = 'users'), 
            simpleCardIcon(text = 'Total', number = 17, icon = 'package'), 
            simpleCardIcon(text = 'Total', number = 35, icon = 'wifi', rightBorder = F)
        )
        
        
    )
    
}

mod_card <- function(input, output, session){
    
}

