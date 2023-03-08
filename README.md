# KI-course-5633
Assignments for " Bioinformatics Analysis and Visualisation of Medical Genomics Data", March 2023


# Environment
Environment for RStudio is managed by Docker.

- R version 4.2.2 (2022-10-31)
- Platform: x86_64-pc-linux-gnu (64-bit)
- Running under: Ubuntu 22.04.1 LTS

- tidyverse_2.0.0 
- BiocManager_1.30.19
- ggplot2_3.4.1

# Run 
All required environment is contain in Docker image.

## In vscode
Requierment: `Dev Containers` extention

Use `Dev Container`s extention to open folder in container. Access `http://localhost:8787/` on browser and open Rstudio.

## In command line
After run docker image, access `http://localhost:8787/` on browser and open Rstudio.

# To share the notebook.
I use R notebook to write my documents and all R notebook uploaded in Github. But maybe R notebook format is better to share as online web page and not by Github? `.Rmd` and `.nb.html` format is not able see on github repository and both `.Rmd` and `.nb.html` must be download and open on Rstudio to see visualization. 