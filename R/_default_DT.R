
# janick.weberpals@gmail.com

# wrapper for nice DT -----------------------------------------------------
default_DT <- function(data = NULL, caption = "Table.", col_names = FALSE, ...){
  
  # take more arguments
  arguments <- list(...)
  
  if(!is.null(col_names)){
    
    col_names <- col_names
    
  }else{
    
    col_names <- FALSE
    
  }
  
  tbl <- data %>% 
    
    DT::datatable(caption = caption,
                  rownames = FALSE,
                  filter = "top",
                  extensions = 'Buttons',
                  options = list(
                    dom = 'Bfrtip', 
                    buttons = list('copy', 'print', list(extend = 'collection', buttons = c('csv', 'excel', 'pdf'), text = 'Download')),
                    scrollX = T
                    ),
                  arguments
                  )
  
  return(tbl) # returns a DT object
  
}
