# dimostriamo il kmeans in un caso interessante

data(iris)
summary(iris)

# usiamo soli i dati relativi ai sepali
fiori<-data.frame(x=iris$Sepal.Length,
                  y=iris$Sepal.Width,
                  s=iris$Species)
attach(fiori)
par(mfrow=c(1,2))
plot(x[s=="virginica"],y[s=="virginica"],
     pch=18,col="red",
     xlim=c(4,8),
     ylim=c(1.5,5),
     asp=c(1,1))
points(x[s=="versicolor"],y[s=="versicolor"],
       pch=1,col="blue")
points(x[s=="setosa"],y[s=="setosa"],
       pch=1,col="green",cex=2)

mucchietti<-kmeans(fiori[,1:2],3)
plot(x[mucchietti$cluster==1],y[mucchietti$cluster==1],
     pch=18,col="red",
     xlim=c(4,8),
     ylim=c(1.5,5),
     asp=c(1,1))
points(x[mucchietti$cluster==2],y[mucchietti$cluster==2],
       pch=1,col="blue")
points(x[mucchietti$cluster==3],y[mucchietti$cluster==3],
       pch=1,col="green",cex=2)

sum(as.numeric(
  mucchietti$cluster==1 
  & iris$Species=="virginica"))

sum(as.numeric(
  mucchietti$cluster==3 
  & iris$Species=="versicolor"))

sum(as.numeric(
  mucchietti$cluster==2 
  & iris$Species=="setosa"))

