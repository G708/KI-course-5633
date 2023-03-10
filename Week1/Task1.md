---
title: "Task1"
author: "Gina Miku Oba"
date: "2023-03-10"
---

# Task1 - Literature
Read the research article of the hands-on working group.

Paper : Human White Adipose Tissue Displays Selective Insulin Resistance in the Obese State. PMID: 33863803

## 2a. What is the medically relevant insight from the article?
This paper investigates whether white adipose tissue (WAT) shows a similar mechanism to selective hepatic insulin resistance, which is a feature of obesity and type 2 diabetes. This study found that adipose tissue (WAT) also operate selective insulin resistance in obesity, which can be normalized by weight loss. This insight is observed by the analysis of insulin sensitivity by hyperinsulinaemic clamp, as well as insulin response gene expression analysis by CAGE-seq in WAT on 3 groups of human women, 1. obese, 2. after bariatric surgery, and 3. non-obese. The results identified a common gene set present in all three groups, an obesity suppressor gene set that is selectively regulated in the non-obese state, and post-obese enriched genes that respond to insulin only in those who have lost weight.

## 2b. Which genomics technology/ technologies were used?
The genomics technology used in this study is CAGE-seq (Cap Analysis Gene Expression sequencing). CAGE-seq measures the 5' end of a mRNA molecule which has a unique structure called a "cap structure". The read is mapped only around the TSS region of its RNA. This technology allows users to identify promoters and new isoforms in addition to measuring gene expression amount.

## 3a. List and explain at least three questions/ hypotheses you can think of that extend the analysis presented in the paper.
1. Can similar mechanisms of selective insulin resistance be observed in other types of adipose tissue, such as brown adipose tissue, or other tissues?
2. Is there a tissue-specific mechanism when comparing selective insulin resistance in the liver with selective insulin resistance in white adipose tissue (WAT)?
3. There may have been an epigenetic memory of obesity shown in POB (one-carbon metabolism pathway), but there was no overlap between DEG in POB and DNA methylation. What are other possible mechanisms for keeping the memory of obesity in POB?

## 3b. Devise a computational analysis strategy for (some of) the listed questions under 3a.
1. Conduct same experiment on different tissue and compare insuline responce gene (DEGs).
2. Compare insuline responce gene (DEGs) between liver and WAT.
3. Whether obesity memory signals are released from other cell types is verified by cell type network analysis using single cell analysis.
