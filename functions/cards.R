
infoCard <- function(title, value = NULL, subvalue = NULL, subtitle = NULL, width = 3, 
                     icon = "bar-chart", icon_style = c('circle', 'square'), color = 'dark-blue'){
    
    if(icon_style[1] == 'circle'){
        icon <- div(
            class = 'float-right',
            span(shiny::icon(icon), class = "card-icon rounded-circle bg-primary-dark")
        )
    } else{ 
        icon <- div(class = 'float-right', span(shiny::icon(icon), class = "info-card-icon"))
    }
    
    box(width = width, solidHeader = TRUE,
        
        tags$style("
            
            .text-muted {
                color: #98a6ad!important;
            }
            
            .card-title {
                color: #3e4676; 
                font-weight: 550; 
            }
            
            .rounded-circle {
                width: 40px;
                height: 40px;
                border-radius: 50%!important;
            }
            
            .card-icon {
                display: flex; 
                align-items: center;
                justify-content: center;
            }
            
            .bg-primary-dark {
                background-color: #2469ce!important;
                color: #fff;
            }
            
            .info-card-icon { 
                border-top-left-radius: 2px;
                border-top-right-radius: 0;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 2px;
                display: block; 
                height: 40px;
                width: 40px;
                text-align: center;
                font-size: 20px;
                line-height: 40px; 
                color: #fff; 
                background-color: rgba(55, 119, 188, .7);
            }

        "), 
        
        div(class = 'card', 
            icon, 
            # Title
            div(class = 'mt-0', 
                h5(title, class = 'card-title') 
            ),
            # Value
            h2(value), 
            # Second value
            div(class = "mb-0", 
                span(
                    paste0(subvalue, '%'), 
                    style = "margin-right: 5px;",
                    class = ifelse(subvalue >= 0, "text-success", "text-danger")
                ), 
                span(subtitle, class = "text-muted")
            )
            
        )
    )
    
    # HTML('
    #     <div class="card">
    #         <div class="card-body">
    #             <div class="row">
    #             	<div class="col mt-0">
    #             		<h5 class="card-title">Visitors</h5>
    #             	</div> 
    #             	<div class="col-auto">
    #             		<div class="avatar">
    #             			<div class="avatar-title rounded-circle bg-primary-dark">
    #             				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users align-middle"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
    #             			</div>
    #             		</div>
    #             	</div>
    #             </div>
    #             <h1 class="display-5 mt-2 mb-4">2.562</h1>
    #             <div class="mb-0">
    #             	<span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i> -2.65% </span> Less visitors than usual
    #             </div>
    #         </div>
    #     </div>
    # ')
    
    # HTML('
    #     <div class="card widget-flat">
    #         <div class="card-body">
    #             <div class="float-right">
    #                 <i class="mdi mdi-account-multiple widget-icon"></i>
    #             </div>
    #             <h5 class="text-muted font-weight-normal mt-0" title="Number of Customers">Customers</h5>
    #             <h3 class="mt-3 mb-3">36,254</h3>
    #             <p class="mb-0 text-muted">
    #                 <span class="text-success mr-2"><i class="mdi mdi-arrow-up-bold"></i> 5.27%</span>
    #                 <span class="text-nowrap">Since last month</span>  
    #             </p>
    #         </div> <!-- end card-body-->
    #     </div>
    # ')
    
}

infoCard2 <- function(title = NULL, value = NULL, width = 3, badge = NULL, icon = NULL, color = 'white'){
    
    colorClass <- paste0("content-bg-", color) 
    
    style <- tags$style('
            
        .card-body{
            padding: 1rem;
            display: flex;
        }
        
        .col {
            flex-basis: 0;
            flex-grow: 1;
            max-width: 100%;
        }
        
        .col-auto {
            flex: 0 0 auto;
            width: auto;
            max-width: 100%;
        }
        
        .value-info {
            font-family: "Cerebri Sans", sans-serif;
            font-size: 2rem;
        }
        
        h6.text-uppercase {
            letter-spacing: .08em;
        }
        
        .title-box{
            margin-top: 0px;
        }
        
    ')
    
    tagList(
        style, 
        div(
            box(width = width, solidHeader = TRUE, 
                class = colorClass,  
                div(class = "card-body align-items-center", 
                    div(class = 'col',
                        # Title
                        h6(title, class = "text-uppercase text-muted title-box mb-2"),
                        # Heading
                        span(value, class = 'h2 value-info'), 
                        # Bagde
                        if(!is.null(badge)) span(
                            ifelse(badge >= 0, paste0('+',badge), badge), 
                            class = ifelse(badge >= 0, 
                                           "badge badge-soft-success mt-n1", 
                                           "badge badge-soft-danger mt-n1"))
                    ),
                    div(class = 'col-auto', 
                        # Icon
                        span(feather_icons(icon), class = "h2 text-muted")
                        
                    )
                )
            )
        )
        
    )
    
    
    # HTML('
    #     <div class="card-body">
    #         <div class="row align-items-center">
    #             <div class="col">
    #                 <!-- Title -->
    #                 <h6 class="text-uppercase text-muted mb-2">Total Hours</h6>
    #                 <!-- Heading -->
    #                 <span class="h2 mb-0">763.5</span>
    #             </div>
    #             <div class="col-auto">
    #                 <!-- Icon -->
    #                 <span class="h2 fe fe-briefcase text-muted mb-0"></span>
    #             </div>
    #         </div> <!-- / .row -->
    #     </div>
    # ')
    
}

simpleCard <- function(width = 4){
    
    tagList(
        
        div(
            column(
                width = width, class = "content-bg-grey", 
                div(class = "text-center", 
                    p("Current Month", class = "text-muted mb-0 mt-3"), 
                    h2(span('$42,025'), class = "font-weight-normal mt-2 mb-3")
                )
            )
        )
        
    )
    
    # HTML('
    #     <div class="contect-bg">
    #         <p class="text-muted mb-0 mt-3">Current Month</p>
    #         <h2 class="font-weight-normal mb-3">
    #             <span>$42,025</span>
    #         </h2>
    #     </div>
    #     
    # ')
}

simpleCardIcon <- function(text = NULL, number = NULL, icon = NULL, width = 3, rightBorder = TRUE){
    
    cl <- "simple-card-icon text-center"
    if (isTRUE(rightBorder)) cl <- paste0(cl, " border-right")
    
    tagList(
        
        column(
            width = 3, 
            div(class = cl, 
                span(feather_icons(icon), class = "h2 text-muted"), 
                h3(span(number)), 
                p(text, class = "text-muted mb-0")
            )
        )
        
    )
    
    # HTML('
    #     <div class="card-body text-center">
    #         <i class="dripicons-briefcase text-muted" style="font-size: 24px;"></i>
    #         <h3><span>29</span></h3>
    #         <p class="text-muted font-15 mb-0">Total Projects</p>
    #     </div>
    # ')
}