# flextable defaults

presentations_tbl <- function(data = NULL){
  
  data_out <- data %>% 
    dplyr::arrange(year, month, publication) %>% 
    dplyr::select(year, publication) %>% 
    dplyr::mutate(dplyr::across(tidyselect::everything(), ~as.character(.x))) %>% 
    dplyr::rename_with(function(x) tools::toTitleCase(x), .cols = tidyselect::everything()) %>% 
    flextable::flextable() %>% 
    flextable::autofit() %>% 
    flextable::valign(j = "Year", valign = "top", part = "body") %>% 
    flextable::delete_part(part = "header") %>% 
    flextable::border_remove()
  
  return(data_out)
  
}

papers_tbl <- function(data = NULL){
  
  data_out <- data %>% 
    dplyr::rename_with(.fn = tolower, .cols = tidyselect::everything()) %>% 
    dplyr::arrange(year, month, publication) %>% 
    dplyr::mutate(dplyr::across(tidyselect::everything(), ~as.character(.x))) %>% 
    dplyr::mutate(no = glue::glue("{row_number()}.")) %>% 
    dplyr::select(no, publication) %>% 
    dplyr::rename_with(function(x) tools::toTitleCase(x), .cols = tidyselect::everything()) %>%
    dplyr::mutate(Publication = stringr::str_replace_all(Publication, '\\*', '\\\\*')) %>% 
    dplyr::mutate(Publication = stringr::str_replace(Publication, "Weberpals J", "**Weberpals J**")) %>% 
    flextable::flextable() %>% 
    ftExtra::colformat_md(j = "Publication") %>% 
    flextable::valign(j = "No", valign = "top", part = "body") %>% 
    flextable::autofit() %>% 
    flextable::delete_part(part = "header") %>% 
    flextable::border_remove()
  
  return(data_out)
  
}
