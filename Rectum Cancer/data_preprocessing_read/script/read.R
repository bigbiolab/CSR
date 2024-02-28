#READ(Rectum adenocarcinoma)

# install pakages
install.packages("tidyverse")
install.packages("openxlsx")

# load pakages
library(tidyverse)
library(openxlsx)

# read gene tables
gene_table_read <- read.table("data/table_degenes_read.txt",header = TRUE)

#Check data
glimpse(gene_table_read )

#Convert data
gene_table_read$GeneSymbol <- as.factor(gene_table_read$GeneSymbol)
gene_table_read$GeneID <- as.factor(gene_table_read$GeneID)

# Identify significant over-expressed genes
over_expressed_genes <- gene_table_read |>  
  filter(adjp < 0.05 & Log2FoldChange > 1) |>  
  arrange(adjp) |> 
  head(40)

# Identify significant under-expressed genes
under_expressed_genes <- gene_table_read |>  
  filter(adjp < 0.05 & Log2FoldChange < -1) |>  
  arrange(adjp) |> 
  head(40)

# join data
gene_data_read <- bind_rows(over_expressed_genes, under_expressed_genes)

# Export data to Excel
write.xlsx(over_expressed_genes, file= "outputs/over_expressed_genes.xlsx")
write.xlsx(under_expressed_genes, file= "outputs/under_expressed_genes.xlsx")
write.xlsx(gene_data_read, file= "outputs/gene_data_read.xlsx")

