#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())


m=0
sigma=1
x <- (seq(-10,10,0.1))
K <- 1/sqrt(2*pi*sigma^2)
G <- K*exp(-(x-m)^2/sigma^2)

plot(x, G, type="l")


m=2
sigma=1 #sigma misura l'ampiezza della curva
x <- (seq(-10,10,0.1))
K <- 1/sqrt(2*pi*sigma^2)
G <- K*exp(-(x-m)^2/sigma^2)

points(x, G, type="l", col="red")


# TEOREMA DEL LIMITE CENTRALE - ENUNCIATO SEMPLICE
# Se y è una variabile che si ottiene come somma di molte variabili x1, x2, ....xn
# e queste variabili xi sono estratte a caso, allora y obbedisce alla formula di gauss

# verifichamo il teorema del limite centrale
# voglio misurare y ...k volte (k=1000)
k <- 10000
# y è la somma di h volte di x, x preso a caso
h <- 1000
y <- rep(0,k)

for (i in seq(1,k)) {
  x <- runif(h)  #estraggo 100 numeri a caso, tra zero e uno
  y[i] <- sum(x)
}

#abbiamo creato mille numeri ottenuti ciascuno come somma di 100 numeri a caso

hist(y)


