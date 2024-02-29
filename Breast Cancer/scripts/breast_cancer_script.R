#load package 
library(tidyverse)
library(openxlsx)


# read gene tables 
gene_tables <- read_table("data/table_degenes.txt")


# convert dada 
gene_tables$GeneSymbol <- as.factor(gene_tables$GeneSymbol)
gene_tables$GeneID <- as.factor(gene_tables$GeneID)



# Identify over-expressed significant genes
over_expressed_genes <- gene_tables |>
  filter(adjp <0.05 & Log2FoldChange < 1) |>
  head(20)

# Export data to Excel
write.xlsx(over_expressed_genes, "outputs/over_expressed_genes_20.xlsx")


# Identify under-expressed significant genes
under_expressed_genes <- gene_tables |>
  filter(adjp < 0.05 & Log2FoldChange > 1) |>
  arrange(adjp) |>
  head(20)

# Export data to Excel
write.xlsx(under_expressed_genes, "outputs/under_expressed_genes_20.xlsx")


# join data
gene_data <- bind_rows(over_expressed_genes, under_expressed_genes)


# Export data to Excel
write.xlsx(gene_data, "outputs/gene_data40.xlsx")



head(gene_tables)
