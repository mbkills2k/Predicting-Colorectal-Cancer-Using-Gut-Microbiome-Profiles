#' In this notebook, we will retrieve the data by using the package called "cureatedMetagenomicData", which contains the 
#' data from metagenomic studies

# Import necessary libraries
library(curatedMetagenomicData)
library(tidyverse)
library(SummarizedExperiment)
library(here)
library(Matrix)

# Get the data from Feng et al. (2015) study. You can access the original paper from here: https://doi.org/10.1038/ncomms7528
feng <- curatedMetagenomicData::curatedMetagenomicData("FengQ_2015", dryrun = FALSE, rownames = "short")[1]

# Get the count data
sparse_counts <- feng[[1]]@assays@data@listData[["gene_families"]]

row_sums <- Matrix::rowSums(sparse_counts)
top_taxa <- head(order(row_sums, decreasing = TRUE), 500)  # keep top 500 abundant taxa to avoid memory issues
sparse_counts_top <- sparse_counts[top_taxa, ]

# Then convert this smaller matrix to dense
dense_counts <- as.matrix(sparse_counts_top)
dense_counts_top <- as.data.frame(dense_counts)

# Assign row and column names
rownames(dense_counts_top) <- rownames(sparse_counts_top)
colnames(dense_counts_top) <- colnames(sparse_counts_top)

# Fetch the metadata 
metadata <- as.data.frame(feng[[1]]@colData)

# Remove unnecessary columns from metadata
metadata <- metadata %>% 
    dplyr::select(-c(study_name,body_site,antibiotics_current_use,disease,country,hba1c,non_westernized,
                     sequencing_platform,DNA_extraction_kit,PMID,number_reads,number_bases,minimum_read_length,
                     median_read_length,curator,disease_subtype,tnm))

# Write both data to csv files
write_csv(x = metadata, file = "data/metadata.csv", col_names = T, quote = "none")
write.csv(x = dense_counts_top, file = "data/counts.csv", row.names = T, quote = F, col.names = T)
