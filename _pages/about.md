---
permalink: /about/
title: "About"
excerpt: "About me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

I'm a health data scientist and R/Python enthusiast and currently work as an [Instructor in Medicine at Harvard Medical School](https://connects.catalyst.harvard.edu/Profiles/profile/202837271) and Investigator in the [Division of Pharmacoepidemiology and Pharmacoeconomics](https://www.drugepi.org) at Brigham and Women's Hospital in Boston, USA.

## Research interests

My research interests focus on the development and application of machine and deep learning methods to improve causal inference from multimodal clinical data dimensions combining electronic health records (EHR), imaging data, unstructured notes, and administrative claims databases. Over the years, I have also developed deep domain expertise in the clinical fields of cancer research as well as cardiovascular medicine and neuroscience. I'm a big advocate of transparent and reproducible research (including the use of Github/GitLab) and have a passion for providing code and developing software to enable others to learn, grow and be impactful.

My most recent projects centered around missing data approaches in EHR, prognostics scores in oncology ([Ann Oncol 2021](https://www.annalsofoncology.org/article/S0923-7534(20)39970-1/fulltext), [Front Artif Intell 2021](https://www.frontiersin.org/articles/10.3389/frai.2021.625573/full)) and applications of machine learning and deep learning networks (autoencoders) to improve confounding control in comparative effectiveness research ([Epidemiology 2021](https://journals.lww.com/epidem/Abstract/2021/05000/Deep_Learning_based_Propensity_Scores_for.10.aspx)). He has further conducted and published multiple studies on drug repurposing in oncology ([Sci Rep 2017](https://pubmed.ncbi.nlm.nih.gov/28588274/), [Int J Cancer 2017](https://pubmed.ncbi.nlm.nih.gov/28370155/)), time-dependent biases ([Eur J Epidemiol 2017](https://pubmed.ncbi.nlm.nih.gov/28864947/), [Clin Epidemiol 2018](https://pubmed.ncbi.nlm.nih.gov/30214315/)) and long-term population level cancer survival using national and European cancer registries ([Haematologica 2017](https://pubmed.ncbi.nlm.nih.gov/28280077/), [Eur Heart J 2018](https://pubmed.ncbi.nlm.nih.gov/29635274/), [Cancer 2019](https://pubmed.ncbi.nlm.nih.gov/31095726/)) for which he received the [Stephan-Weiland prize](https://twitter.com/dgepi/status/1045682156121595905) and the [Advancement Award](https://www.gmds.de/de/preise-ehrungen/gmds-foerderpreise-fuer-studierende/) in Epidemiology by the German Association for Medical Informatics, Biometry and Epidemiology.

## Training

-   **2018-2020** - Postdoctoral training in machine and deep learning in electronic health records (EHR), Roche Innovation Center Munich, Germany
-   **2019** - Ph.D. in Epidemiology, Medical Faculty, University of Heidelberg, Germany
-   **2018** - Board certification as specialized pharmacist in drug information, Germany
-   **2015** - Pharmacy degree (Registered Pharmacist), College of Pharmacy, Philipps-University Marburg, Germany

## Featured Research

I was recently invited to present some of my research at the **FDA Sentinel Innovation Center Webinar** where I had the chance to talk about machine and deep learning to make causal predictions and inferences from electronic health records (EHR) data.

<iframe width="560" height="315" src="https://www.youtube.com/embed/yglV1EGF3Fs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>

</iframe>

I'm fascinated by neural networks and deep learning and the following paper highlights some of my thoughts around utilizing these methods for causal inference:

> Weberpals J, Becker T, Davies J, Schmich F, Rüttinger D, Theis FJ, Bauer-Mehren A. Deep learning-based propensity scores for confounding control in comparative effectiveness research: A large-scale, real-world data study. **Epidemiology**. 2021 May 1;32(3):378-88.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ULX5usCw1js" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>

</iframe>

## Software development

The development and analysis code published in the aforementioned article "Deep learning-based propensity scores for confounding control in comparative effectiveness research: A large-scale, real-world data study" (Weberpals et al., Epidemiology, 2021) can be accessed on the following **Github repository**:

> <https://github.com/janickweberpals/autoencoderPS>

The computing code used in this study is available as Python Jupyter Markdown scripts (.html) as supplementary material. All of the analyses described in the article were performed in R version 3.2.2. The PCA and autoencoder training was performed using sckit-learn and Keras with Tensorflow backend in Python version 3.6.0, respectively. The code that was used for the simulation is available as Rmarkdown.
