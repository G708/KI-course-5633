FROM bioconductor/bioconductor_docker:latest

RUN apt update && apt install -y  openssh-client

# R Packages
RUN R -e "install.packages( \
    c('languageserver', 'here', 'kableExtra', 'patchwork', 'janitor','tidyverse', 'markdown'))"