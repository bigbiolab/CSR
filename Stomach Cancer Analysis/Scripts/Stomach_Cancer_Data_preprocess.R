# Loading Packages

library(tidyverse)
library(openxlsx)

# Reading the Gene Table

gene_tables <- read_table("Data/table_genes_Stomach.txt")

# Check Data Structures
glimpse(gene_tables)

# Checking Heads (First Few Items)
head(gene_tables,10)
# Converting Data Structure

gene_tables$GeneSymbol <- as.factor(gene_tables$GeneSymbol)
gene_tables$GeneID <- as.factor(gene_tables$GeneID)

# Identifying Over- Expressed Genes

over_expressed <- gene_tables %>%
   filter(adjp <0.05 & Log2FoldChange >1) %>%
    head(20)

# Exporting Data Over expressed in Excel Format

write.xlsx(over_expressed, "Outcomes/over_expressed_20.xlsx")

# Identifying Under - Expressed Genes

under_expressed <- gene_tables %>%
  filter(adjp < 0.05 & Log2FoldChange > -1) %>%
  arrange(adjp) %>%
  head(20)

# Exporting Data Under expressed in Excel Format

write.xlsx(under_expressed, "Outcomes/under_expressed_20.xlsx")


# Joining Gene Data
combined_gene_data <- bind_rows(over_expressed, under_expressed )

# Exporting Data Combined Gene Data in Excel Format

write.xlsx(combined_gene_data, "Outcomes/combined_gene_data_40.xlsx")










  





