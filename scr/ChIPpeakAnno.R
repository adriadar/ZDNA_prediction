BiocManager::install("ChIPpeakAnno")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")

library(ChIPpeakAnno)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)

###


peaks <- toGRanges(paste0("C:/", "Users/", "wwsla/", "OneDrive/", "Documents/", 'H2AFZ_bone_marrow_intersect_with_DeepZ.bed'), format="BED")
peaks[1:2]

annoData <- toGRanges(TxDb.Hsapiens.UCSC.hg19.knownGene)
annoData[1:2]


anno <- annotatePeakInBatch(peaks, AnnotationData=annoData, 
                            output="overlapping", 
                            FeatureLocForDistance="TSS",
                            bindingRegion=c(-2000, 300))

anno$symbol <- xget(anno$feature, org.Hs.egSYMBOL)

anno_df <- data.frame(anno)
write.table(anno_df, file=paste0("C:/", "Users/", "wwsla/", "OneDrive/", "Documents/", 'H2AFZ_bone_marrow_intersect_with_DeepZ_genes.txt'),
            col.names = TRUE, row.names = FALSE, sep = '\t', quote = FALSE)

uniq_genes_df <- unique(anno_df['symbol'])
write.table(uniq_genes_df, file=paste0("C:/", "Users/", "wwsla/", "OneDrive/", "Documents/", 'H2AFZ_bone_marrow_intersect_with_DeepZ_genes_uniq.txt'),
            col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)

