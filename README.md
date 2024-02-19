# The Cancer Study Repository

The Cancer Study Repository is a comprehensive collection of resources, datasets, code, and documentation aimed at facilitating research and analysis in the field of cancer biology and oncology. This repository serves as a centralized hub for researchers, clinicians, and data scientists to collaborate, share insights, and advance our understanding of cancer.

## Important Concepts for GEPIA2 Data 
1. **Gene Symbol:** This column contains symbols representing genes, typically short identifiers used to represent genes in various databases and analyses.
2. **GeneID:** This column contains the unique identifiers associated with genes. In this dataset, it appears to be using Ensembl gene IDs, which are standardized identifiers for genes in the Ensembl database.
3. **Median Tumor:** This column likely represents the median expression level of each gene in tumor samples. It's a numeric value representing the median expression level.
4. **Median Normal:** This column likely represents the median expression level of each gene in normal (non-tumor) samples. Similar to "MedianTumor", it's a numeric value representing the median expression level.
5. **Log2Fold Change:** This column typically represents the log2-fold change in gene expression between tumor and normal samples. It's a measure of how much the expression of a gene changes between the two conditions.
6. **adjp:** This column likely contains adjusted p-values associated with each gene, often used in statistical analyses to determine if the observed differences in gene expression are statistically significant after adjusting for multiple testing.

## Important Concepts for GEO2R Data 
1. **ID:** This column contains unique identifiers for each gene or feature in the dataset. These identifiers are used to distinguish between different genes or features.

2. **adjP-Val:** This column represents the adjusted p-value associated with each gene or feature. The adjusted p-value is a statistical measure that accounts for multiple testing and helps identify genes or features that are significantly differentially expressed between experimental conditions.

3. **P-Value:** This column contains the unadjusted p-value associated with each gene or feature. The p-value indicates the probability of observing the data, or more extreme data, under the null hypothesis of no difference between groups. It is used to assess the statistical significance of the observed differences in gene expression.

4. **t:** This column represents the t-statistic associated with each gene or feature. The t-statistic is a measure of the strength of evidence against the null hypothesis and is calculated based on the difference in means between groups and the standard error of the difference.

5. **B:** This column contains the B-statistic associated with each gene or feature. The B-statistic is often used in linear models to assess the evidence for differential expression and is related to the log-odds of differential expression.

6. **logFC:** This column represents the log2 fold change in expression between experimental conditions for each gene or feature. The logFC indicates the magnitude of change in gene expression and whether a gene is upregulated (positive logFC) or downregulated (negative logFC) in one condition compared to another.

7. **GeneSymbol:** This column contains the official gene symbols or names associated with each gene or feature. Gene symbols are standardized identifiers assigned to genes by authoritative databases and are used to refer to specific genes across different studies and datasets.

8. **GeneTitle:** This column provides descriptive titles or names associated with each gene or feature. Gene titles often provide additional context or information about the function, role, or biological significance of the gene. However, in some cases, this column may contain missing values (NA) if no descriptive title is available for a particular gene.

## Visualizations (What? Why? How?)
### MA Plot (M vs A Plot)
- **What:** An MA plot represents the log-fold change (M) on the y-axis and the average expression (A) on the x-axis for each gene or feature.
- **Why:** It is used to visualize differential expression between two conditions.The log-fold change (M) gives an idea of the magnitude of change, and the average expression (A) helps identify if the change is dependent on the expression level.
- **Interpretation:**
  - Each point is a gene.
  - Genes with big expression differences are far from the center.
  - Genes upregulated in one condition are above the center line.
  - Genes downregulated are below the center line.
  - Genes with no change cluster around the center.

