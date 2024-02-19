library(tidyverse)
library(openxlsx)

# read tables
gene_table <- read_table("data/table_degenes_brca.txt")

# convert data into factors
gene_table$GeneSymbol <- as.factor(gene_table$GeneSymbol)
gene_table$GeneID <- as.factor(gene_table$GeneID)

# Know your data
# 1. Gene Symbol: This column contains symbols representing genes, typically short identifiers used to represent genes in various databases and analyses.
# 2. GeneID: This column contains the unique identifiers associated with genes. In this dataset, it appears to be using Ensembl gene IDs, which are standardized identifiers for genes in the Ensembl database.
# 3. Median Tumor: This column likely represents the median expression level of each gene in tumor samples. It's a numeric value representing the median expression level.
# 4. Median Normal: This column likely represents the median expression level of each gene in normal (non-tumor) samples. Similar to "MedianTumor", it's a numeric value representing the median expression level.
# 5. Log2Fold Change: This column typically represents the log2-fold change in gene expression between tumor and normal samples. It's a measure of how much the expression of a gene changes between the two conditions.
# 6. adjp: This column likely contains adjusted p-values associated with each gene, often used in statistical analyses to determine if the observed differences in gene expression are statistically significant after adjusting for multiple testing.

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

