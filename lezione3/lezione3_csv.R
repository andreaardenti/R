# Lezione 3b - Script

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

#carico il csv
oaf <- read.csv("~/Downloads/oscar_age_female.csv")

boxplot(oaf$Age)

#breaks è il numero di intervalli tra il valore minimo ed il valore massimo
hist(oaf$Age)
hist(oaf$Age, breaks=20, main="età dell'oscar", col="green", xlab="età attrici", ylab="n.attrici")

plot(oaf$Year, oaf$Age, main="età dell'oscar", xlab="anno oscar", ylab="età attrici")
#text(oaf$Year, oaf$Age, oaf$Name)