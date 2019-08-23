# to read a tab delimited file as a table and perform PCA on it
# resource from https://planspace.org/2013/02/03/pca-3d-visualization-and-clustering-in-r/

data <- read.table("SiO2.txt", sep="\t", header=TRUE, stringsAsFactor=FALSE)
data.pca <- prcomp(data[,6:14]) #to subset the columns to be included for PCA
screeplot(data.pca)

# to visualise PCA as a 3D plot
# need to install the library rgl
# install.library("rgl")
# might need to install libglu1-mesa-dev
library(rgl)
plot3d(data.pca$x)
text3d(data.pca$x, texts=rownames(data)) # uses default rownames
text3d(data.pca$x, texts=data$Alternate.id) # use names of your choice

# to color data according to your classes,
# add a colour column in your data with the required colors
text3d(data.pca$x, texts=rownames(data), col=data$Color_ph)

# to do a cluster analysis - 5 cluster
set.seed(42)
cl <- kmeans(data[,6:14],5)
plot3d(data.pca$x)
text3d(data.pca$x, texts=data$Alternate.id, col=cl$cluster)

# to do heirarchical clustering
dl <- dist(data[,6:14], method="euclidean")
tree <- hclust(dl, method="ward.D2")
plot(tree, xlab="", labels=data$Alternate.id)
