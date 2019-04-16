#Studiamo la funzione di Gauss 

#rimuove la memoria di tutte le variabili presenti in memoria per partire "puliti"
rm(list = ls())

#fenomeno a "Quasi Soglia"
Admission_Predict <- read.csv("~/Desktop/Esercitazioni/R/lezione9/Admission_Predict.csv")

#esploriamo il dataset
summary(Admission_Predict)

#prendiamo i dati che ci interessano eliminando il resto
d <- data.frame(GRE = Admission_Predict$GRE.Score,
                TOEFL = Admission_Predict$TOEFL.Score,
                uni= Admission_Predict$University.Rating,
                ric = Admission_Predict$Research,
                admit = as.numeric(Admission_Predict$Chance.of.Admit > 0.75))

attach(d)
plot(d)
modello1 <- glm(admit ~ GRE+TOEFL+uni+ric, 
                family="binomial")
summary(modello1)
plot(GRE, modello1$fitted.values)

#semplifico il modello eliminando le variabili meno significative
modello2 <- glm(admit ~ GRE+TOEFL+uni, 
                family="binomial")
summary(modello2)
plot(GRE, modello2$fitted.values)
cor(GRE,TOEFL)

#semplifico ulteriormente il modello eliminando le variabili meno significative
modello3 <- glm(admit ~ GRE+uni, 
                family="binomial")
summary(modello3)
plot(GRE, modello3$fitted.values)



x <- seq(280,340,5)

