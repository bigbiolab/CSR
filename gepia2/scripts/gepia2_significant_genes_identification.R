library(tidyverse)
library(openxlsx)

# read tables
gene_table <- read_table("data/table_degenes_brca.txt")

# convert data into factors
gene_table$GeneSymbol <- as.factor(gene_table$GeneSymbol)
gene_table$GeneID <- as.factor(gene_table$GeneID)

# Identify over-expressed significant genes
over_expressed_genes <- gene_table  |>
  filter(adjp < 0.05 & Log2FoldChange > 1) |>
  arrange(adjp) |>
  head(20)

# Identify under-expressed significant genes
under_expressed_genes <- gene_table  |>
  filter(adjp < 0.05 & Log2FoldChange < -1) |>
  arrange(adjp) |>
  head(20)

# join data
gene_data <- bind_rows(over_expressed_genes, under_expressed_genes)




# Export data to Excel
write.xlsx(gene_data, "exports/gene_data.xlsx")

