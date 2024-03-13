#Lymph node cancer
#DLBC(Lymphoid Neoplasm Diffuse Large B-cell Lymphoma)
# install pakages
install.packages("tidyverse")
install.packages("openxlsx")

# load pakages
library(tidyverse)
library(openxlsx)

# read gene tables
gene_table_dlbc <- read.table("data/table_degenes_dlbc.txt",header = TRUE)
#Check data
glimpse(gene_table_dlbc )

#Convert data
gene_table_dlbc$GeneSymbol <- as.factor(gene_table_dlbc$GeneSymbol)
gene_table_dlbc$GeneID <- as.factor(gene_table_read$GeneID)

# Identify significant over-expressed genes
over_expressed_genes <- gene_table_dlbc |>
  filter(adjp < 0.05 & Log2FoldChange > 1) |>
  arrange(adjp) |>
  head(40)

# Identify significant under-expressed genes
under_expressed_genes <- gene_table_dlbc |>
  filter(adjp < 0.05 & Log2FoldChange < -1) |>
  arrange(adjp) |>
  head(40)

# join data
gene_data_dlbc <- bind_rows(over_expressed_genes, under_expressed_genes)

# Export data to Excel
write.xlsx(over_expressed_genes, file= "outputs/over_expressed_genes.xlsx")
write.xlsx(under_expressed_genes, file= "outputs/under_expressed_genes.xlsx")
write.xlsx(gene_data_dlbc, file= "outputs/gene_data_dlbc.xlsx")

