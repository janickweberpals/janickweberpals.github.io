---
permalink: /personal/
title: "Scholarship statistics"
modified: 31 July 2022
author_profile: true
---

```{r setup, include = FALSE}
# setup
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(scholar))
source(here::here("R", "_default_DT.R"))
source(here::here("R", "_flextable_defaults.R"))
googlesheets4::gs4_auth(email="janick.weberpals@gmail.com")
sheet_url <- Sys.getenv("GOOGLESHEETS_URL")
## google scholar id
gs_id <- 'B59js_8AAAAJ&hl=en'
## google scholar profile
gs_profile <- scholar::get_profile(gs_id)
# set chunk default options
knitr::opts_chunk$set(dpi = 100, 
                      echo = FALSE,
                      fig.align = "left")
```

```{r, include=FALSE}
# get publications from own database
pubs <- googlesheets4::read_sheet(sheet_url, sheet = 'Publication_database') %>% 
  tibble::as_tibble()
# get publications from google scholar database
gs_pubs <- scholar::get_publications(gs_id) %>% 
  dplyr::arrange(desc(cites)) %>% 
  dplyr::rename(gs_year = year)
# join citation info
pubs <- pubs %>% 
  dplyr::left_join(gs_pubs, by = c("cid", "pubid")) %>% 
  dplyr::mutate(journal = tools::toTitleCase(tolower(journal)))
# get impact factors
impact_factors <- JCRImpactFactor::find.IF.JCR(journals = tolower(pubs$journal)) %>% 
  dplyr::rename(journal = Full.Journal.Title) %>% 
  dplyr::rename_with(.fn = ~stringr::str_remove(.x, "IF"), .cols = starts_with("IF")) %>% 
  tidyr::pivot_longer(cols = "2010":"2019", names_to = "year", values_to = "jcr_impact_factor") %>% 
  dplyr::mutate(year = as.numeric(year)) %>% 
  dplyr::mutate(journal = tools::toTitleCase(tolower(journal)))
# join if data to publication data
pubs <- pubs %>% 
  dplyr::left_join(impact_factors, by = c("journal", "year")) %>% 
  dplyr::filter(duplicated(.)==FALSE)
```

# Google Scholar profile

**`r gs_profile$name`**

My Google Scholar profile can be found [here](https://scholar.google.com/citations?user=B59js_8AAAAJ&hl=en).

* Current affiliation: `r gs_profile$affiliation`
* Research interests: `r paste0(gs_profile$interests, collapse = ", ")`
* Citations: `r gs_profile$total_cites` citations (details on publications can be found in [Publications](https://janickweberpals.github.io/files/publications.html)
* h-index: `r gs_profile$h_index`
* i10-index: `r gs_profile$i10_index`

# Citations and impact factors

## Citations per year
```{r}
# get citations
gs_cites <- scholar::get_citation_history(gs_id) %>% 
  dplyr::mutate(cites_cum = cumsum(cites))
cites <- gs_cites %>% 
  #dplyr::filter(year != lubridate::year(Sys.Date())) %>% 
  ggplot2::ggplot(ggplot2::aes(x = year, y = cites)) +
  ggplot2::geom_col() +
  ggplot2::labs(x = "Year",
                y = " # citations",
                title = "Citations per year since 2016") +
  ggplot2::scale_x_continuous(breaks = seq(2016, max(gs_cites$year), 1)) +
  ggplot2::scale_y_continuous(breaks = seq(0, max(gs_cites$cites), 10), limits = c(0, max(gs_cites$cites))) +
  ggplot2::theme_bw()
plotly::ggplotly(cites)
```

## Cumulative citations
```{r}
cumcites <- gs_cites %>% 
  ggplot2::ggplot(ggplot2::aes(x = year, y = cites_cum)) +
  ggplot2::geom_point() +
  ggplot2::geom_line() +
  ggplot2::labs(x = "Year",
                y = " # citations",
                title = "Cumulative citations since 2016") +
  ggplot2::scale_x_continuous(breaks = seq(2016, max(gs_cites$year), 1), limits = c(2016, max(gs_cites$year))) +
  ggplot2::scale_y_continuous(breaks = seq(0, max(gs_cites$cites_cum), 25), limits = c(0, max(gs_cites$cites_cum))) +
  ggplot2::theme_bw()
plotly::ggplotly(cumcites)
```

## Cumulative impact factor publications by year
```{r}
cumif <- pubs %>% 
  dplyr::mutate(journal = forcats::fct_reorder(factor(journal), desc(impact_factor))) %>% 
  dplyr::filter(!is.na(impact_factor)) %>% 
  ggplot2::ggplot(ggplot2::aes(x = year, y = impact_factor, fill = journal)) +
  ggplot2::geom_bar(position="stack", stat="identity") +
  ggplot2::labs(x = "Year",
                y = " Cumulative impact factor") +
  ggplot2::scale_x_continuous(breaks = seq(2015, max(pubs$year), 1)) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none")
plotly::ggplotly(cumif)
```

## Top cited articles

My top 5 cited articles are listed below. The impact factor relates to the year of publication. A more detailed list on publications can be found in [Report of Scholarship](https://janickweberpals.github.io/scholarship/#Report_of_Scholarship) below.
```{r}
pubs %>% 
  dplyr::arrange(desc(cites)) %>% 
  dplyr::mutate(publication = stringr::str_replace_all(publication, '\\*', '\\\\*')) %>% 
  dplyr::mutate(publication = stringr::str_replace(publication, "Weberpals J", "**Weberpals J**")) %>% 
  dplyr::select('Full citation' = publication,
                '# citations' = cites,
                'Journal impact factor' = impact_factor) %>% 
  dplyr::mutate(across(everything(), as.character)) %>% 
  dplyr::slice(1:5) %>% 
  flextable::flextable() %>% 
  flextable::autofit() %>% 
  ftExtra::colformat_md(j = 'Full citation') %>% 
  flextable::bold(part = "header")
```


```{r, eval=FALSE, warning=FALSE}
## Co-author network

# `r kableExtra::text_spec("CAVE: Google Scholar is quite error prone for the co-author network!", color = "red")`

# Be careful with specifying too many coauthors as the visualization of the
# network can get very messy.
coauthor_network <- scholar::get_coauthors(gs_id, n_coauthors = 5)
scholar::plot_coauthors(coauthor_network)
```

# Return to [home](https://janickweberpals.github.io)