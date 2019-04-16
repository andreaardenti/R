#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

#fenomeno a "Quasi Soglia"
homes <- read.csv("~/Desktop/Esercitazioni/R/lezione9/homes.csv")
homes <- na.omit(homes)

#esploriamo il dataset
summary(homes)
plot(homes)
cor(homes)

#analisi dei dati - quale è la probabilità di vendere una casa senza scontarla di più del 5% ???
#sconto = prezzo listini
sconto <- (homes$List - homes$Sell) / homes$List
summary(sconto)

nonScontare <- as.numeric(sconto<0.05)
plot(homes$Living, nonScontare)
plot(homes$Rooms, nonScontare)
plot(homes$Beds, nonScontare)
plot(homes$Acres, nonScontare)

modello <- glm(nonScontare ~ homes$Living+homes$Rooms+homes$Beds+homes$Baths+homes$Age+homes$Acres+homes$Acres+homes$Taxes, family="binomial")
summary(modello)

#principio G.I.G.O - Garbage IN, Garbage OUT
plot(modello$fitted.values, nonScontare)
plot(modello$fitted.values, col=rgb(1-nonScontare, 0, nonScontare), pch=18)



