# library  for package load
library(tidyverse)
library(openxlsx)

# Upload the table
Gene_table <- read_table("D:/My/R/CSR/Cervix Cancer/Data/table_degenes.txt")

# Arrange the Table to change Data Types
Gene_table$GeneSymbol <- as.factor(Gene_table$GeneSymbol)
Gene_table$GeneID <- as.factor(Gene_table$GeneID)
head(Gene_table)

# Finding Over expressed gene by filtering
over_expressed <- Gene_table |>
  filter(adjp < .01 & `Log2(FoldChange)`> 1) |>
  arrange(adjp) |>
  head(20)

over_expressed_1 <- Gene_table |>
  filter(adjp < .01 & `Log2(FoldChange)`> 1) |>
  arrange(`Log2(FoldChange)`) |>
  head(20)

# Finding Under expressed Gene by Filtering
under_expressed <- Gene_table |>
  filter(adjp < .01 & `Log2(FoldChange)`< 1) |>
  arrange(`Log2(FoldChange)`) |>
  head(20)

under_expressed_1 <- Gene_table |>
  filter(adjp < .01 & `Log2(FoldChange)`< 1) |>
  arrange(adjp) |>
  head(20)

# Adjust Multiple Output in a table
finding_1_log2fold <- bind_rows(over_expressed_1,under_expressed_1)
finding_2_adjp <- bind_rows(over_expressed,under_expressed)
finding_3_over <- bind_rows(over_expressed,over_expressed_1)
finding_4_under <- bind_rows(under_expressed,under_expressed_1)
finding_5_all <- bind_rows(over_expressed,over_expressed_1,under_expressed,under_expressed_1)

# Export findings from R to Pc
write.xlsx(finding_1_log2fold,"finding_1_log2fold.xls")
write.xlsx(finding_2_adjp,"finding_2_adjp.xls")
write.xlsx(finding_3_over,"finding_3_over.xls")
write.xlsx(finding_4_under,"finding_4_under.xls")
write.xlsx(finding_5_all,"finding_5_all.xls")
