#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

wifi <- read.csv("~/Desktop/Esercitazioni/R/lezione11/NYC_Wi-Fi_Hotspot_Locations.csv")

#costruiamo un data frme + piccolo
d <- data.frame(t=wifi$Type, x=wifi$X, y=wifi$Y, p=wifi$Postcode)

#esploriamo il dataset
summary(d)
d <- na.omit(d) #ripulisco da NA

#eliminiamo dal dataset tutti i codici postali con meno di 5 cifre
d <- d[d$p > 9999,]

summary(d)
plot(d$x, d$y)
points(d$x[d$t=="Free"], d$y[d$t=="Free"], col="red", pch=20, cex=0.3)

#dividiamo gli hotspot per borough
q1 <- kmeans(d[,2:3], 5) #tutte le righe e le colonne da 2 a 3

plot(d$x[q1$cluster==1], 
     d$y[q1$cluster==1], 
     col="black", 
     pch=20, 
     xlim=c(min(d$x), max(d$x)), 
     ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==2], 
       d$y[q1$cluster==2], 
       col="red", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==3], 
       d$y[q1$cluster==3], 
       col="green", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==4], 
       d$y[q1$cluster==4], 
       col="blue", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==5], 
       d$y[q1$cluster==5], 
       col="cyan", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(q1$centers[,1], q1$centers[,2], pch=16, cex=3)

#partizioniamo 
q1 <- kmeans(d[,2:4], 5) #tutte le righe e le colonne da 2 a 3

plot(d$x[q1$cluster==1], 
     d$y[q1$cluster==1], 
     col="black", 
     pch=20, 
     xlim=c(min(d$x), max(d$x)), 
     ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==2], 
       d$y[q1$cluster==2], 
       col="red", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==3], 
       d$y[q1$cluster==3], 
       col="green", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==4], 
       d$y[q1$cluster==4], 
       col="blue", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==5], 
       d$y[q1$cluster==5], 
       col="cyan", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(q1$centers[,1], q1$centers[,2], pch=16, cex=3)

c1x <- mean(wifi$X[wifi$Borough=="MN"])
c1y <- mean(wifi$Y[wifi$Borough=="MN"])
c2x <- mean(wifi$X[wifi$Borough=="BK"])
c2y <- mean(wifi$Y[wifi$Borough=="BK"])
c3x <- mean(wifi$X[wifi$Borough=="BX"])
c3y <- mean(wifi$Y[wifi$Borough=="BX"])
c4x <- mean(wifi$X[wifi$Borough=="QU"])
c4y <- mean(wifi$Y[wifi$Borough=="QU"])
c5x <- mean(wifi$X[wifi$Borough=="SI"])
c5y <- mean(wifi$Y[wifi$Borough=="SI"])

cx <- c(c1x, c2x, c3x, c4x, c5x)
cy <- c(c1y, c2y, c3y, c4y, c5y)

centri <- data.frame(x=cx, y=cy)

#ricreo il tutto usando i miei centri
q1 <- kmeans(d[,2:3], centri) #tutte le righe e le colonne da 2 a 3

plot(d$x[q1$cluster==1], 
     d$y[q1$cluster==1], 
     col="black", 
     pch=20, 
     xlim=c(min(d$x), max(d$x)), 
     ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==2], 
       d$y[q1$cluster==2], 
       col="red", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==3], 
       d$y[q1$cluster==3], 
       col="green", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==4], 
       d$y[q1$cluster==4], 
       col="blue", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(d$x[q1$cluster==5], 
       d$y[q1$cluster==5], 
       col="cyan", 
       pch=20, 
       xlim=c(min(d$x), max(d$x)), 
       ylim=c(min(d$y), max(d$y)))

points(q1$centers[,1], q1$centers[,2], pch=16, cex=3, col="pink")







