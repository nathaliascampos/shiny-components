
btn_info <- function(id, title = NULL, text = NULL){
    
    ns <- NS(id)
    
    tagList(
        
        bsButton(
            inputId = ns(id),
            label   = "",
            icon    = icon("info"),
            style   = "primary",
            size    = "extra-small"
        ), 
        
        bsPopover(
            id = ns(id),
            title = title,
            content = text,
            placement = "left"
        )
        
    )
    
}
