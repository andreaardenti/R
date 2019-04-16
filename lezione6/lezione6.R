#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())



grades <- read.csv("~/Desktop/Esercitazioni/R/lezione6/grades.csv")

#esporiamo il dataset
summary(grades)

a <- grades$Test1

#indicatori centrali
min(a)
m <- mean(a)
median(a)
summary(a)

#indicatori di dispersione
#interquartile - distanza tra il 3° quartile i il 1° quartile
IQR(a)

#varianza - In statistica, con riferimento a una serie di valori, 
#la media dei quadrati degli scarti dei singoli valori dalla loro media aritmetica.
#varianza è una misura di quanto i dati si allontanano dalla media
var(a)

hist(a,8)
plot(density(a))

#deviazione standard = la radice quadrata della varianza
s <- sd(a)

#skewness-  indica se i dati sono bilanciati rispetto alla media
#bilanciamento del dataset
#cerchiamo la funzione skewness tra le librerie di R e la carichiamo...
#in packages si trovano i pacchetti disponibili - se non è presente lo installiamo cliccando nel bottone install

#install.packages("fBasics")
#library("fBasics", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
skewness(a)
kurtosis(a)


#approssimiamo i dati "test1" con una funzione gaussiana di media e deviazione standard uguale a quella calcolata
x <- seq(25,55,0.1)
gaussiana <- (1/sqrt(2*pi*s^2))*exp(-(1/2)*(x-m)^2/s^2)
points(x, gaussiana, type="l", col="red")


#facciamo il plot della densita di tutti i test
plot(density(grades$Test1, bw=5), xlim=c(0,100)) 
d2 <- density(grades$Test2, bw=5)
points(d2$x, d2$y, type="l", col="red")

d3 <- density(grades$Test3, bw=5)
points(d3$x, d3$y, type="l", col="green")

d4 <- density(grades$Test4, bw=5)
points(d4$x, d4$y, type="l", col="blue")

#dobbiamo normalizzare i dati che provengono da test diversi perchè hanno range/scale diverse, 
#li dobbiamo riporta ad una scala unica
#normalizzazione lineare e z-scoring

#primo metodo - NORMALIZZAZIONE LINEARE
#x_normalizzato = x originale meno il minimo, diviso il massimo meno il minimo
#(x_originale - min) / (max-min)

tn1 <- (grades$Test1-min(grades$Test1))/(max(grades$Test1-min(grades$Test1)))
tn2 <- (grades$Test2-min(grades$Test2))/(max(grades$Test2-min(grades$Test2)))
tn3 <- (grades$Test3-min(grades$Test3))/(max(grades$Test3-min(grades$Test3)))
tn4 <- (grades$Test4-min(grades$Test4))/(max(grades$Test4-min(grades$Test4)))
                                                                                  
plot(density(tn1))
d2 <- density(tn2)
points(d2$x, d2$y, type="l", col="red")

d3 <- density(tn3)
points(d3$x, d3$y, type="l", col="green")

d4 <- density(tn4)
points(d4$x, d4$y, type="l", col="blue")


#secondo metodo - NORMALIZZAZIONE Z-SCORE
#quanto si allontanano in nostri dati dalla media se la distribuzione fosse gaussiano
#z-score(x) = x-media/s dove s è la deviazione standard

tz1 <- scale(grades$Test1)
plot(density(tz1, bw=3), ylim=c(0,0.2)) #lo zero stavolta è nella media 
tz2 <- (scale(grades$Test2))
tz3 <- (scale(grades$Test3))
tz4 <- (scale(grades$Test4))

d2 <- (density(tz2, bw=3))
points(d2$x, d2$y, type="l", col="red")
d3 <- (density(tz3, bw=3))
points(d3$x, d3$y, type="l", col="green")
d4 <- (density(tz4, bw=3))
points(d4$x, d4$y, type="l", col="blue")


#effetti dellla normalizzazione
par(mfrow=c(1,2))
plot(grades$Test1, grades$Test4, xlim=c(0,100), ylim=c(0,100))
plot(tz1, tz4, pch=6, col="red", xlim=c(-2,2), ylim=c(-2,2))


Z <- data.frame(tz1,tz2,tz3,tz4)
plot(Z)

#studiamo le relazione tra diverse variabili
#correlazioni - indice di pearson (covarianza diviso le varianze)

cor(tz1,tz2)
cor(Z)
#per essere importante una correlazione deve essere superiore a 0.5 (la scala va da -1 a 1)
par(mfrow=c(1,1))
plot(tz3,tz4)

#regressione lineare - formula di primo grado che mi fa prevedere y dato x
# Y = A *x + B .....A volte x più B

modello <- lm(tz4 ~ tz3) #tz4 in funzione di tz3
modello$coefficients #B è intercepet 

points(tz3, modello$fitted.values, pch=18, col="red")
plot(tz3, modello$residuals) #mostra gli errori del nostro modello
abline(0,0) #plotta la linea orizzontale sullo zero

summary(modello)
#call - il modello è stato creato da tz4 ~ tz3
#residuals - gli errori del modello
#coefficents - restituisce i punti B e A 
#Signif. codes - 3 stelle importante 
#Adjusted R-squared - più vicino è a 1 piu il modello è affidabile (range da 0 a 1) è una misura di quanto il modello è vicino alla realtà
#p-value - vicino allo zero indica che il modello è buono


modello2 <- lm(tz4 ~ tz2)
plot(tz2,tz4)
abline(modello2$coefficients)
#correlazione bassa, modello scadente 
summary(modello2)


