rm(list=ls())
library(readr)
dp=read_csv("Data - Parkinsons.txt",col_names = T)
str(dp)
summary(dp)
dp1=dp[,c(-1,-18)]
dp1=scale(dp1)
#data prep and running cluster algo
library(factoextra)
library(NbClust)
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))}
dp1=sapply(dp1, normalize)
nc=NbClust(dp1,min.nc=2,max.nc=5,method = "kmeans")
table(nc$Best.nc[1,])

#view of cluster for diff k
k2 <- kmeans(dp1, centers = 2, nstart = 25)
k3 <- kmeans(dp1, centers = 3, nstart = 25)
k4 <- kmeans(dp1, centers = 4, nstart = 25)
k5 <- kmeans(dp1, centers = 5, nstart = 25)

# plots to compare
p1 <- fviz_cluster(k2, geom = "point", data = dp1) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = dp1) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = dp1) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = dp1) + ggtitle("k = 5")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow = 2)


#The idea of kmeans is to reduce WSS
fviz_nbclust(dp1,kmeans,method="wss")+labs(subtitle = "Elbow method")
#silhotte score
fviz_nbclust(dp1, kmeans, method = "silhouette")
#silhotte score
avg_sil <- function(k) {
  km.res <- kmeans(dp1, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(dp1))
  mean(ss[, 3])
}

# Compute and plot wss for k = 2 to k = 15
k.values <- 2:15

library(cluster)
library(purrr)
# extract avg silhouette for 2-15 clusters
avg_sil_values <- map_dbl(k.values, avg_sil)

plot(k.values, avg_sil_values,
     type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters K",
     ylab = "Average Silhouettes")

#call kmeans funct with 2 cluster
kme.cl=kmeans(dp1,2)
kme.cl
#visulaize the cluster
fviz_cluster(kme.cl,data=dp1,geom = "point",labelsize = 0)
#add another col to the dataframe with clsuter number
dp$cluster=kme.cl$cluster
#perform aggregation
ag=aggregate(dp[,c(-1,-18)],list(dp$cluster),FUN=mean)
ag

table(dp$cluster,dp$status)
dp$cluster=ifelse(dp$cluster==1,0,1)
str(dp)
dp$cluster=as.factor(dp$cluster)
dp$status=as.factor(dp$status)
library(caret)
confusionMatrix(dp$cluster,dp$status,positive = "1")

q()