### Volcano Plot
- **What:** A volcano plot is a graphical method used to visualize the results of statistical tests, such as t-tests or ANOVA, conducted on high-throughput data, such as gene expression data. It displays both the statistical significance (usually represented as -log10(p-value) on the y-axis) and the magnitude of change (e.g., log2 fold change) between two conditions on the x-axis.
- **Why:** A volcano plot is used to quickly identify genes or features that are significantly differentially expressed between two conditions. It provides a clear visualization of both the statistical significance and the biological relevance of the differences.
- **Interpretation:**
  - Each point on the plot represents a gene or feature.
  - The x-axis typically shows the magnitude of change between conditions (e.g., log2 fold change), with points farther from zero indicating larger differences.
  - The y-axis shows the statistical significance of the differences, often represented as the negative logarithm of the p-value. Points higher on the plot represent greater significance.
  - Genes with both high significance (towards the top of the plot) and large magnitude of change (towards the sides of the plot) are considered to be the most interesting and relevant.
  - Points in the upper-right and upper-left corners of the plot represent genes that are significantly differentially expressed between conditions, with those in the upper-right indicating upregulated genes and those in the upper-left indicating downregulated genes.



### Mean difference (MD) Plot
- **What:**A Mean Difference (MD) plot, also known as a Mean-Difference plot or M-A plot, is a graphical representation that displays the log2 fold change (M) versus the average log2 expression values (A) for genes or features in a dataset.
- **Why:** A Mean Difference (MD) plot is particularly useful for visualizing differentially expressed genes or features between two conditions. It provides a straightforward way to assess the relationship between the magnitude of change and the average expression level across genes.
- **Interpretation:**
  - Log2 Fold Change (M): Represents the difference in expression levels between two conditions. Genes with positive M values are upregulated in one condition compared to another, while genes with negative M values are downregulated.
  - Average Log2 Expression (A): Reflects the average expression level of genes across conditions. It helps identify whether the observed changes are consistent across different expression levels.
  - Gene Representation: Each point on the plot represents a gene or feature, with its coordinates determined by its log2 fold change (M) and average log2 expression (A) values.
  - Differential Expression: Genes that exhibit significant differential expression between conditions are often located at the extremes of the plot. Upregulated genes are typically found at the top, while downregulated genes are located at the bottom.
  - Centering: Non-differentially expressed genes tend to cluster around zero on the y-axis, indicating minimal log2 fold change regardless of the average expression level.


### UMAP
- **What:**Uniform Manifold Approximation and Projection (UMAP) is a dimension reduction technique used in data visualization to represent high-dimensional data in a lower-dimensional space. It is particularly useful for visualizing relationships and clusters within data samples.
- **Why:** UMAP is used to visualize how samples or data points are related to each other in a lower-dimensional space while preserving important relationships present in the original high-dimensional data. It helps to uncover hidden structures, clusters, and patterns within complex datasets.
- **Interpretation:**
  - Identifying clusters: Groups of points close together represent similar samples.
  - Noting separation: Distances between clusters show differences.
  - Observing density: Areas with more points indicate concentration.
  - Recognizing outliers: Isolated points may signify unique samples.
  - Identifying patterns: Gradients, clusters merging, or loops reveal underlying structures.
  - Comparing with metadata: Check if clusters match known categories.
  - Experimenting: Explore different settings for optimal visualization.

### Venn Diagram
- **What:** A Venn diagram is a visual representation that illustrates the relationships and commonalities between different sets or groups of items. It consists of overlapping circles or other shapes, with each circle representing a set and the overlapping areas representing the intersection of those sets.
- **Why:** Use to explore and download the overlap in significant genes between multiple contrasts. The genes in each region on the Venn diagram can be downloaded by selecting the relevant contrasts.
- **Interpretation:**
  - Sets Representation: Each circle represents a set of genes associated with a specific condition, treatment, or experimental group. Genes within each set are those that exhibit significant expression changes under that condition.
  - Intersection Areas: Overlapping regions between circles represent genes that are commonly differentially expressed across multiple conditions or treatments. The size of the overlap indicates the degree of similarity in gene expression changes between sets.
  - Unique Areas: Sections outside the overlapping regions represent genes that are uniquely differentially expressed in one condition but not in others. These genes may be specific biomarkers or regulators associated with particular conditions.
  - Labeling: Sets are labeled with descriptive titles corresponding to the experimental conditions or treatments they represent. Overlapping regions may be labeled to specify common biological processes or pathways affected by gene expression changes.
  - Quantitative Representation: Venn diagrams may include numerical values or percentages to quantify the size or proportion of each gene set and its intersections. This quantitative information helps in understanding the relative significance of gene expression changes across conditions.
  - Comparative Analysis: By visually comparing the sizes of different gene sets and their intersections, researchers can identify shared or distinct patterns of gene expression across conditions. This facilitates the identification of common biological responses or unique features associated with each condition.
  - Clarity and Simplicity: Venn diagrams for gene expression should be clear and easy to understand, with minimal complexity to effectively communicate the relationships between gene sets and their expression patterns under different experimental conditions.


