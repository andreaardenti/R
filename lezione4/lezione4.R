# Lezione 4 - Script

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

province <- read.csv("~/Desktop/Esercitazioni/R/lezione4/province.csv")
plot(province$longitudine, province$latitudine)

head(province) #mostra i primi sei record del file csv
tail(province) #mostra gli ultimi sei campi del file csv
summary(province)

plot(province$longitudine, province$latitudine, main="SICILIA", xlab="LONGITUDINE", ylab="LATITUDINE", cex=2, pch=15, col="hotpink3")
text(province$longitudine, province$latitudine, province$città)


mycolor<-rgb(red=128,green=37,blue=200,maxColorValue=255)

#riga sottostante spostata dalla riga 80, perchè altrimenti non si legge pop
pop <- c(312000,74000, 122000, 235000, 669000, 28000, 63000, 68000, 60000)
province$pop <-pop #aggiunge la variabile pop al dataframe iniziale

plot(province$longitudine, 
     province$latitudine, 
     main="SICILIA", 
     xlab="LONGITUDINE", 
     ylab="LATITUDINE", 
     #cex=2,
     cex=province$pop/100000,
     pch=15, 
     col=mycolor, 
     #xlim = c(11,17), 
     #ylim = c(36,39), 
     asp = c(1,1))
#aggiungo dei segmenti al grafico
lines(x=c(province$longitudine[5], province$longitudine[1]), 
      y=c(province$latitudine[5], province$latitudine[1]))
lines(x=c(province$longitudine[1], province$longitudine[4]), 
      y=c(province$latitudine[1], province$latitudine[4]))
lines(x=c(province$longitudine[4], province$longitudine[2]), 
      y=c(province$latitudine[4], province$latitudine[2]))
lines(x=c(province$longitudine[2], province$longitudine[8]), 
      y=c(province$latitudine[2], province$latitudine[8]))
lines(x=c(province$longitudine[8], province$longitudine[9]), 
      y=c(province$latitudine[8], province$latitudine[9]))
lines(x=c(province$longitudine[9], province$longitudine[3]), 
      y=c(province$latitudine[9], province$latitudine[3]))
lines(x=c(province$longitudine[3], province$longitudine[5]), 
      y=c(province$latitudine[3], province$latitudine[5]))

#per non scrivere tutti gli elementi singolarmente, posso assegnare 
#ad una variabile i punti da collegare con lines, quindi lo passo come parametro a lines...
costa <- c(5,1,4,2,8,9,3,5)
lines(x=province$longitudine[costa], 
      y=province$latitudine[costa],
      type="l",
      lty=3,
      col="red",
      lwd=3)
text(province$longitudine, province$latitudine+0.08, province$città)
points(x=province$longitudine[3],
       y=province$latitudine[3],
       pch=1,
       cex=5,
       col=rgb(0,1,0))

#aggiungo un punto nella cartina
points(14.51,37.23,
       pch=10,
       cex=3,
       col=rgb(0,0,1))
text(14.51,
     37.23+0.07, 
     "CALTAGIRONE",
     cex = 0.7,
     col = "red")


#aggiungo una variabile al dataframe province
pop <- c(312000,74000, 122000, 235000, 669000, 28000, 63000, 68000, 60000)
province$pop <-pop #aggiunge la variabile pop al dataframe iniziale

#aggiungo una variabile al dataframe province
targa <- c("CT", "RG", "SR", "ME", "PA", "EN", "CL", "TP", "AG")

names(pop) <-targa
randomColor <- rgb(red=runif(9), green=runif(9), blue=runif(9))

#plotto un grafico con il solo numero degli abitanti
par(bg="yellow")
barplot(#province$pop, 
        #names.arg = targa,
        main="Abitanti città dei capoluoghi della Sicilia",
        horiz = FALSE,
        sort(pop),
        col=randomColor,
        )

#disegnamo finestre multiple per i grafici
par(mfrow=c(2,2))

















