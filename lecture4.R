setwd("/Users/dwlakes/Bioinfo2021")


if (!require("BiocManager", quietly = TRUE))    
	install.packages("BiocManager")
BiocManager::install("preprocessCore")
a

library(preprocessCore)

microarray <- read.csv("data/GSE7765-GPL96_series_matrix.txt", 
	skip=69, header=TRUE, sep="\t", row.names=1)

dim(microarray)

boxplot(microarray, las = 2, cex.axis = 0.7)

microarrayLOG <- apply(microarray, 2, log2)

microarrayLOGQnorm <- normalize.quantiles(microarrayLOG)

colnames(microarrayLOGQnorm) <- colnames(microarrayLOG) 
rownames(microarrayLOGQnorm) <- rownames(microarrayLOG) 

clusters <- hclust(dist(t(microarrayLOGQnorm)))
plot(clusters)

scaledVariation <- apply(microarrayLOGQnorm,1,function(x){
  var(x)/mean(x)
 })

plot(scaledVariation)

highlyVariable <- names(which(scaledVariation > 1))
heatmap(microarrayLOGQnorm[highlyVariable,], cexRow = 0.7, cexCol=0.7)