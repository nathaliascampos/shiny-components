
source('functions/boxes.R')

mod_box_ui <- function(id){
    
    tagList(
        
        box_header(
            title = 'Título', 
            header = tagList(
                btn_info('q', 'title', 'text')
            )
            
        )
        
    )
    
}
