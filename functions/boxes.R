
box_header <- function(..., title = NULL, footer = NULL, header = NULL, status = NULL, solidHeader = TRUE, 
                       background = NULL, width = 12, height = NULL, collapsible = FALSE, 
                       collapsed = FALSE){ 
    
    boxClass <- "box"
    
    if (solidHeader || !is.null(background)) {
        boxClass <- paste(boxClass, "box-solid")
    }
    
    if (!is.null(status)) {
        validateStatus(status)
        boxClass <- paste0(boxClass, " box-", status)
    }
    
    if (collapsible && collapsed) {
        boxClass <- paste(boxClass, "collapsed-box")
    }
    
    if (!is.null(background)) {
        validateColor(background)
        boxClass <- paste0(boxClass, " bg-", background)
    }
    
    style <- NULL
    
    if (!is.null(height)) {
        style <- paste0("height: ", validateCssUnit(height))
    }
    
    titleTag <- NULL
    
    if (!is.null(title)) {
        titleTag <- h3(class = "box-title", title)
    }
    
    collapseTag <- NULL
    
    if (collapsible) {
        buttonStatus <- status %OR% "default"
        collapseIcon <- if (collapsed) 
            "plus"
        else "minus"
        collapseTag <- div(class = "box-tools pull-right", tags$button(class = paste0("btn btn-box-tool"), 
                                                                       `data-widget` = "collapse", shiny::icon(collapseIcon)))
    }
    
    headerTag <- NULL
    
    if (!is.null(titleTag) || !is.null(collapseTag)) {
        headerTag <- div(class = "box-header", titleTag, collapseTag, header)
    }
    
    div(class = if (!is.null(width)) 
        paste0("col-sm-", width), 
        div(class = boxClass, 
            style = if (!is.null(style)) style, 
            headerTag, 
            div(class = "box-body", ...), 
            if (!is.null(footer)) div(class = "box-footer", footer)
        )
    )
}