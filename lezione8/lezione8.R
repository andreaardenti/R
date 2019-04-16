#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

g <- read.csv("~/Desktop/Esercitazioni/R/lezione7/grades.csv")

#esporiamo il dataset
summary(g)

#creiamo un array con la media dei voti nei primi 4 test
media <- (g$Test1 + g$Test2 + g$Test3 + g$Test4 + g$Final) / 5
table(g$Grade)

#creiamo un vettore binario di promossi e bocciati - prima abbiamo estratto il vettore dei livelli da grades
#convertendoli in interi, poi abbiamo promosso chi si trova nei primi 5 livelli, bocciato nei successivi
voto <- as.numeric(g$Grade)
promosso <- as.numeric(voto<=5)

plot(media, promosso)

#capiamo come è fatta la media
summary(media)

#probabilità di essere promosso se il voto è tra 11 e 35.50
p1<-sum((promosso==1)&(media<=35.5))/sum(media<=35.5)
p2<-sum((promosso==1)&(media>35.5)&(media<=50))/sum((media>35.5)&(media<=50))
p3<-sum((promosso==1)&(media>50)&(media<=66.6))/sum((media>50)&(media<=66.6))
p4<-sum((promosso==1)&(media>66.6))/sum(media>66.6)


p <- c(p1,p2,p3,p4) 
plot(p, type="l")

#rapporto tra probabilità che accada e probabilità che non accada
odds <- p/(1-p)




