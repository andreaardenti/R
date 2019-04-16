#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

eurusd <- read.csv("~/Desktop/Esercitazioni/R/personal/eurusd.csv", header=FALSE)
eurusd <- na.omit(eurusd)
gbpusd <- read.csv("~/Desktop/Esercitazioni/R/personal/gbpusd.csv", header=FALSE)
gbpusd <- na.omit(gbpusd)

#esploriamo il dataset
#cor(eurusd,gbpusd)

cor(eurusd$V3,gbpusd$V3)
plot(eurusd$V3, type = "l", ylim = c(1,1.8))
points(gbpusd$V3, type = "l", col="red")

#modello <- lm (eurusd$V3 ~ gbpusd$V3)
#summary(modello)

#plot(density(eurusd$V3))


