# incontro del 22 marzo 2019
# esplorazione della foresta 
# come esempio del clustering

# caricamento dati
# dopo averlo eseguito lo commento
# perch? ? comando che richiede molto tempo
# e non voglio eseguirlo se non ne ho bisogno
covtype <- read.csv("~/Downloads/covtype.csv")

summary(covtype)

# presenza di NA?
bosco<-na.omit(covtype)
# tolgo i duplicati per risparmiare memoria
rm(covtype)

# come cambiano le coperture a seconda delle aree wilderness?
# grafico di 4 plot in una finestra che mostra la frequenza
# dei tipi di
# copertura per ciascuna area

# i campioni per ciascuna area quanti sono?
# quanti in wilderness1?
# eccetera...

w1<-sum(bosco$Wilderness_Area1)
w2<-sum(bosco$Wilderness_Area2)
w3<-sum(bosco$Wilderness_Area3)
w4<-sum(bosco$Wilderness_Area4)
w=c(w1,w2,w3,w4)
par(mfrow=c(1,1))
barplot(w)

par(mfrow=c(2,2))
# area 1
Tab1<-table(bosco$Cover_Type[bosco$Wilderness_Area1==1])
plot(Tab1,main="area 1")
# area 2
Tab2<-table(bosco$Cover_Type[bosco$Wilderness_Area2==1])
plot(Tab2,main="area 2")
# area 3
Tab3<-table(bosco$Cover_Type[bosco$Wilderness_Area3==1])
plot(Tab3,,main="area 3")
# area 4
Tab4<-table(bosco$Cover_Type[bosco$Wilderness_Area4==1])
plot(Tab4,main="area 4")

# non mi piacciono gli istogrammi
# ma voglio le torte....
par(mfrow=c(2,2))
# area 1
pie(Tab1,main="area 1",radius=w1/10^5)
# area 2
pie(Tab2,main="area 2",radius=w2/10^5)
# area 3
pie(Tab3,,main="area 3",radius=w3/10^5)
# area 4
pie(Tab4,main="area 4",radius=w4/10^5)

# sul tipo di suolo 1 come si distribuiscono
# le coperture vegetali?
tabella<-table(bosco$Cover_Type[bosco$Soil_Type1==1])

# voglio una tabella di 40 righe (una per ciascun tipo di suolo)
# e di 7 colonne una per ciascun tipo di vegetazione
# ciascune lemento mi dice quanti campioni ci sono
# di ciascuna vegetazione per ciascun tipo di suolo

# ? il momento di usare il mitico ciclo FOR!!!!!!!!

# tipi di vegetazione
tabella<-seq(1,40)
tipoVeg=seq(1,7)
for (j in tipoVeg) # per tipo di veegtazione
{
  conta=rep(0,40) # mantengo il conteggio dei campioni
                  # per quel tipo di vegetazione
  for (indice in seq(1:40)) # per tipo di suolo
    conta[indice]<-sum(bosco[,indice+14]*
                       as.numeric(bosco$Cover_Type==j))
  tabella<-cbind(tabella,conta) 
}  
par(mfrow=c(1,1))
image(tabella)

# esempio banale di k-means
voti<-c(10,7,8,7,2,3,6)
clustering<-kmeans(voti,2)

# provo il clustering facendo scegliere al 
# computer i centroidi 

clustering<-kmeans(bosco[,1:54],7)

#i risultati non sono buoni

# provo a dare io i centroidi
tipo1<-bosco[41,1:54]
tipo2<-bosco[3,1:54]
tipo3<-bosco[1819,1:54]
tipo4<-bosco[1989,1:54]
tipo5<-bosco[1,1:54]
tipo6<-bosco[1869,1:54]
tipo7<-bosco[1655,1:54]
centriIniziali<-rbind(tipo1,tipo2,tipo3,tipo4,tipo5,tipo6,tipo7)

clustering<-kmeans(bosco[,1:54],centriIniziali)
par(mfrow=c(2,1))
hist(bosco$Cover_Type)
hist(clustering$cluster)

hits<-sum(as.numeric(clustering$cluster==bosco$Cover_Type))
#il nostro esempio era interessante 
# ma non era adatto a dimostrare il kmeans