# load packages
library(tidyverse)
library(TCGAbiolinks)
library(glmnet)
library(factoextra)
library(FactoMineR)
library(caret)
library(SummarizedExperiment)
library(RColorBrewer)
library(gProfileR)
library(genefilter)
library(GenomicDataCommons)
library(GenomeInfoDbData)
library(keras)
library(tensorflow)

query_TCGA <- GDCquery(
  project = "TCGA-PRAD",
  data.category = "Transcriptome Profiling",
  data.type = "Gene Expression Quantification",
  experimental.strategy = "RNA-Seq",
  barcode = c("TCGA-*")) # parameter enforced by GDCquery

# https://portal.gdc.cancer.gov/projects/TCGA-PRAD
GDCdownload(query = query_TCGA, method = "api", files.per.chunk = 100)

tcga_data <- GDCprepare(query_TCGA, summarizedExperiment = TRUE)

class(tcga_data)

saveRDS(tcga_data,file = "TCGA.rds")
tcga_data <- readRDS("TCGA.rds")




