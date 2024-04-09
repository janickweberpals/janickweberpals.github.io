library(UpSetR)
library(dplyr)
library(here)

data <- read.csv(here("scripts", "publication_tags.csv"))

unique(data$Tags)

x = list(
  Confounding = data |> filter(Tags == "Confounding") |> pull(Publication),
  `Missing data` = data |> filter(Tags == "Missing data") |> pull(Publication),
  `AI/ML` = data |> filter(Tags == "AI/ML") |> pull(Publication),
  Clinical = data |> filter(Tags == "Clinical") |> pull(Publication),
  Software = data |> filter(Tags == "Software") |> pull(Publication),
  Simulation = data |> filter(Tags == "Simulation") |> pull(Publication),
  Reproducibility = data |> filter(Tags == "Reproducibility") |> pull(Publication),
  `Data continuity` = data |> filter(Tags == "Data continuity") |> pull(Publication),
  `Prognostic/predictive models` = data |> filter(Tags == "Prognostic/predictive models") |> pull(Publication)
  )

UpSetR::upset(fromList(x), nsets = 9, text.scale = 2, order.by = "freq")
