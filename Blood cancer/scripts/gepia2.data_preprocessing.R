library(tidyverse)
library(openxlsx)

# read gene tables
genetable <- read_table("data/table_degenes_laml.txt")

# check data structure
glimpse(genetable)

# convert data
genetable$GeneSymbol <- as.factor(genetable$GeneSymbol)
genetable$GeneID <- as.factor(genetable$GeneID)

# identify over-expressed significant genes
over_expressed_genes <- genetable |>
  filter(adjp < 0.05 & Log2FoldChange > 1) |>
  head(20)

# export data to excel
write.xlsx(over_expressed_genes, "output/over_expressed_genes_top20.xlsx")

# identify under-expressed significant genes
under_expressed_genes <- genetable |>
  filter(adjp < 0.05 & Log2FoldChange < -1) |>
  head(20)

# export data to excel
write.xlsx(under_expressed_genes, "output/under_expressed_genes_top20.xlsx")

# join data
gene_data <- bind_rows(over_expressed_genes,under_expressed_genes)

# export data to excel
write.xlsx(gene_data, "output/gene_data1.xlsx")






