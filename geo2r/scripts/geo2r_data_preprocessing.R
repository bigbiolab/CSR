library(tidyverse)
library(openxlsx)

# read tables
gene_table <- read_table("geo2r/data/GSE21942.top.table.tsv")

# convert data into factors
gene_table$GeneSymbol <- as.factor(gene_table$GeneSymbol)
gene_table$ID <- as.factor(gene_table$ID)
gene_table$GeneTitle <- as.factor(gene_table$GeneTitle)


# Identify over-expressed significant genes
over_expressed_genes <- gene_table  |>
  filter(adjPVal < 0.05 & logFC > 1) |>
  arrange(adjPVal) |>
  head(20)

# Identify under-expressed significant genes
under_expressed_genes <- gene_table  |>
  filter(adjPVal < 0.05 & logFC < -1) |>
  arrange(adjp) |>
  head(20)

# join data
gene_data <- bind_rows(over_expressed_genes, under_expressed_genes)

# Export data to Excel
write.xlsx(gene_data, "geo2r/outputs/gene_data.xlsx")

