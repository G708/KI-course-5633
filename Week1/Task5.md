Task5
================
Gina Miku Oba
2023-03-06

# Task5 - Using R example datasets

## 1. CO2 dataset

First, load CO2 dataset.

``` r
data(CO2)
# also loading library for later use
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.0     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.1     ✔ tibble    3.1.8
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors

This data contains 84 observations (row) and 5 variables (column).

## 2. Contents of CO2 dataset

``` r
help(CO2)
```

The CO2 dataset is from an experiment on the cold tolerance of the grass
species *Echinochloa crus-galli* from Quebec and Mississippi. This data
contains 84 observations (row) and 5 variables (column). There are 3
biological replicates for each 4 condition (Quebec-nonchilled,
Quebec-chilled, Mississippi-nonchilled, Mississippi-chilled) and 7
different ambient carbon dioxide concentration for each sample (3 x 4 x
7 = 84). 5 variables include the unique identifier for each plant
(*Plant*), the origin of the plant (*Type*), treatment (*Treatment*,
which is `nonchilled` or `chilled`), the ambient carbon dioxide
concentration (*conc*), the carbon dioxide uptake rates (*uptake*) of
the plant.

## 3. Average and median CO2 uptake of the plants from Quebec and Misissippi.

Functions to compute Average and median in R is as below.

- average : `mean(x)`
- median : `median(x)`

``` r
# average(mean) and median CO2 uptake of the all plants
CO2 %>%
  # summarize results in table form
    summarize( 
      Average = mean(uptake, na.rm=TRUE),
      Median = median(uptake, na.rm=TRUE))
```

    ##   Average Median
    ## 1 27.2131   28.3

Compute average(mean) and median CO2 uptake of the plants from Quebec
and Mississippi.

``` r
# average(mean) and median CO2 uptake of the plants from Quebec and Mississippi.
CO2 %>%
    group_by(Type) %>% # grouping data of same origin
    # summarize results in table form
    summarize(
      Average = mean(uptake, na.rm=TRUE),
      Median = median(uptake, na.rm=TRUE))
