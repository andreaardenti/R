# Lezione 4 - Script

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

#quanti elementi di un array hanno una data proprietà
a <- c(1,4,6,1,3)
#quanti di questi numeri sono maggiori di 3?
b <- a[a>3]
length(b)

#oppure (versione abbreviata)
length(a[a>3])

#----------------------------------------------------------------------------------
#carico il dataset di R che si chiama IRIS
data(iris)
#esploro il dataset
summary(iris)

min(iris$Sepal.Length)
boxplot(iris[1:150,1:4]) #escludom la colonna di species

#stesso modo di dichiarare la riga di sopra...
boxplot(iris[1:150, -5])

#plotto differenziando le 3 specie
#prima si prepara il layout del grafico con par(mfrow)
par(mfrow=c(1,3))
#dopo si preparano i boxplot...
boxplot(main="SETOSA", ylab="cm", iris[iris$Species=="setosa",1:4])
boxplot(main="VERSICOLOR", ylab="cm", iris[50:100,1:4])
boxplot(main="VIRGINICA", ylab="cm", iris[100:150,1:4])


#visualizzo i dati in un altro modo, non per specie ma per variabili
attach(iris) #facendo attach, mi posso evitare di scriver ogni volta iris$ e scrivere direttamente Species (ad esempio)
par(mfrow=c(2,2))
boxplot(main="Sepal.length", ylab="cm",
        data.frame(setosa=iris[Species=="setosa",1],
                   versicolor=iris[Species=="versicolor",1],
                   virginica=iris[Species=="virginica",1]))
boxplot(main="Sepal.width", ylab="cm",
        data.frame(setosa=iris[Species=="setosa",2],
                   versicolor=iris[Species=="versicolor",2],
                   virginica=iris[Species=="virginica",2]))
boxplot(main="Petal.length", ylab="cm",
        data.frame(setosa=iris[Species=="setosa",3],
                   versicolor=iris[Species=="versicolor",3],
                   virginica=iris[Species=="virginica",3]))
boxplot(main="Petal.width", ylab="cm",
        data.frame(setosa=iris[iris$Species=="setosa",4],
                   versicolor=iris[iris$Species=="versicolor",4],
                   virginica=iris[iris$Species=="virginica",4]))
detach(iris) #mi scollego col dataset 

plot(iris)

hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)

# densità dei dati
plot(density(iris$Sepal.Length), main="Density Sepal Length", ylim=c(0,1), xlim=c(0,10))
plot(density(iris$Sepal.Width), main="Density Sepal Width", ylim=c(0,1), xlim=c(0,10))
plot(density(iris$Petal.Length), main="Density Petal Length", ylim=c(0,1), xlim=c(0,10))
plot(density(iris$Petal.Width), main="Density Petal Widthh", ylim=c(0,1), xlim=c(0,10))
#cercare il concetto di probabilità

# densità dei dati e fisso io la bandwidth
#plot(density(iris$Sepal.Length, bw=0.1), main="Density Sepal Length", ylim=c(0,1), xlim=c(0,10))
#plot(density(iris$Sepal.Width, bw=0.1), main="Density Sepal Width", ylim=c(0,1), xlim=c(0,10))
#plot(density(iris$Petal.Length, bw=0.1), main="Density Petal Length", ylim=c(0,1), xlim=c(0,10))
#plot(density(iris$Petal.Width, bw=0.1), main="Density Petal Widthh", ylim=c(0,1), xlim=c(0,10))


#resetto il layout
par(mfrow=c(2,2))
myBw <- 0.3
plot(density(iris$Sepal.Length[iris$Species=="setosa"], bw=myBw), col="red", xlim=c(0,10), ylim=c(0,1.2))
points(density(iris$Sepal.Length[iris$Species=="versicolor"], bw=myBw), col="blue", type="l")
points(density(iris$Sepal.Length[iris$Species=="virginica"], bw=myBw), col="green", type="l")

plot(density(iris$Sepal.Width[iris$Species=="setosa"], bw=myBw), col="red", xlim=c(0,10), ylim=c(0,1.2))
points(density(iris$Sepal.Width[iris$Species=="versicolor"], bw=myBw), col="blue", type="l")
points(density(iris$Sepal.Width[iris$Species=="virginica"], bw=myBw), col="green", type="l")

plot(density(iris$Petal.Length[iris$Species=="setosa"], bw=myBw), col="red", xlim=c(0,10), ylim=c(0,1.2))
points(density(iris$Petal.Length[iris$Species=="versicolor"], bw=myBw), col="blue", type="l")
points(density(iris$Petal.Length[iris$Species=="virginica"], bw=myBw), col="green", type="l")

plot(density(iris$Petal.Width[iris$Species=="setosa"], bw=myBw), col="red", xlim=c(0,10), ylim=c(0,1.2))
points(density(iris$Petal.Width[iris$Species=="versicolor"], bw=myBw), col="blue", type="l")
points(density(iris$Petal.Width[iris$Species=="virginica"], bw=myBw), col="green", type="l")














