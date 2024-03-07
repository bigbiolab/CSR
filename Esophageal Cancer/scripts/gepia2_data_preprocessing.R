#install packages
install.packages("tydiverse")
install.packages("openxlsx")


#load packages
library(tidyverse)
library(openxlsx)

#read gene tables
gene_tables <- read_table("E:/Naznin/CSR/Esophageal Cancer/data/table_gene_esca.txt")


#convert data
gene_tables$GeneSymbol<- as.factor(gene_tables$GeneSymbol)
gene_tables$GeneID<- as.factor(gene_tables$GeneID)

#check data structure
glimpse(gene_tables)
head(gene_tables)

#identify over expressed significant gene
over_expressed_gene <- gene_tables |>
  filter(adjp < 0.05 & Log2FoldChange > 1) |>
  head(20)


#identify under expressed significant gene
under_expressed_gene <- gene_tables |>
  filter(adjp < 0.05 & Log2FoldChange < -1) |>
  arrange(adjp) |>
  head(20)


#join data
gene_data <- bind_rows(over_expressed_gene, under_expressed_gene)
gene_data

#export data to excel
write.xlsx(over_expressed_gene, "E:/Naznin/CSR/Esophageal Cancer/outputs/over_expressed_gene.xlsx")
write.xlsx(under_expressed_gene, "E:/Naznin/CSR/Esophageal Cancer/outputs/under_expressed_gene,xlsx")

#join data
gene_data <- bind_rows(over_expressed_gene, under_expressed_gene)
gene_data

#export data to excel
write.xlsx(gene_data, "E:/Naznin/CSR/Esophageal Cancer/outputs/gene_data.xlsx")
