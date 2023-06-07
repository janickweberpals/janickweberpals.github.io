---
permalink: /software/
title: "Software development"
author_profile: true
---

## `smdi` - An R package to perform routine structural missing data investigations in real-world data

Partially observed covariates are a common challenge in the analysis of electronic health records. Backed by large-scale simulations, this package eases the implementation of routine missing data checks to characterize the underlying missingness and make informed decisions about the appropriate analytical choice for your study.

<img src="./images/smdi_hexagon.png" alt= “” width="300" height="315">

- [Link](https://janickweberpals.gitlab-pages.partners.org/smdi/index.html) to package website

- Package presentation at the New England Statistics Symposium 2023:

<iframe width="725" height="440.6641" class="html" src="https://drugepi.gitlab-pages.partners.org/NESS2023/ness2023.html#/title-slide"></iframe>


## `autoencoderPS` - An autoencoder-based propensity score for causal inference

I'm fascinated by neural networks and deep learning and the following paper highlights some of my thoughts around utilizing these methods for causal inference:

> **Weberpals J**, Becker T, Davies J, Schmich F, Rüttinger D, Theis FJ, Bauer-Mehren A. Deep learning-based propensity scores for confounding control in comparative effectiveness research: A large-scale, real-world data study. **Epidemiology**. 2021 May 1;32(3):378-88.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ULX5usCw1js" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The development and analysis code published in the article "Deep learning-based propensity scores for confounding control in comparative effectiveness research: A large-scale, real-world data study" (Weberpals et al., Epidemiology, 2021) can be accessed on the following **Github repository**:

> [https://github.com/janickweberpals/autoencoderPS](https://github.com/janickweberpals/autoencoderPS)

The computing code used in this study is available as Python Jupyter Markdown scripts (.html) as supplementary material. All of the analyses described in the article were performed in R version 3.2.2. The PCA and autoencoder training was performed using sckit-learn and Keras with Tensorflow backend in Python version 3.6.0, respectively. The code that was used for the simulation is available as Rmarkdown.













