# Lezione 3a - Script

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

# = e <- sono operatori di assegnazione. # viene usato dentro le parentesi <- fuori le parentesi

#atomi
q<-1
a<-TRUE
m<-"mamma"
d<-1.3

#array o vettori
A<- c(1,2,3,4)
A[2:4]

#array notevoli
C<-rep(2,10) #ripete il primo valore un certo numero di volte
D<-seq(10,20) #genera una sequenza regolare dal numero 10 fino a  ...20 (in questo caso)
E<-seq(10,20,2)
E2<-seq(from=10, to=20, by=2) #stessa dichiarazione della variabile E

G<-runif(n=5,min=0,max=100) #estrae 5 numeri uniformi, compresi tra un min e un max
totale <- 60000
H <- as.integer(runif(n=totale,min=1,max=7))

#quante volte dentro H abbiamo estratto il numero 1?
trovoUno <- H==1
contoUno <- sum(trovoUno)
print(contoUno)
sumH <- sum(H)
print(sumH)

#frequenza = numero di volte in cui c'è uno diviso il totale
frequenzaUno <- (contoUno/totale)
print(frequenzaUno)

#istogramma
hist(H, breaks=c(0,1,2,3,4,5,6), col="green")

#distribuzione Gaussiana (non uniforme)
L <- rnorm(10000, mean=170, sd=20)
hist(L)








