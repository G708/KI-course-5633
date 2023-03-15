FROM bioconductor/bioconductor_docker:latest

RUN apt update && apt install -y  openssh-client

# R Packages
RUN R -e "install.packages( \
    c('languageserver', 'here', 'kableExtra', 'patchwork', 'janitor','tidyverse', 'markdown'))"

RUN R -e "BiocManager::install(c('multtest', 'apeglm', 'limma', 'edgeR', 'DESeq2', 'Rtsne', 'tximport', 'tximportData', 'preprocessCore', 'rhdf5', 'ballgown', 'DEXSeq', 'GenomicFeatures', 'clusterProfiler', 'org.Mm.eg.db', 'org.Rn.eg.db', 'org.Hs.eg.db', 'org.Dm.eg.db', 'org.Ce.eg.db', 'AnnotationHub', 'enrichplot'))" \
 && R -e "install.packages(c('som','ggfortify','ggrepel','gplots','gprofiler2'))"