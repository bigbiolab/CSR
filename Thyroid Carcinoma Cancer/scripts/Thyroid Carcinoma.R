#load packages
library(tidyverse)
library(openxlsx)

#read gene tables
gene_tables <-read_table ("Thyroid Carcinoma Cancer/data/table_degenes_THCA.txt")

#convert data
gene_tables$GeneSymbol<-as.factor(gene_tables$GeneSymbol)
gene_tables$GeneID<-as.factor(gene_tables$GeneID)

#identify over expressed gene
over_expressed_gene <- gene_tables |>
  filter(adjp <0.05 & Log2FoldChange >1) |>
  head(20)

write.xlsx(over_expressed_gene, "Thyroid Carcinoma Cancer/data/over_expressed_gene_THCA.xlsx")

#identify under expressed gene

under_expressed_gene <-gene_tables |>
  filter(adjp <0.05 & Log2FoldChange < -1) |>
  arrange(adjp) |>
  head(20)

write.xlsx(under_expressed_gene, "Thyroid Carcinoma Cancer/data/under_expressed_gene_THCA.xlsx")


#join data
gene_data <- bind_rows(over_expressed_gene,under_expressed_gene)


#export data to excel
write.xlsx(gene_data, "Thyroid Carcinoma Cancer/data/gene_data_THCA.xlsx")