### Boxplot
- **What:** A boxplot, also known as a box-and-whisker plot, is a graphical method for summarizing the distribution of a continuous variable through its quartiles. It provides a concise way to visualize the central tendency, spread, and variability of the data, as well as identify potential outliers.
- **Why:** Boxplots are used to assess the distributional properties of a dataset, compare multiple groups, and detect outliers or anomalies. They provide a clear and intuitive visualization of key summary statistics, making them particularly useful for exploratory data analysis and data interpretation.
- **Interpretation:**
  - Box: The central box represents the interquartile range (IQR), which contains the middle 50% of the data. The line inside the box denotes the median (50th percentile) of the dataset.
  - Whiskers: The whiskers extend from the edges of the box to the minimum and maximum values within 1.5 times the IQR from the first and third quartiles, respectively. They indicate the range of most of the data points.
  - Outliers: Individual data points lying outside the whiskers are considered outliers and are plotted individually as points. They may represent extreme values or errors in the data.
  - Symmetry and Skewness: The symmetry of the boxplot indicates the symmetry of the data distribution, while asymmetry suggests skewness. For symmetric distributions, the median line is roughly in the middle of the box.
  - Comparative Analysis: Boxplots can be used to compare the distributions of a continuous variable across different groups or categories. Multiple boxplots can be plotted side by side for easy comparison.
  - Variability: The length of the box and the whiskers reflects the variability or spread of the data. Longer whiskers indicate greater variability, while shorter whiskers suggest more tightly clustered data points.
  - Data Spread: The spread of the data within the interquartile range can be assessed by observing the width of the box. A wider box indicates greater variability within the middle 50% of the data.
  - Central Tendency: The median line provides a robust measure of central tendency that is less affected by outliers compared to the mean. It represents the value that divides the dataset into two equal halves.


## Key Features
1. `Datasets:` The repository hosts a diverse range of high-quality datasets sourced from reputable sources, including genomic data, clinical data, imaging data, and more. These datasets cover various cancer types, stages, and demographics, providing valuable resources for analysis and modeling.

2. `Analysis Tools:` A curated selection of analysis tools, scripts, and algorithms tailored for cancer research is included in the repository. These tools assist researchers in processing, analyzing, and interpreting complex datasets, enabling them to uncover patterns, biomarkers, and potential therapeutic targets.

3. `Documentation:` Detailed documentation accompanies the datasets and tools, offering guidance on data formats, preprocessing steps, analysis methodologies, and best practices. This documentation ensures reproducibility and transparency in research efforts and facilitates knowledge sharing among the community.

4. `Tutorials and Examples:` The repository features tutorials, case studies, and example analyses to help users get started with utilizing the datasets and tools effectively. These resources provide step-by-step instructions, code snippets, and visualizations to illustrate common analytical workflows and techniques.

5. `Community Collaboration:` Researchers are encouraged to contribute their own datasets, tools, and insights to the repository, fostering a collaborative environment for knowledge exchange and discovery. Contributions undergo review and validation processes to maintain the quality and integrity of the repository.

6. `Version Control:` The repository leverages version control systems such as Git to track changes, revisions, and contributions over time. This ensures transparency, accountability, and traceability of modifications made to the datasets, tools, and documentation.


