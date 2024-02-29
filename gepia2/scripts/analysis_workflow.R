library(tidyverse)
library(fgsea)
library(openxlsx)

# read tables
gene_data <- read_table("gepia2/data/table_degenes_brca.txt")

# Filter genes with significant differential expression
significant_genes <- gene_data  |>
  filter(adjp < 0.05 & abs(Log2FoldChange) > 1)

# Volcano plot
plot(-log10(gene_data$adjp), gene_data$Log2FoldChange,
     xlab = "-log10(adjusted p-value)", ylab = "Log2FoldChange",
     main = "Volcano Plot", pch = 20,
     col = ifelse(abs(gene_data$Log2FoldChange) > 1 & gene_data$adjp < 0.05, "red", "black"))