```

    ## # A tibble: 2 × 3
    ##   Type        Average Median
    ##   <fct>         <dbl>  <dbl>
    ## 1 Quebec         33.5   37.2
    ## 2 Mississippi    20.9   19.3

From the data, we can speculate that the plant from Quebec will have
more CO2 uptake than the plant from Mississippi.

## 4. \[Optional\] How many genes are expressed in each sample in “airway” dataset? How many genes are not expressed in any sample?

To load airway dataset from Bioconductor, command is as below.

``` r
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("airway")
```

    ## 'getOption("repos")' replaces Bioconductor standard repositories, see
    ## '?repositories' for details
    ## 
    ## replacement repositories:
    ##     CRAN: https://packagemanager.posit.co/cran/__linux__/jammy/latest

    ## Bioconductor version 3.16 (BiocManager 1.30.19), R 4.2.2 (2022-10-31)

    ## Warning: package(s) not installed when version(s) same as or greater than current; use
    ##   `force = TRUE` to re-install: 'airway'

    ## Installation paths not writeable, unable to update packages
    ##   path: /usr/local/lib/R/library
    ##   packages:
    ##     class, codetools, MASS, mgcv, nlme, spatial, survival

    ## Old packages: 'BiocManager', 'cachem', 'fansi', 'fastmap', 'fontawesome', 'fs',
    ##   'gh', 'haven', 'httpuv', 'httr', 'knitr', 'Rcpp', 'sass', 'sourcetools',
    ##   'styler', 'tibble', 'tinytex', 'utf8', 'xfun', 'yaml'

``` r
library( "airway" )
```

    ## Loading required package: SummarizedExperiment

    ## Loading required package: MatrixGenerics

    ## Loading required package: matrixStats

    ## 
    ## Attaching package: 'matrixStats'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     count

    ## 
    ## Attaching package: 'MatrixGenerics'

    ## The following objects are masked from 'package:matrixStats':
    ## 
    ##     colAlls, colAnyNAs, colAnys, colAvgsPerRowSet, colCollapse,
    ##     colCounts, colCummaxs, colCummins, colCumprods, colCumsums,
    ##     colDiffs, colIQRDiffs, colIQRs, colLogSumExps, colMadDiffs,
    ##     colMads, colMaxs, colMeans2, colMedians, colMins, colOrderStats,
    ##     colProds, colQuantiles, colRanges, colRanks, colSdDiffs, colSds,
    ##     colSums2, colTabulates, colVarDiffs, colVars, colWeightedMads,
    ##     colWeightedMeans, colWeightedMedians, colWeightedSds,
    ##     colWeightedVars, rowAlls, rowAnyNAs, rowAnys, rowAvgsPerColSet,
    ##     rowCollapse, rowCounts, rowCummaxs, rowCummins, rowCumprods,
    ##     rowCumsums, rowDiffs, rowIQRDiffs, rowIQRs, rowLogSumExps,
    ##     rowMadDiffs, rowMads, rowMaxs, rowMeans2, rowMedians, rowMins,
    ##     rowOrderStats, rowProds, rowQuantiles, rowRanges, rowRanks,
    ##     rowSdDiffs, rowSds, rowSums2, rowTabulates, rowVarDiffs, rowVars,
    ##     rowWeightedMads, rowWeightedMeans, rowWeightedMedians,
    ##     rowWeightedSds, rowWeightedVars

    ## Loading required package: GenomicRanges

    ## Loading required package: stats4

    ## Loading required package: BiocGenerics

    ## 
    ## Attaching package: 'BiocGenerics'

    ## The following objects are masked from 'package:lubridate':
    ## 
    ##     intersect, setdiff, union

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     combine, intersect, setdiff, union

    ## The following objects are masked from 'package:stats':
    ## 
    ##     IQR, mad, sd, var, xtabs

    ## The following objects are masked from 'package:base':
    ## 
    ##     anyDuplicated, aperm, append, as.data.frame, basename, cbind,
    ##     colnames, dirname, do.call, duplicated, eval, evalq, Filter, Find,
    ##     get, grep, grepl, intersect, is.unsorted, lapply, Map, mapply,
    ##     match, mget, order, paste, pmax, pmax.int, pmin, pmin.int,
    ##     Position, rank, rbind, Reduce, rownames, sapply, setdiff, sort,
    ##     table, tapply, union, unique, unsplit, which.max, which.min

    ## Loading required package: S4Vectors

    ## 
    ## Attaching package: 'S4Vectors'

    ## The following objects are masked from 'package:lubridate':
    ## 
    ##     second, second<-

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     first, rename

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     expand

    ## The following objects are masked from 'package:base':
    ## 
    ##     expand.grid, I, unname

    ## Loading required package: IRanges

    ## 
    ## Attaching package: 'IRanges'

    ## The following object is masked from 'package:lubridate':
    ## 
    ##     %within%

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     collapse, desc, slice

    ## The following object is masked from 'package:purrr':
    ## 
    ##     reduce

    ## Loading required package: GenomeInfoDb

    ## Loading required package: Biobase

    ## Welcome to Bioconductor
    ## 
    ##     Vignettes contain introductory material; view with
    ##     'browseVignettes()'. To cite Bioconductor, see
    ##     'citation("Biobase")', and for packages 'citation("pkgname")'.

    ## 
    ## Attaching package: 'Biobase'

    ## The following object is masked from 'package:MatrixGenerics':
    ## 
    ##     rowMedians

    ## The following objects are masked from 'package:matrixStats':
    ## 
    ##     anyMissing, rowMedians

``` r
data("airway")
```

``` r
help(airway)
airway
```

    ## class: RangedSummarizedExperiment 
    ## dim: 64102 8 
    ## metadata(1): ''
    ## assays(1): counts
    ## rownames(64102): ENSG00000000003 ENSG00000000005 ... LRG_98 LRG_99
    ## rowData names(0):
    ## colnames(8): SRR1039508 SRR1039509 ... SRR1039520 SRR1039521
    ## colData names(9): SampleName cell ... Sample BioSample

`airway` data is the RNA-seq read count data of airway smooth muscle
cell lines, contains 64102 features of 8 samples. Matrix of read count
(which row is gene, and column is sample) is able to extruct by
`assay(airway)`.

If read count is over 1 that gene is considered as expressed gene.

``` r
# count expressed gene (read count >=1) for each sample
as.data.frame(assay(airway)) %>% # change data format. Otherwise, it will be `Error in UseMethod("tbl_vars")`
  summarise_all(~sum(. >= 1, na.rm = TRUE)) # count if value is >=1.
```

    ##   SRR1039508 SRR1039509 SRR1039512 SRR1039513 SRR1039516 SRR1039517 SRR1039520
    ## 1      24633      24527      25699      23124      25508      25998      24662
    ##   SRR1039521
    ## 1      23991

Average of expressed gene across samples is as below.

``` r
# count expressed gene (read count >=1) for each sample
as.data.frame(assay(airway)) %>% # change data format. Otherwise, it will be `Error in UseMethod("tbl_vars")`
  summarise_all(~sum(. >= 1, na.rm = TRUE)) %>% # count if value is >=1.
  # Mean of expressed gene across samples.
  rowMeans()
```

    ## [1] 24767.75

The gene which not expressed in any sample is as below.

``` r
df = as.data.frame(assay(airway))

# rowSums() function to calculate the sum of each row
# filter the data frame with the row which sum of the row is 0.
all_zero_rows <- df[rowSums(df) == 0, ]
print(dim(all_zero_rows))
```

    ## [1] 30633     8

Across sample average 24767 genes, minimun 23124 to maximum 25998 genes
are expressed (read count \>=1). And genes which is not expressed in any
sample is 30633 genes.
