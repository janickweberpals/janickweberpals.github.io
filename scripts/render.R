# render markdown files

# render scholarship script
path_scholar <- here::here("scripts", "scholarship.Rmd")
path_pubs <- here::here("scripts", "papers.Rmd")
path_talks <- here::here("scripts", "talks.Rmd")

# report of scholarship (html version)
rmarkdown::render(input = path_scholar, output_dir = here::here("files"), output_file = "scholarship", output_format = "html_document")
#rmarkdown::render(input = path_scholar, output_dir = here::here("_scholarship"), output_file = "scholarship", output_format = "md_document")
rmarkdown::render(input = path_pubs, output_dir = here::here("files"), output_file = "publications", output_format = "html_document")
rmarkdown::render(input = path_talks, output_dir = here::here("files"), output_file = "talks", output_format = "html_document")

# .docx version (not really used but useful to have)
# rmarkdown::render(input = path_in, output_dir = here::here("output"), output_format = "word_document")