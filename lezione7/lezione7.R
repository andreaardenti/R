#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())



trees <- read.csv("~/Desktop/Esercitazioni/R/lezione7/trees.csv")

#esporiamo il dataset
summary(trees)

#convertiamo in misure metriche internazionali
trees$Girth..in.<-trees$Girth..in.*2.54
trees$Height..ft.<-trees$Height..ft.*30.48

#fattore di conversione di 30.48 al cubo
#quanti centimetri cubi è un piede al cubo?
fattoreconv = 30.48^3
trees$Volume.ft.3.<-trees$Volume.ft.3.*fattoreconv

summary(trees)
boxplot(trees) #disegno inutilizabile, grafico schiacciato
par(mfrow=c(1,3))
boxplot(trees$Girth..in.)
boxplot(trees$Height..ft.)
boxplot(trees$Volume.ft.3.)

#esploriamo le distribuzioni delle tre variabili

#media, varianza, densità
par(mfrow=c(1,1))

#esplorazione densità girth
m<-mean(trees$Girth..in.)
s<-sd(trees$Girth..in.)
plot(density(trees$Girth..in.))

#risultato di mean 33 circa, e di sd 8 circa
#quindi il 60% circa dei nostri modelli risidìede tra (33-8) e (33+8)

#sovrapponiamo la distribuzione gauss sulla density reale
x <- seq(10,60,1)
g <- dnorm(x, mean=m, sd=s)
points(x, g, type="l", col="red")


#esplorazione densità height
m<-mean(trees$Height..ft.)
s<-sd(trees$Height..ft.)
plot(density(trees$Height..ft.))

#risultato di mean 33 circa, e di sd 8 circa
#quindi il 60% circa dei nostri modelli risidìede tra (33-8) e (33+8)

#sovrapponiamo la distribuzione gauss sulla density reale
x <- seq(1500,3000,10)
g <- dnorm(x, mean=m, sd=s)
points(x, g, type="l", col="red")


#esplorazione densità volume
m<-mean(trees$Volume.ft.3.)
s<-sd(trees$Volume.ft.3.)
plot(density(trees$Volume.ft.3.))

#risultato di mean 33 circa, e di sd 8 circa
#quindi il 60% circa dei nostri modelli risidìede tra (33-8) e (33+8)

#sovrapponiamo la distribuzione gauss sulla density reale
x <- seq(0,2.5*10^6,1000)
g <- dnorm(x, mean=m, sd=s)
points(x, g, type="l", col="red")


#studiamo le relazioni tra i dati
plot(trees)

#covarianza
cov(trees)

#una covarianza positiva vuol dire che i miei dati crescono in maniera omogenea x e y crescono in maniera omogenea
#il segno e la grandezza della covarianza ci danno indicazioni tra la grandezza delle dimensioni delle variabili
#per avere il valore più esatto possibile dobbiamo eliminare la scala

cor(trees[,2:4]) #eliminiamo la colonna index nelle correlazioni
plot(trees$Girth..in.,trees$Volume.ft.3.)

#cor ha 3 metodi di calcolo. "pearson" tiene conto di tutto, "kendal" e "spearman" non tengono conto degli outlyers

plot(trees$Girth..in., trees$Height..ft., pch=16, cex=1.5*trees$Volume.ft.3./10^6, xlab="circonferenza", ylab="altezza", col=rgb(0.5, 0.5, 0.50), main="alberi")

#aggiungo il punto medio
points(mean(trees$Girth..in.), mean(trees$Volume.ft.3.), pch=16, cex=1.5*trees$Volume.ft.3./10^6, col="red")

#aggiungo le linee oriz e vert per intercettare il punto medio
abline(mean(trees$Height..ft.), 0, lwd=2, col="blue")
abline(v=mean(trees$Girth..in.), type=4, lty=2, lwd=4, col="cyan")


#cerchiamo di calcolare il volume dell'albero partendo dalla circonferenza
#la regressione lineare

modello <- lm(trees$Volume.ft.3. ~ trees$Girth..in.)    #linear model
modello[["coefficients"]]          #intercept è la costante

plot(trees$Girth..in., trees$Volume.ft.3.)
abline(modello$coefficients, col="blue")
points(trees$Girth..in., modello$fitted.values, col="red")

plot(trees$Girth..in., modello$residuals) #analisi degli errori che si commettono col modello

summary(modello) #il modello è molto vicino a 1 (r-squared è 0.9353) quindi il modello è buono e p-value è prossimo allo zero (0.00000000000000022)
#il signif.codes assegna 3 stelle a intercept e girth, quindi il modello è buono!!!


#regressione MULTIPLA, si costruisce la regressione partendo da due valori non uno solo usa più variabili predittive
#calcolo il volume partendo girth e height
modello2 <- lm(trees$Volume.ft.3. ~ trees$Girth..in.+trees$Height..ft.)
summary(modello2)
#visto che abbiamo 3 coefficenti non possiamo usare abline che ne chiede solo 2

plot(trees$Girth..in., trees$Volume.ft.3.)
points(trees$Girth..in., modello2$fitted.values, col="red")

#creiamo un modello escludendo i valori estremi dei regressori
modello3 <- lm(trees$Volume.ft.3.[4:30] ~ trees$Girth..in.[4:30]+trees$Height..ft.[4:30])
plot(trees$Girth..in., trees$Volume.ft.3.)
points(trees$Girth..in.[4:30], modello3$fitted.values, col="red")

summary(modello3)
